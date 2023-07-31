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
	table{
		text-align : center;
	}
	td, th {
		padding : 0px 10px;
	}
</style>
</head>
<body>
<div id="app">
	<table border="1">
		<tr>
			<th>����</th>
			<th>No.</th>
			<th>�й�</th>
			<th>�̸�</th>
			<th>�а�</th>
			<th>�������</th>
		</tr>
		<tr v-for="(item, index) in list" >
			<td><input type="radio" v-model="stuNo" :value="item.stuNo" name="stuNo"></td>
			<td>{{index + 1}}</td>
			<td>{{item.stuNo}}</td>
			<td>{{item.stuName}}</td>
			<td>{{item.stuDept}}</td>
			<td>{{item.avgGrade}}</td>
		</tr>
	</table>
	<button @click="fnSearch">����</button>
	<button @click="fnRemove">����</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		info : {},
		stuNo : ""
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
                	self.list = data.list;
                }
            }); 
        },
        
        fnGetList2 : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "list2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnSearch : function(){
        	var self = this;
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "stu/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                	console.log(data);
                }
            });
        },
        fnRemove : function(){
        	var self = this;
        	if(!confirm("���� �����Ұų�")){
        		return;
        	}
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "stu/remove.dox",
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






