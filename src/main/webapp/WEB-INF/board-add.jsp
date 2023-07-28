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
	
</style>
</head>
<body>
<div id="app">
		<div>
			<label>제목 : <input type="text" v-model="title"></label>
		</div>
		<div>
			<label><textarea rows="10" cols="30" v-model="content"></textarea></label>
		</div>
		<div><button @click="fnAdd">등록</button>
			<button @click="fnMove">취소</button></div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		title : "",
		content : "",
		
    }   
    , methods: {
    	fnAdd : function(){
            var self = this;
            if(self.title==''){
            	alert("제목을 입력하세요.");
            	return;
            }
            if(self.content==''){
            	alert("내용을 입력하세요.");
            }
            var nparmap = {title : self.title, content : self.content};
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                alert("등록 완료");
                }
            }); 
        },
        fnMove : function(){
            location.href = "list.do";
         },
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	
	}
});
</script>