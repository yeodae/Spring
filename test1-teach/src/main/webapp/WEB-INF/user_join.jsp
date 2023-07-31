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
	<div><label>* 아이디 : <input type="text" v-model="user.userId"></label> <button @click="fnCheck">중복체크</button></div>
	<div><label>* 비밀번호 : <input type="password" v-model="user.pw1"></label></div>
	<div><label>* 비밀번호 확인: <input type="password" v-model="user.pw2"></label></div>
	<div><label>* 이름 : <input type="text" v-model="user.name"></label></div>
	<div><label>* 핸드폰 : <input type="text" v-model="user.phone"></label></div>
	<div><label>나이 : <input type="text" v-model="user.age"></label></div>
	<div><label>주소 : <input type="text" v-model="user.addr"></label></div>
	<div><button @click="fnJoin">가입하기</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		user : {
			userId : "",
			pw1 : "",
			pw2 : "",
			name : "",
			phone : "",
			age : "",
			addr : ""
		},
		joinFlg : false
	},// data
	methods : {
		fnJoin : function(){
			var self = this;
			if(self.user.userId == ""){
				alert("아이디 입력해라");
				return;
			}
			if(self.user.pw1 == ""){
				alert("패스워드 입력해라");
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("패스워드 확인해라");
				return;
			}
			if(self.user.name == ""){
				alert("이름 입력해라");
				return;
			}
			if(self.user.phone == ""){
				alert("핸드폰 입력해라");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("가입 ㅊㅋ");
                }
            });
		},
		fnCheck : function(){
			var self = this;
			var nparmap = {userId : self.user.userId};
            $.ajax({
                url : "check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		alert("중복된 아이디 있음");
                	} else {
                		alert("사용 가능");
                		self.joinFlg = true;
                	}
                }
            });
		}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>