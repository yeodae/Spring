<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>테스트</title>
		<style>
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
	
	        .div1 {
	            margin: auto;
	            width: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 10px;
	        }
	
	        input {
	            width: 100%;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: none;
	        }
	
	        .in {
	            margin-bottom: 10px;
	        }
	
	        #btn {
	            background-color: #1BBC9B;
	            margin-bottom: 30px;
	            color: white;
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 12px;
	        }
    	</style>
	</head>
	<body>
		<div id="app" class="div1">
			<h2>회원 가입</h2>
			<div class="div2">
				<input type="text" class="in" placeholder="아이디"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호 확인"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="이름"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="닉네임"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="나이"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="주소" v-model="roadFullAddr"></input>
				<button @click="fnSearchAddr">주소 검색</button>
			</div>
			<div class="div2">
				<label>성별 : 
					<select style="width : 100px;">
						<option>남자</option>
						<option>여자</option>
					</select>
				</label>
			</div>
			<div class="div2">
				<button id="btn" >회원가입</button>
			</div>
		</div> 
	</body>
</html>
<script type="text/javascript">
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	app.fnResult(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo);
} 
var app = new Vue({ 
    el: '#app',
    data: {
    	roadFullAddr : ""
    }   
    , methods: {
    	fnSearchAddr : function(){
    		var self = this;
    		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    		window.open("addr.do", "test", option);
    	},
    	
    	fnResult : function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    		var self = this;
    		self.roadFullAddr = roadFullAddr;
    		// 콘솔 통해 각 변수 값 찍어보고 필요한거 가져다 쓰면 됩니다.
    		console.log(roadFullAddr);
    		console.log(roadAddrPart1);
    		console.log(addrDetail);
    		console.log(engAddr);
    	}
    
    }   
    , created: function () {
    
	}
});
</script>
