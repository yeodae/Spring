<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day2 stuNoflg</title>
</head>
<body>
<div id="app">
	<div>
	<input v-model="name" @keyup.enter="fnClick">
	<button @click="fnClick">Ŭ��</button>
	</div>
	<div>
	<input v-model="stuNo" placeholder="�й�" @keyup="fnClick">
	<!-- <button @click="fnClick">�ߺ�üũ</button> -->
		<div v-if="stuNo.length > 0 ">
			<span v-if="list.length == 0" style="color:blue;">��밡���� ���̵� �Դϴ�.</span>
			<span v-else style="color:red;">�ߺ��� ���̵� �Դϴ�.</span>
		</div>
	</div>		
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		name : "",
		stuNo : "",
		stuNoflg : false
	},// data
	methods : {
		fnClick : function(){
			var self = this;
			/* if(self.stuNo.length == 0){
				alert("�й��� �Է��ϼ���");
				return; // �� �����ֱ�
			} */
			self.stuNoflg = true; //�ϳ����Է½� ȭ�����
			//alert(self.name + "�� �ȳ��ϼ���!");
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
	} // methods
	,created : function() {
		//alert("�������!");
	}// created
});
</script>