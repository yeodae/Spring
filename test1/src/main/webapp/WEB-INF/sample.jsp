<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day2 stuNoflg</title>
</head>
<body>
<div id="app">
	<div>
	<input v-model="name" @keyup.enter="fnClick">
	<button @click="fnClick">클릭</button>
	</div>
	<div>
	<input v-model="stuNo" placeholder="학번" @keyup="fnClick">
	<!-- <button @click="fnClick">중복체크</button> -->
		<div v-if="stuNo.length > 0 ">
			<span v-if="list.length == 0" style="color:blue;">사용가능한 아이디 입니다.</span>
			<span v-else style="color:red;">중복된 아이디 입니다.</span>
		</div>
	</div>		
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		name : "",
		stuNo : "",
		stuNoflg : false
	},// data
	methods : {
		fnClick : function(){
			var self = this;
			/* if(self.stuNo.length == 0){
				alert("학번을 입력하세요");
				return; // 빈값 조건주기
			} */
			self.stuNoflg = true; //하나라도입력시 화면출력
			//alert(self.name + "님 안녕하세요!");
			var nparmap = {stuNo : self.stuNo};
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
	} // methods
	,created : function() {
		//alert("어서오세요!");
	}// created
});
</script>