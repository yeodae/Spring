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
	<div><label>결제자 : <input placeholder="이름" v-model="name"></label></div>
	<div><label>결제금액 : <input type="number" v-model="price" placeholder="금액" v-model="name"></label></div>
	<div><label>주소 : <input v-model="addr" placeholder="주소" v-model="name"></label></div>
	<div><label>핸드폰 : <input v-model="phone" placeholder="핸드폰" v-model="name"></label></div>
	<div><button @click="requestPay">결제하기</button></div>
</div>
</body>
</html>
<script>

const userCode = "imp50081124"; //가맹점 식별 코드
IMP.init(userCode);

var app = new Vue({
	el : '#app',
	data : {
		name : "",
		price : 0,
		addr : "",
		phone : ""
	},// data
	methods : {
    	requestPay : function() {
    		var self = this;
   		  IMP.request_pay({
   		    pg: "kakaopay",
   		    pay_method: "pay",
   		 	merchant_uid : 'merchant_'+new Date().getTime(),
	   	    name : '결제테스트',
	   	    amount : self.price,
	   	    buyer_name : self.name,
	   	    buyer_tel : self.phone,
	   	    buyer_addr : self.addr,
	   	  }, function (rsp) { // callback
	   	      if (rsp.success) {
	   	        console.log(rsp);
	   	      } else {
	   	    	console.log(rsp);
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