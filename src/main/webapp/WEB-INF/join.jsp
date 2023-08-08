<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div>
		<label>* ���̵� : <input type="text" v-model="user.userId" @keyup="fnCheck"></label> 
		<span v-if="user.userId != ''">{{message}}</span>
	</div>
	<div><label>* ��й�ȣ : <input type="password" v-model="user.pw1"></label></div>
	<div><label>* ��й�ȣ Ȯ��: <input type="password" v-model="user.pw2"></label></div>
	<div><label>* �̸� : <input type="text" v-model="user.name"></label></div>
	<div><label>* �ڵ��� : <input type="text" v-model="user.phone"></label></div>
	<div><label>���� : <input type="text" v-model="user.age"></label></div>
	<div>�ּ� : <button @click="fnSearchAddr">�ּ� �˻�</button> 
		<div v-if="user.addr != ''" ><label>���θ� �ּ� : <input disabled style="width : 300px;" type="text" v-model="user.addr"></label></div>
		<div v-if="user.addrDetail != ''"><label>�� �ּ� : <input  style="width : 300px;" type="text" v-model="user.addrDetail"></label></div>
	</div>
	<div><button @click="requestPay">�����ϱ�</button></div>
	<div><button @click="fnJoin">�����ϱ�</button></div>
</div>
</body>
</html>
<script>
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
}

const userCode = "imp50081124";
IMP.init(userCode);

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
			if(self.user.age == ""){
				alert("���� �Է��ض�");
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
                		self.message = "��� ����";
                		self.joinFlg = true;
                	}
                }
            });
		},
		fnSearchAddr : function (){
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
    	},
    	
    	requestPay : function() {
   		  IMP.request_pay({
   		    pg: "html5_inicis.INIBillTst",
   		    pay_method: "card",
   		 	merchant_uid : 'merchant_'+new Date().getTime(),
	   	    name : '�����׽�Ʈ',
	   	    amount : 9999,
	   	    buyer_email : 'test@test.com',
	   	    buyer_name : '�浿��',
	   	    buyer_tel : '010-1234-5678',
	   	    buyer_addr : '��õ ����',
	   	    buyer_postcode : '123-456'
	   	  }, function (rsp) { // callback
	   	      if (rsp.success) {
	   	        // ���� ���� ��
	   	      } else {
	   	        // ���� ���� ��
	   	      }
	   	  });
	   	}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>