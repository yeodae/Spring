<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day3</title>
<style>
	table, th, tr{
		border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
	}
	td, th{
		 padding : 10px;
	}
</style>
</head>
<body>
<div id="app">
	<div>
		<label>제목, 작성자 : <input type="text" v-model="keyword"></label>
		<button @click="fnSearch">검색</button>
	</div>
		<div>
			<table border="1">
				<tr>
					<th></th>
			 		<th>No</th>
			 		<th>제목</th>
			 		<th>작성자</th>
			 		<th>조회수</th>
			 		<th>등록날짜</th>
			 	</tr>
			 	<tr v-for="item in list" v-if="search == '' ? true : item.title == search || item.cuser == search">
			 		<td><input type="radio" v-model="idx" :value="item.idx"></td>
			 		<td>{{item.idx}}</td>
			 		<td><a @click="fnView(item)" href="javascript:;">{{item.title}}</a></td>
			 		<td>{{item.cuser}}</td>
			 		<td>{{item.cnt}}</td>
			 		<td>{{item.cdatetime}}</td>
			 	</tr> 	
			</table>
			
			<div><button @click="fnInsert">글등록</button>
				<button @click="fnRemove(idx)">삭제</button></div>
		</div>
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		search : "",
		keyword : "",
		idx : ""
    }   
    , methods: {
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
	                console.log(data);
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
	                console.log(data);
                }
            }); 
        },
        fnInsert : function(){
           location.href = "add.do";
        },
        fnRemove : function(idx){
        	var self = this;
        	if(!confirm("정말 삭제하시겠습니까?")){
        		return;
        	}
            var nparmap = {idx : self.idx};
            console.log(idx);
            $.ajax({
                url : "remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	self.fnGetList();
                }
            });
        },
		fnView : function(item){
			var self = this;
			self.pageChange("view.do", {idx : item.idx});
			var nparmap = {idx : item.idx};
			 $.ajax({
	                url : "/board/view.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.fnGetList();
	                }
	            });
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
		},
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>