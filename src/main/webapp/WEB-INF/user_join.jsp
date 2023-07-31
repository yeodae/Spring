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
	<div><label>* ���̵� : <input type="text" v-model="user.userId"></label> <button @click="fnCheck">�ߺ�üũ</button></div>
	<div><label>* ��й�ȣ : <input type="password" v-model="user.pw1"></label></div>
	<div><label>* ��й�ȣ Ȯ��: <input type="password" v-model="user.pw2"></label></div>
	<div><label>* �̸� : <input type="text" v-model="user.name"></label></div>
	<div><label>* �ڵ��� : <input type="text" v-model="user.phone"></label></div>
	<div><label>���� : <input type="text" v-model="user.age"></label></div>
	<div><label>�ּ� : <input type="text" v-model="user.addr"></label></div>
	<div><button @click="fnJoin">�����ϱ�</button></div>
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
				alert("���̵� �Է��ض�");
				return;
			}
			if(self.user.pw1 == ""){
				alert("�н����� �Է��ض�");
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("�н����� Ȯ���ض�");
				return;
			}
			if(self.user.name == ""){
				alert("�̸� �Է��ض�");
				return;
			}
			if(self.user.phone == ""){
				alert("�ڵ��� �Է��ض�");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("���� ����");
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
                		alert("�ߺ��� ���̵� ����");
                	} else {
                		alert("��� ����");
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