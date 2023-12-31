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
		<label>* 아이디 : <input type="text" v-model="user.userId" @keyup="fnCheck"></label> 
		<span v-if="user.userId != ''">{{message}}</span>
	</div>
	<div><label>* 비밀번호 : <input type="password" v-model="user.pw1"></label></div>
	<div><label>* 비밀번호 확인: <input type="password" v-model="user.pw2"></label></div>
	<div><label>* 이름 : <input type="text" v-model="user.name"></label></div>
	<div><label>* 핸드폰 : <input type="text" v-model="user.phone"></label></div>
	<div><label>나이 : <input type="text" v-model="user.age"></label></div>
	<div>주소 : <button @click="fnSearchAddr">주소 검색</button> 
		<div v-if="user.addr != ''" ><label>도로명 주소 : <input disabled style="width : 300px;" type="text" v-model="user.addr"></label></div>
		<div v-if="user.addrDetail != ''"><label>상세 주소 : <input  style="width : 300px;" type="text" v-model="user.addrDetail"></label></div>
	</div>
	<div><button @click="requestPay">결제하기</button></div>
	<div><button @click="fnJoin">가입하기</button></div>
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
				alert("아이디 입력해라");
				return;
			}
			if(self.user.pw1 == ""){
				alert("패스워드 입력해라");
				return;
			}
			if(self.user.pw1 != self.user.pw2){
				alert("패스워드 확인해라");
				return;
			}
			if(self.user.name == ""){
				alert("이름 입력해라");
				return;
			}
			if(self.user.age == ""){
				alert("나이 입력해라");
				return;
			}
			if(self.user.addr == ""){
				alert("주소 입력해라");
				return;
			}
		 	var nparmap = self.user;
            $.ajax({
                url : "add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("가입 ㅊㅋ");
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
                		self.message = "중복된 아이디 있음";
                	} else {
                		self.message = "사용 가능";
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
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
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
	   	    name : '결제테스트',
	   	    amount : 9999,
	   	    buyer_email : 'test@test.com',
	   	    buyer_name : '길동이',
	   	    buyer_tel : '010-1234-5678',
	   	    buyer_addr : '인천 부평',
	   	    buyer_postcode : '123-456'
	   	  }, function (rsp) { // callback
	   	      if (rsp.success) {
	   	        // 결제 성공 시
	   	      } else {
	   	        // 결제 실패 시
	   	      }
	   	  });
	   	}
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>