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
	<h1>�����Դϴ�</h1>
	<table border = "1">
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
			<th>�����</th>
		</tr>
		<tr v-for = "(item, index) in list">
			<td>{{item.no}}</td>
			<td>
				<a @click="fnView(item.no)" href="javascript:;">{{item.title}}</a>
				<span v-if="item.commCnt > 0">({{item.commCnt}})</span>
			</td>
			<td>{{item.bUser}}</td>
			<td>{{item.cnt}}</td>
			<td>{{item.cdatetime}}</td>
		</tr>
	</table>
	<div><button @click="fnAdd">�۾���</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		no : "",
		status : "${sessionStatus}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/board/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
        fnView : function(no){
        	$.pageChange("view.do", {no : no});
        },
        fnAdd : function(){
            location.href="add.do";
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>