<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
	<button @click="fnBack">���</button>
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
		userId : "${sessionId}",
		//�ۼ���
		no : "${map.no}", // pk�� ȣ��
		info : {
			title : "",
			contents : ""
		}
	},
	 // 4. ������Ʈ �߰�
     components: {VueEditor}
	,// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {no : self.no, kind : "UPDATE"};
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
        //�۾���
        fnAdd : function(){
            var self = this;
            var nparmap = self.info;
            // {title : info.title, contents : info.contents}
            nparmap.userId = self.userId;
            // {title : info.title, contents : info.contents, userId : self.userId}
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	alert("��ϵǾ����ϴ�!");
                	location.href="list.do";
                }
            }); 
        },
        //�ۼ����ϱ�
        fnEdit : function(){
            var self = this;
            var nparmap = self.info;
            // {title : info.title, contents : info.contents}
            nparmap.no = self.no;
            // {title : info.title, contents : info.contents, userId : self.userId}
            $.ajax({
                url : "edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	alert("�����Ǿ����ϴ�!");
                	location.href="list.do";
                }
            }); 
        },
        fnBack : function(){
        	location.href="list.do";
        },
     // ���� ���ε�
	   /*  upload : function(){
			var form = new FormData();
	        form.append( "file1", $("#file1")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload.do"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}  */
	}, // methods
	created : function() {
		var self = this;
		if(self.no != ""){
			self.fnGetList();
		}
	}// created
});
</script>