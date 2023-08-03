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
	<div><label>* ���̵� : <input type="text" v-model="user.userId" @keyup="fnCheck"></label>
	<div v-if="user.userId != ''" >
		<span v-if="user.userId == null" style="color:blue;">{{message}}</span>
		<span v-if="" style="color:red;">{{message}}</span>
		</div>
		</div>
	<div><label>* ��й�ȣ : <input type="password" v-model="user.pw1"></label></div>
	<div><label>* ��й�ȣ Ȯ��: <input type="password" v-model="user.pw2"></label></div>
	<div><label>* �̸� : <input type="text" v-model="user.name"></label></div>
	<div><label>* �ڵ��� : <input type="text" v-model="user.phone"></label></div>
	<div><label> ���� : <input type="text" v-model="user.age"></label></div>
	<div> �ּ� :<button @click="fnAddr">�˻�</button>
		<div v-if="user.addr != ''" ><label>���θ� �ּ� : <input disabled style="width : 300px;" type="text" v-model="user.addr"></label></div>
		<div v-if="user.addrDetail != ''"><label>�� �ּ� : <input  style="width : 300px;" type="text" v-model="user.addrDetail"></label></div>
	</div>
	<div><button @click="fnJoin">�����ϱ�</button></div>
</div>
</body>
</html>
<script>
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
} 
var app = new Vue({
	el : '#app',
	data : {
		user : {
			userId : "",
			pw1 : "",
			pw2 : "",
			name : "",
			phone : "",
			age : "",
			addr : "",
			addrDetail : ""
		},
		joinFlg : false,
		message : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {userId : self.userId};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                }
            }); 
        },
		fnJoin : function(){
			var self = this;
			if(self.user.userId == ""){
				alert("���̵� �Է��ض�");
				return;
			}
			if(self.user.pw1 == ""){
				alert("�н����� �Է��ض�");
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("�н����� Ȯ���ض�");
				return;
			}
			if(self.user.name == ""){
				alert("�̸� �Է��ض�");
				return;
			}
			if(self.user.phone == ""){
				alert("�ڵ��� �Է��ض�");
				return;
			}
			if(self.user.addr == ""){
				alert("�ּ� �Է��ض�");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("���� ����");
                	location.href="login.do";
                }
            });
		},
		 fnCheck : function(){
			var self = this;
			var nparmap = {userId : self.user.userId};
            $.ajax({
                url : "check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.cnt > 0){
                		self.message = "�ߺ��� ���̵� ����";
                		
                	} else {
                		self.message = "��밡����";
                		self.joinFlg = true;
                	}
                }
            });
		},
		fnAddr : function(){
			var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
    	},
    	fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.user.addr = roadAddrPart1;
    		self.user.addrDetail = addrDetail;
    		// �ܼ� ���� �� ���� �� ���� �ʿ��Ѱ� ������ ���� �˴ϴ�.
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	}
		
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>