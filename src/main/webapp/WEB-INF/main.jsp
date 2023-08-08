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
<style>
	table{
		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
</style>
</head>
<body>
<div id="app">
	<button @click="fnBoard">게시판으로</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
	},// data
	methods : {
		fnBoard : function(){
			location.href = "board/list.do"
		}		
		
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>