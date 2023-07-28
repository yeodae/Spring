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
			<label>���� : <input type="text" v-model="title"></label>
		</div>
		<div>
			<label><textarea rows="10" cols="30" v-model="content"></textarea></label>
		</div>
		<div><button @click="fnAdd">���</button>
			<button @click="fnMove">���</button></div>
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
            	alert("������ �Է��ϼ���.");
            	return;
            }
            if(self.content==''){
            	alert("������ �Է��ϼ���.");
            }
            var nparmap = {title : self.title, content : self.content};
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                alert("��� �Ϸ�");
                }
            }); 
        },
        fnMove : function(){
            location.href = "list.do";
         },
    }   /* methods �� */
    , created: function () {
    	var self = this;
    	
	}
});
</script>