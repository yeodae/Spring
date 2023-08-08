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
	<div>미니게임 1.</div>
	<div>랜덤 숫자 찾기(1~100)</div>
	<div><input type="number" v-model="num"><button @click="fnCheck">선택</button></div>
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
				alert("1부터 100사이 값 입력");
				return;
			}
			self.cnt++;
			if(self.random == self.num){
				alert("정답!!\n" + self.cnt + "번만에 맞추셨습니다.");
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