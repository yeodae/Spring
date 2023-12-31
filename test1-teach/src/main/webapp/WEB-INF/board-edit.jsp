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
		<label>제목 : <input v-model="info.title"></label>
	</div>
	<div>
		<textarea rows="10" cols="30" v-model="info.content"></textarea>
	</div>
	<button @click="fnAdd">등록</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		idx : "${map.idx}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {idx : self.idx};
            $.ajax({
                url : "view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	self.info = data.info;
                }
            }); 
        },
		fnAdd : function(){
            var self = this;
            var nparmap = self.info;
            $.ajax({
                url : "edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("등록 완료");
                	location.href="list.do";
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