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
	<div>
		<label>제목 : <input v-model="title"></label>
	</div>
	<div>
		<textarea rows="10" cols="30" v-model="content"></textarea>
	</div>
	<button @click="fnAdd">등록</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		title : "",
		content : "",
		cUser : "${sessionId}"
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
                	self.list = data.boardList;
                	console.log(self.list);
                }
            }); 
        },
		fnAdd : function(){
            var self = this;
            var nparmap = {title : self.title, content : self.content, cUser : self.cUser};
            //cUser = 작성자 추가 
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("등록 완료");
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