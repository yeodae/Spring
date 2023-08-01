<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<h1>유저리스트입니다..</h1>
	<table border=1>
		<tr>
			<th>선택</th>
			<th>No.</th>
			<th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>나이</th>
			<th>주소</th>
			<th>해제</th>
			<th>정지여부</th>
		</tr>
		<tr v-for="(item, index) in list">
			<td><input type="checkbox" :value="item.uId" v-model="userList"></td>
			<td>{{index+1}}</td>
			<td >{{item.uId}}</td>
			<td>{{item.uName}}</td>
			<td>{{item.phone}}</td>
			<td>{{item.age}}</td>
			<td>{{item.addr}}</td>
			<td><button v-if="item.cnt >= 5" @click="fnBan(item)">해제</button></td>
			<td><button v-if="item.banyn == 'N'" @click="fnBan(item, 'Y')">정지</button>
				<button v-else @click="fnBan(item, 'N')">정지해제</button></td>
		</tr>
	</table>
	<button @click="fnTest">확인용 버튼</button>
	<button @click="fnCancel">전체해제</button>
	<button @click="fnAllSelect">전체선택</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		userList : [],
		status : "${sessionStatus}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {status : self.status};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;                	
                }
            }); 
        },
        fnBan : function(item){
            var self = this;
            var nparmap = {userId : item.uId};
            $.ajax({
                url : "reset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("해제 되었습니다.");
                	self.list = data.list;        
                	self.fnGetList();
                }
            }); 
        },
        fnBan : function(item,banyn){
            var self = this;
            var nparmap = {userId : item.uId, banyn : banyn};
            $.ajax({
                url : "ban.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("변경 되었습니다.");
                	self.list = data.list;        
                	self.fnGetList();
                }
            }); 
        },
        fnTest : function(){
        	var self = this;
        	console.log(self.userList);
        },
        fnCancel : function(){
        	var self = this;
        	self.userList = []
        },
        fnAllSelect: function(){
        	var self = this;
        	self.userList = []
        	for(var i=0; i<self.list.length; i++){
        		self.userList.push(self.list[i].uId);
        		
       	 	}
        }
        
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
		/* if(self.status != 'A'){
			alert("권한 없음");
			location.href="../main.do"
		} */
	}// created
});
</script>