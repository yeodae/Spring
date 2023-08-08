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
	<div><label>������ : <input placeholder="�̸�" v-model="name"></label></div>
	<div><label>�����ݾ� : <input type="number" v-model="price" placeholder="�ݾ�" v-model="name"></label></div>
	<div><label>�ּ� : <input v-model="addr" placeholder="�ּ�" v-model="name"></label></div>
	<div><label>�ڵ��� : <input v-model="phone" placeholder="�ڵ���" v-model="name"></label></div>
	<div><button @click="requestPay">�����ϱ�</button></div>
</div>
</body>
</html>
<script>

const userCode = "imp50081124"; //������ �ĺ� �ڵ�
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
	   	    name : '�����׽�Ʈ',
	   	    amount : self.price,
	   	    buyer_name : self.name,
	   	    buyer_tel : self.phone,
	   	    buyer_addr : self.addr,
	   	  }, function (rsp) { // callback
	   	      if (rsp.success) {
	   	        console.log(rsp);
	   	      } else {
	   	    	console.log(rsp);
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