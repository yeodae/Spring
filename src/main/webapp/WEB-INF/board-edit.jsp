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
		<div>제목 : <input v-model="info.title"></div>
		<div>내용 : <textarea rows="10" cols="30" v-model="info.content"></textarea></div>
		<div><button @click="fnEdit">등록</button>
			<button @click="back">취소</button></div>
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		idx : "${map.idx}",
		info : {}
    }, 
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {idx : self.idx};
            $.ajax({
                url : "view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                }
            }); 
        },
        fnEdit : function(){
            var self = this;
            if(self.title==''){
            	alert("제목을 입력하세요.");
            	return;
            }
            if(self.content==''){
            	alert("내용을 입력하세요.");
            }
            var nparmap = {title : self.info.title, content : self.info.content, idx : self.idx};
            $.ajax({
                url : "edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                alert("수정 완료");
                }
            }); 
        },
        back : function(){
            location.href = "list.do";
         },
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>