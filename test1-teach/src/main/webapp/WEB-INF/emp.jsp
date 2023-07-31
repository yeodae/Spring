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
	th, td{
		padding : 5px 10px;
	}
</style>
</head>
<body>
<div id="app">
	<table border="1">
		<tr>
			<th>���</th>
			<th>�̸�</th>
			<th>����</th>
			<th>�޿�</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<!-- <tr v-for="(item, index) in list">
			<td>{{item.empno}}</td>
			<td>
				<span v-if="editIndex == index"><input :value="item.ename"></span>
				<span v-else>{{item.ename}}</span>
			</td>
			<td>
				<span v-if="editIndex == index"><input :value="item.job"></span>
				<span v-else>{{item.job}}</span>
			</td>
			<td>
				<span v-if="editIndex == index"><input :value="item.sal"></span>
				<span v-else>{{item.sal}}</span>
			</td>
			<td><button @click="fnRemove(item.empno)">����</button></td>
			<td>
				<button v-if="editIndex == index" @click="editIndex = index">����</button>
				<button v-else @click="editIndex = index">����</button>
			</td>
		</tr> -->
		
		
		<tr v-for="(item, index) in list">
			<template v-if="!item.editFlg">
				<td>{{item.empno}}</td>
				<td>{{item.ename}}</td>
				<td>{{item.job}}</td>
				<td>{{item.sal}}</td>
				<td><button @click="fnRemove(item.empno)">����</button></td>
				<td><button @click="item.editFlg = true">����</button></td>
			</template>
			
			<template v-else>
				<td>{{item.empno}}</td>
				<td><input v-model="item.ename"></td>
				<td><input v-model="item.job"></td>
				<td><input v-model="item.sal"></td>
				<td><button @click="fnRemove(item.empno)">����</button></td>
				<td>
					<button @click="fnEdit(item)">����</button>
					<button @click="item.editFlg = false">���</button>
				</td>
			</template>
		</tr>
	</table>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		editIndex : 9999
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "emp/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.empList;
                	console.log(self.list);
                }
            }); 
        },
        fnRemove : function(empno){
        	var self = this;
        	if(!confirm("���� �����Ұų�")){
        		return;
        	}
            var nparmap = {empno : empno};
            $.ajax({
                url : "emp/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
                	self.fnGetList();
                }
            });
        }
        , fnEdit : function(item){
        	var self = this;
        	if(!confirm("���� �����Ұų�")){
        		return;
        	}
            var nparmap = item;
            $.ajax({
                url : "emp/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
                	self.fnGetList();
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
