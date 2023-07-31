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
	<div style="margin-bottom : 5px;">
		<label>검색 : <input v-model="keyword" @keyup.enter="fnGetList"></label>
		<select v-model="pass">
			<option value="">전체</option>
			<option value="P">합격(60점 이상)</option>
			<option value="F">불합격(60점 미만)</option>
		</select>
		<button @click="fnGetList">검색</button>
	</div>
	
	<table>
		<tr>
			<th></th>
			<th>학번</th>
			<th>이름</th>
			<th>점수</th>
			<th>수정</th>
		</tr>
		<tr v-for="item in list">
			<td><input type="radio" v-model="stuNo" :value="item.stuNo" name="stuNo"> </td>
			<td>{{item.stuNo}}</td>
			<td>{{item.stuName}}</td>
			<td>{{item.avgGrade}}</td>
			<td><button @click="fnEdit(item)">수정</button></td>
		</tr>
	</table>
	<button @click="fnRemove">삭제</button>
	<button @click="fnSearch">상세보기</button>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		stuNo : "",
		info : {},
		keyword : "",
		pass : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.keyword, pass : self.pass};
            $.ajax({
                url : "enrolList.dox",
                dataType:"json",	
                type : "POST",
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	console.log(self.list);
                	
                }
            }); 
        },
        fnRemove : function(){
            var self = this;
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "enrolRemove.dox",
                dataType:"json",	
                type : "POST",
                data : nparmap,
                success : function(data) { 
                	alert("완료");
                	self.fnGetList();
                }
            }); 
        },
        fnSearch : function(){
            var self = this;
            self.pageChange("userInfo.do", {stuNo : self.stuNo});
        },
        fnEdit : function(item){
        	var self = this;
        	var name = prompt("현재 이름 :" + item.stuName + "\n 수정할 이름을 입력하세요.");
        	if(name == undefined || name == null){
        		return;
        	}
        	var nparmap = {stuName : name, stuNo : item.stuNo};
        	$.ajax({
                url : "enrolEdit.dox",
                dataType:"json",	
                type : "POST",
                data : nparmap,
                success : function(data) { 
                	alert("완료");
                	self.fnGetList();
                }
            }); 
        }
        , pageChange : function(url, param) {
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