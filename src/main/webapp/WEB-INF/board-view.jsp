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
	a {
		text-decoration : none;
		color : tomato;
	}
</style>
</style>
</head>
<body>
<div id="app">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		<tr>
			<td>{{info.no}}</td>
			<td>{{info.title}}</td>
			<td><pre v-html="info.contents"></pre></td>
			<td>{{info.bUser}}</td>
			<td>{{info.cdatetime}}</td>
		</tr>
	</table>
	<button style="margin-top : 5px;">삭제하기</button>
	<button style="margin-top : 5px;" @click="fnEdit">수정하기</button>
	<hr>
	<div v-for="(item, index) in commentList">
		<input v-if="status == 'A'" type="checkbox" :value="item.cNo" v-model="selectComment">
		<span>[ {{item.cUser}} ] : </span>
		<span style="width : 300px; display: inline-block;">
			{{item.comm}} 
			<a @click="fnRemove(item.cNo)" href="javascript:;" v-if="item.cUser == uId || status == 'A'">
				<i class="fa-solid fa-circle-xmark fa-xs"></i>
			</a> 
		</span>
		<span >{{item.cdatetime}}</span>
	</div>
	<div v-if="status == 'A'">
		<button @click="fnCommentRemove">댓글삭제</button>
	</div>
	<hr>
	<div>
		<textarea rows="3" cols="40" v-model="comment" @keyup.enter="fnComment"></textarea>
		<button style="vertical-align: middle; margin-bottom: 35px;" @click="fnComment">댓글 등록</button>
	</div>
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
		status : "${sessionStatus}",
		selectComment : []
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {no : self.no};
			$.ajax({
                url : "view.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.info = data.info;
                	self.commentList = data.commentList;
                }
            }); 
		},
		
		fnComment : function(){
			var self = this;
			var param = {no : self.no, comment : self.comment, uId : self.uId};
			$.ajax({
                url : "comment.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("등록되었습니다.");
                	self.comment = "";
                	self.fnGetList();
                }
            }); 
		},
		fnRemove : function(cNo){
			var self = this;
			if(!confirm("정말 삭제할거냐")){
				return;
			}
			var param = {cNo : cNo};
			$.ajax({
                url : "c_remove.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었습니다..");
                	self.fnGetList();
                }
            }); 	
		}
		, fnEdit : function(){
			$.pageChange("edit.do", {no : this.no});
		}
		, fnCommentRemove : function(){
			var self = this;
			if(!confirm("정말 삭제할거냐?")){
				return;
			}
			var commentList = JSON.stringify(self.selectComment);
			var param = {commentList : commentList};
			$.ajax({
                url : "removecomment.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("삭제되었다!");
                	self.fnGetList();
                	self.selectComment = [];
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