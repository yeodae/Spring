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
	<h1>minigame</h1>
	<h2>랜덤 숫자 찾기 (0~100)</h2>
	<input v-model="num" @keyup.enter="lego"><button @click="lego">검색</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		cnt : 0,
		num : "",
		ran : 0
		
	},// data
	methods : {
		fnGame : function(){
			var self = this;
			self.ran = Math.floor(Math.random() * 100) +1;
			console.log(self.ran);
		},
		lego : function(){
            var self = this;
         
            if(self.num < 0 || self.num > 100){
            	alert("1부터 100까지 입력하세요.");
            	return;	
            } 
            
            self.cnt++;
            
            if(self.ran == self.num){
            	alert("정답!!\n"+self.cnt+"번만에 맞추셨습니다.");
            	self.fnGame();
            	self.num="";
            }else if(self.ran > self.num){
            	alert("UP!");
            }else{
            	alert("Down!");
            }
            }
	}, // methods
	created : function() {
		var self = this;
		self.fnGame();
		
	}// created
});
</script>