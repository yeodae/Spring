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
		<div><label>*���̵� : <input type="text" v-model="user.userId" @keyup="fnCnt"></label><button @click="fnCnt">�ߺ�üũ</button></div>		
		<div v-if="user.userId.length  ">
			<span v-if="userIdflg == true" style="color:blue;">��밡���� ���̵� �Դϴ�.</span>
			<span v-else style="color:red;">�ߺ��� ���̵� �Դϴ�.</span>
		</div>
		<div><label>*��й�ȣ : <input type="password" v-model="user.pw1"></label></div>
		<div><label>*��й�ȣ Ȯ�� : <input type="password" v-model="user.pw2"></label></div>
		<div><label>*�̸� : <input type="text" v-model="user.name"></label></div>
		<div><label>*�ڵ��� : <input type="text" v-model="user.phone"></label></div>
		<div><label>���� : <input type="text" v-model="user.age"></label></div>
		<div><label>�ּ� : <input type="text" v-model="user.addr"></label></div>
		<div><button @click="fnJoin">�����ϱ�</button></div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
    	user : {
    		userId : "",
    		pw1 : "",
    		pw2 : "",
    		name : "",
    		phone : "",
    		age : "",
    		addr : ""	
    	},
    	userIdflg : false
    }, methods: {
    	fnJoin : function(){
    		var self = this;
    		if(self.user.userId == ""){
    			alert("���̵� �Է����ּ���.");
    			return;
    		}
    		if(self.user.pw1 == ""){
    			alert("�н����带 �Է����ּ���.");
    			return;
    		}
    		if(self.user.pw1 != self.user.pw2){
    			alert("�н����带 Ȯ�����ּ���.");
    			return;
    		}
    		if(self.user.name == ""){
    			alert("�̸��� �Է����ּ���.");
    			return;
    		}
    		if(self.user.phone == ""){
    			alert("����ó�� �Է����ּ���.");
    			return;
    		}
    		  var nparmap = self.user;
              $.ajax({
                  url : "add.dox",
                  dataType:"json",	
                  type : "POST", 
                  data : nparmap,
                  success : function(data) {
  	                self.list = data.user;
  	                console.log(self.list)
  	                alert("ȯ���մϴ�!")
  	                
                  }
              }); 
    	},
	    fnCnt : function(){
			var self = this;
			/* if(self.stuNo.length == 0){
				alert("�й��� �Է��ϼ���");
				return; // �� �����ֱ�
			} */
			self.userIdflg = true; //�ϳ����Է½� ȭ�����
			//alert(self.name + "�� �ȳ��ϼ���!");
			var nparmap = {userId : self.user.userId};
			 $.ajax({
	                url : "check.dox",
	                dataType:"json",   
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {	            
	                	console.log(data);
	                	 if(data.cnt > 0){
	                		/* alert("�ߺ��� ���̵� �ֽ��ϴ�."); */
	                		 console.log(self.userIdflg);
	                		 self.userIdflg = false;
	                	}else{
	                		/* alert("��� ������ ���̵��Դϴ�."); */
	                		self.userIdflg = true;
	                		console.log(self.userIdflg);
	                		self.userIdflg = self.userIdflg;
	                	} 
	                }
	            }); 
		},
    
    }   /* methods �� */
    , created: function () {
    	var self = this;
    	self.user;
   
	}
});
</script>