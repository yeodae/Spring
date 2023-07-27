<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day3</title>
<style>
	th, td{
		padding : 5px 10px;
	}
</style>
</head>
<body>
<div id="app">
		<table border="1">
		<tr>
			<th></th>
			<th>학번</th>
			<th>이름</th>
			<th>아이디</th>
			<th>학년</th>
			<th>전화번호</th>
		</tr>
		<tr v-for="item in list">
				<td><input type="radio" v-model="studNo" :value="item.studNo"></td>
				<td >{{item.studNo}}</td>
				<td>{{item.name}}</td>
				<td>{{item.id}}</td>
				<td>{{item.grade}}</td>
				<td>{{item.tel}}</td>
				
		</tr>
	</table>
	<button @click="fnRemove(studNo)">삭제</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		studNo : ""
		
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/lastStudent/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                self.list = data.list;
                }
            }); 
        },
        fnRemove : function(studNo){
        	var self = this;
        	if(!confirm("정말 삭제하시겠습니까?")){
        		return;
        	}
            var nparmap = {studNo : self.studNo};
            console.log(studNo);
            $.ajax({
                url : "/lastStudent/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	self.fnGetList();
                }
            });
        }
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>