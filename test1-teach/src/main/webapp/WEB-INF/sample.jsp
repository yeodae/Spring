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
	<div><input v-model="name" @keyup.enter="fnClick"><button @click="fnClick">Ŭ��</button></div>	
	<div><input v-model="stuNo" @keyup="fnGetList" placeholder="�й�"><!-- <button @click="fnGetList">�ߺ�üũ</button> --></div>
	<div v-if="stuNo.length > 0">
		<span v-if="list.length == 0" style="color : blue;" >��밡���� ���̵��Դϴ�.</span>
		<span v-else style="color : red;">�ߺ��� ���̵� �ֽ��ϴ�.</span>
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
			alert(self.name + "�� �ȳ��ϼ���!");
		}
	}, // methods
	created : function() {
		// alert("�������!");
	}// created
});
</script>






