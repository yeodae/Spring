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
	<div>제목 : {{info.title}}</div>
	<div>작성자 : {{info.cUser}}</div>
	<div>작성날짜 : {{info.cdatetime}}</div>
	<div>내용 : {{info.content}}</div>
	<div>
		<button @click="fnEdit">수정하기</button>
		<button @click="fnBack">되돌아가기</button>
	</div> 
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		idx : "${map.idx}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {idx : self.idx};
            $.ajax({
                url : "view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	self.info = data.info;
                }
            }); 
        },
        
        fnBack : function(){
        	location.href = "list.do";
        },
        
        fnEdit : function(){
        	var self = this;
        	self.pageChange("edit.do", {idx : self.idx});
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