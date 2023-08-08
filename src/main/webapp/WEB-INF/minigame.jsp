<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div>�̴ϰ��� 1.</div>
	<div>���� ���� ã��(1~100)</div>
	<div><input type="number" v-model="num"><button @click="fnCheck">����</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		random : 0,
		cnt : 0,
		num : ""
	},// data
	methods : {
		fnGame : function(){
			var self = this;
			self.random = Math.floor(Math.random() * 100) + 1;
			console.log(self.random);
		},
		fnCheck : function(){
			var self = this;
			if(self.num < 0 || self.num > 100){
				alert("1���� 100���� �� �Է�");
				return;
			}
			self.cnt++;
			if(self.random == self.num){
				alert("����!!\n" + self.cnt + "������ ���߼̽��ϴ�.");
				self.fnGame();
				self.num = "";
			} else if(self.random > self.num){
				alert("UP!");
			} else {
				alert("DOWN");
			}
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGame();
	}// created
});
</script>