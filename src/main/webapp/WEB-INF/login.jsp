<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="EUC-KR">
<title>로그인페이지</title>
<style>
</style>
</head>
<body>
<div id="app">
	<h1>로그인페이지</h1>
	<div><label>아이디 : <input v-model="userId" @keyup.enter="fnLogin"></label></div>
	<div><label>패스워드 : <input type="password" v-model="pwd" @keyup.enter="fnLogin"></label></div>
	<div>
		<button @click="fnLogin"><i class="fa-solid fa-right-to-bracket fa-shake"></i></button>
		<button @click="fnJoin">회원가입</button>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		userId : "",
		pwd : "",
		status : "${sessionStatus}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
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
        fnLogin : function(){
        	var self = this;
        	var param = {userId : self.userId, pwd : self.pwd};
        	$.ajax({
                url : "login.dox",
                dataType:"json",	
                type : "POST", 
                data : param, // 위 파람이름과 맞춰주어야 한다.
                success : function(data) { 
                	if(data.success){
                			alert(data.message);
                				location.href="main.do";	
                	}else{
                		alert(data.message);
                		//아이디가 없을 경우
                		//비밀번호가 다를 경우
                	}
                	//self.list = data.list;
                }
            }); 
        },
        fnJoin : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	location.href="join.do";
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>