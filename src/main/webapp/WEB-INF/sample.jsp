<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="app">
	<div><input v-model="name" @keyup.enter="fnClick"><button @click="fnClick">클릭</button></div>	
	<div><input v-model="stuNo" @keyup="fnGetList" placeholder="학번"><!-- <button @click="fnGetList">중복체크</button> --></div>
	<div v-if="stuNo.length > 0">
		<span v-if="list.length == 0" style="color : blue;" >사용가능한 아이디입니다.</span>
		<span v-else style="color : red;">중복된 아이디가 있습니다.</span>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		name : "",
		stuNo : "",
		list : [],
		stuNoFlg : false
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {stuNo : self.stuNo};
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
		fnClick : function(){
			var self = this;
			alert(self.name + "님 안녕하세요!");
		}
	}, // methods
	created : function() {
		// alert("어서오세요!");
	}// created
});
</script>






