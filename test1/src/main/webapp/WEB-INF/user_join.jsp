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
		<div><label>*아이디 : <input type="text" v-model="user.userId" @keyup="fnCnt"></label><button @click="fnCnt">중복체크</button></div>		
		<div v-if="user.userId.length  ">
			<span v-if="userIdflg == true" style="color:blue;">사용가능한 아이디 입니다.</span>
			<span v-else style="color:red;">중복된 아이디 입니다.</span>
		</div>
		<div><label>*비밀번호 : <input type="password" v-model="user.pw1"></label></div>
		<div><label>*비밀번호 확인 : <input type="password" v-model="user.pw2"></label></div>
		<div><label>*이름 : <input type="text" v-model="user.name"></label></div>
		<div><label>*핸드폰 : <input type="text" v-model="user.phone"></label></div>
		<div><label>나이 : <input type="text" v-model="user.age"></label></div>
		<div><label>주소 : <input type="text" v-model="user.addr"></label></div>
		<div><button @click="fnJoin">가입하기</button></div>
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
    			alert("아이디를 입력해주세요.");
    			return;
    		}
    		if(self.user.pw1 == ""){
    			alert("패스워드를 입력해주세요.");
    			return;
    		}
    		if(self.user.pw1 != self.user.pw2){
    			alert("패스워드를 확인해주세요.");
    			return;
    		}
    		if(self.user.name == ""){
    			alert("이름을 입력해주세요.");
    			return;
    		}
    		if(self.user.phone == ""){
    			alert("연락처를 입력해주세요.");
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
  	                alert("환영합니다!")
  	                
                  }
              }); 
    	},
	    fnCnt : function(){
			var self = this;
			/* if(self.stuNo.length == 0){
				alert("학번을 입력하세요");
				return; // 빈값 조건주기
			} */
			self.userIdflg = true; //하나라도입력시 화면출력
			//alert(self.name + "님 안녕하세요!");
			var nparmap = {userId : self.user.userId};
			 $.ajax({
	                url : "check.dox",
	                dataType:"json",   
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {	            
	                	console.log(data);
	                	 if(data.cnt > 0){
	                		/* alert("중복된 아이디가 있습니다."); */
	                		 console.log(self.userIdflg);
	                		 self.userIdflg = false;
	                	}else{
	                		/* alert("사용 가능한 아이디입니다."); */
	                		self.userIdflg = true;
	                		console.log(self.userIdflg);
	                		self.userIdflg = self.userIdflg;
	                	} 
	                }
	            }); 
		},
    
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.user;
   
	}
});
</script>