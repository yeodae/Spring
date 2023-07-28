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
	
</style>
</head>
<body>
<div id="app">
		<h1>우와 금요일이다!</h1>
		<table border="1">
			<tr>
				<th></th>
				<th>학번</th>
				<th>이름</th>
				<th>평균점수</th>
				<th>수정</th>
			</tr>
			<tr v-for = "item in list">
				<td><input type="radio" v-model="stuNo" :value="item.stuNo" name="qq"></td>
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.avgGrade}}</td>
				<td><button @click="fnEdit(item)">수정</button></td>
			</tr>
		</table>
		<button @click="fnDelete">학생삭제</button>
		<button @click="fnRemove">성적삭제</button>
		<button @click="fnSearch">상세보기</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		stuNo : "",
		info : {},
		name : ""
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "enrolList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                self.list = data.enrolList;
                }
            }); 
        },
        fnDelete : function(){
            var self = this;
            if(!confirm("정말 삭제하시겠습니까?")){
            	return;
            }
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "/stu/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("삭제되었습니다.");
	                self.fnGetList();
                }
            }); 
        },
        fnRemove : function(){
            var self = this;
            if(!confirm("정말 삭제하시겠습니까?")){
            	return;
            }
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "/enrol/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("삭제되었습니다.");
	                self.fnGetList();
                }
            }); 
        },
        fnSearch : function(){
            var self = this;       
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "/enrol/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                	self.fnGetList();
                	alert("이름 : "+self.info.stuName+
                		 "\n학과 : "+self.info.stuDept+
                		 "\n키 : "+self.info.stuHeight+
                		 "\n체중 : "+self.info.stuWeight);
                	self.stuNo = "";
                }
            }); 
        },
        fnEdit : function(item){
        	var self = this;
        	var name = prompt("현재 이름 : "+item.stuName+"\n수정할 이름을 입력해주세요");
        	if(name == undefined || name == null){
        		return;
        	}
        	var nparmap = {stuNo : item.stuNo, stuName : name};
        	 $.ajax({
                 url : "/enrol/edit.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
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