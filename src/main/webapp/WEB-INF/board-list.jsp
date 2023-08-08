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
	<table border="1">
		<tr>
			<th></th>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
			<th>�����</th>
		</tr>
		<tr v-for="(item, index) in list">
			<td><input type="checkbox" :value="item.no" v-model="selectItem"></td>
			<td>{{item.no}}</td>
			<td>
				<a href="javascript:;" @click="fnView(item.no)">{{item.title}}</a>
				<span v-if="item.commCnt > 0">({{item.commCnt}})</span>
			</td>
			<td>{{item.bUser}}</td>
			<td>{{item.cnt}}</td>
			<td>{{item.cdatetime}}</td>
		</tr>
	</table>
	<button @click="fnAdd">�۾���</button>
	<button @click="fnRemove">����</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		selectItem : []
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                }
            }); 
		}
		, fnView : function(no){
			$.pageChange("view.do", {no : no});
		}
		, fnAdd : function(){
			location.href = "add.do";
		}
		, fnRemove : function(){
			var self = this;
			if(!confirm("���� �����Ұų�?")){
				return;
			}
			var noList = JSON.stringify(self.selectItem);
			var param = {selectItem : noList};
			$.ajax({
                url : "remove.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("�����Ǿ���!");
                	self.fnGetList();
                	self.selectItem = [];
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