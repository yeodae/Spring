<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<!-- 1. vue2editor ������ cdn -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div>
		<label>���� : <input v-model="info.title"></label>
	</div>
	<div>
		<vue-editor v-model="info.contents"></vue-editor> <!-- 2. ȭ�� ������ �߰� -->
	</div>
	<button v-if="no == ''" @click="fnAdd">���</button>
	<button v-else @click="fnEdit">����</button>
</div>
</body>
</html>
<script>
//3. �信 vue2editor �߰�
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({
	el : '#app',
	data : {
		uId : "${sessionId}",
		no : "${map.no}",
		info : {
			title : "",
			contents : ""
		}
	}
    , components: {VueEditor}
	, methods : {
		fnAdd : function(){
            var self = this;
            var nparmap = self.info;
            nparmap.uId = self.uId;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("��� �Ϸ�");
                	location.href = "list.do";
                }
            }); 
        },
        
        fnGetList : function(){
			var self = this;
			var param = {no : self.no, kind : "UPDATE"};
			$.ajax({
                url : "view.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
		},
		fnEdit : function(){
			var self = this;
			var param = self.info;
			$.ajax({
                url : "edit.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	alert("�����Ǿ���");
                	location.href = "list.do";
                }
            }); 
		}
	}, // methods
	created : function() {
		var self = this;
		if(self.no != ""){
			self.fnGetList();
		}
		
	}// created
});
</script>