<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
 i{
 	text-decoration : none;
 	color : black;
 }
</style>
</head>
<body>
<div id="app">
	<h1>���Դϴ�</h1>
	<div>No : {{info.no}}</div>
	<div>���� : {{info.title}}</div>
	<div>���� : {{info.contents}}</div>
	<hr>
	<div v-for="(item, index) in commentList">
		<span>[ {{item.cUser}} ] : </span>
		<span v-if="item.delyn == 'N'" style="width : 300px; display: inline-block;">{{item.comm}} 
			<a v-if = "item.cUser==uId || item.status=='A'" @click="fnDel(item,'Y')" href="javascript:;"><i class="fa-regular fa-circle-xmark fa-fade"></i></a>
		</span>
		<span >{{item.cdatetime}}</span>
	</div>
	<hr>
	<div>
		<textarea rows="3" cols="40" v-model="comment" @keyup.enter="fnComment"></textarea>
		<button style="vertical-align: middle; margin-bottom: 35px;" @click="fnComment"><i class="fa-regular fa-comment fa-shake"></i></button>
	</div>
	<div><button v-if="info.bUser == uId" @click="fnEdit">���� ����</button>
		 <button v-if="info.bUser == uId" @click="fnDelete">�ۻ���</button>
		 <button @click="fnBack">������</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		no : "${map.no}",
		comment : "",
		commentList : [],
		uId : "${sessionId}",
		status : "${sessionStatus}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {no : self.no};
            $.ajax({
                url : "view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                	console.log(self.info);
                	self.commentList = data.commentList;
                }
            }); 
        },
        fnComment : function(){
            var self = this;
            var nparmap = {no : self.no ,comment : self.comment, uId : self.uId};
            $.ajax({
                url : "comment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("��ϵǾ����ϴ�.");
                	self.comment = "";
                	self.fnGetList();
                }
            }); 
        },
        fnDel : function(item,delyn){
            var self = this;
            if(!confirm("����� ������?")){
            	return;
            }
            var nparmap = {cNo : item.cNo, delyn : delyn};
            $.ajax({
                url : "remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("���� �Ǿ����ϴ�.");
                	self.info = data.info;
                	self.fnGetList();
                }
            }); 
        },
        fnBack : function(){
        	location.href="list.do";
        },
        fnEdit : function(){
        	var self = this;
            $.pageChange("edit.do",{no : self.no});
        },
        fnDelete : function(){
        	var self = this;
        	if(!confirm("���� ����?")){
        		return;
        	}
        	var nparmap = {no : self.no};
        	$.ajax({
                url : "delete.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
                	location.href="list.do";
                	
                }
            });
        },
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>