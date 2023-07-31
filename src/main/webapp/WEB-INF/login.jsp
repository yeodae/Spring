<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>�α���������</title>
<style>
</style>
</head>
<body>
<div id="app">
	<h1>�α����Դϴ�.</h1>
	<div><label>���̵� : <input v-model="userId"></label></div>
	<div><label>�н����� : <input type="password" v-model="pwd"></label></div>
	<div>
		<button @click="fnLogin">�α���</button>
		<button>ȸ������</button>
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
		pwd : ""
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
                data : param, // �� �Ķ��̸��� �����־�� �Ѵ�.
                success : function(data) { 
                	if(data.success){
                		alert(data.message);
                		location.href="main.do";
                	}else{
                		alert(data.message);
                		//���̵� ���� ���
                		//��й�ȣ�� �ٸ� ���
                	}
                	//self.list = data.list;
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