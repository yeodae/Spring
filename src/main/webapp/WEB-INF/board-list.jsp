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
</head>
<body>
<div id="app">
	<div style="margin-bottom : 5px; margin-left : 2px;">
		<label>����, �ۼ��� : <input v-model="keyword"> 
			<button @click="fnSearch"> �˻� </button>
		</label>
	</div>
	<table>
		<tr>
			<th>����</th>
			<th>No.</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
			<th>��ϳ�¥</th>
		</tr>
		<tr v-for="item in list">
			<td><input type="radio" v-model="idx" :value="item.idx"></td>
			<td>{{item.idx}}</td>
			<td><a @click="fnView(item)" href="javascript:;">{{item.title}}</a></td>
			<td>{{item.cUser}}</td>
			<td>{{item.cnt}}</td>
			<td>{{item.cdatetime}}</td>
		</tr>
	</table>
	<div><button @click="fnRemove">����</button></div>
	<div><button @click="fnMove">�۾���</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		keyword : "",
		idx : ""
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
        fnSearch : function(){
            var self = this;
            var nparmap = {keyword : self.keyword};
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
        fnMove : function(){
        	location.href = "add.do";
        },
        fnRemove : function(){
        	var self = this;
        	if(!confirm("���� �����Ұų�")){
        		return;
        	}
        	var nparmap = {idx : self.idx};
        	$.ajax({
                url : "remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
                	self.fnGetList();
                }
            });
        },
        fnView : function(item){
        	var self = this;
        	self.pageChange("view.do", {idx : item.idx});
        },
        pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
				return;
			}
			var form = document.createElement("form"); 
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
			for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = item;
				input.value = val;
				form.insertBefore(input, null);
			}
			document.body.appendChild(form);
			form.submit();
			document.body.removeChild(form);
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>