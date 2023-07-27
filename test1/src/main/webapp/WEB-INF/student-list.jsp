<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
</head>
<style>
	table, th, tr{
		border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
	}
	td, th{
		 padding : 10px;
	}
	.bg{
		background-color : #eee;
	}
	.bg2{
		background-color : tomato;
	}
</style>
<body>
	<div id="app">
		<!-- <H1>이름 : {{tempList[0].name}}</H1><H1>나이 : {{tempList[0].age}}</H1>
		<H1>이름 : {{tempList[1].name}}</H1><H1>나이 : {{tempList[1].age}}</H1> -->
		
		<!-- <H1 v-for="zzz in list">
		 이름 : {{zzz.stuName}},
		 학과 : {{zzz.stuDept}}
		 </H1> -->
		<button @click="flg = !flg">클릭</button>
		<button @click="fnAlert()">alert</button>
		<input v-model="contents">
		 <table border="1" v-if="flg">
		 	<tr>
		 		<th>no</th>
		 		<th>학번</th>
		 		<th>이름</th>
		 		<th>학과</th>
		 		<th>키</th>
		 	</tr>
		 	<tr v-for="(zzz, index) in list" v-bind:class="[zzz.stuHeight >= 170 ? 'bg' : 'bg2']">
		 		<td>{{index + 1}}</td>
		 		<td>{{zzz.stuNo}}</td>
		 		<td>{{zzz.stuName}}</td>
		 		<td>
		 			<span v-if="zzz.stuDept == '기계'" style="color:tomato;">{{zzz.stuDept}}</span>
		 			<span v-else-if="zzz.stuDept == '전기전자'" style="color:green;">{{zzz.stuDept}}</span>
		 			<span v-else>{{zzz.stuDept}}</span>
		 		</td>
		 		<td>
		 			<span>{{zzz.stuHeight}}</span>
		 		</td>
		 	</tr>
		 	
		 </table>
		
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',//뷰의 이름 app
    data: {
		list : [],
		test : "", // name이라는 변수 선언 (값="홍길동")
		result : "123",
		flg : true,
		contents : "공사좀 어케 해봐라"
		
	/* 	tempList : [
			{name : "홍길동", age : 20}, // Map{key,value}
			{name : "옥한빛", age : 30},
			{name : "귀살대", age : 40}
			
		] */
		
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"list.dox", //내가 호출하고자 하는 주소 = 컨트롤러에 위치
                dataType:"json", //list 안에 HashMap이 있는 형태	
                type : "POST", //데이터 감춰서 보내는타입
                data : nparmap, //list.dox에 name="홍길동"을 보내고싶다면 디폴트값으로 설정
                success : function(data) { //호출 성공시 return : success 
                	console.log(data); // {{result:success vue:쉽다!!!!! name:홍길동}}
                	self.result = data.result; // {{result}} 출력시 success
                	self.test = data.name; // {{test}} 출력시 홍길동
	                self.list = data.list; //==this.list 변수로접근
	                
                }
            }); 
        },
    	fnAlert : function(){
    		var self = this;
    		this.contents = "안녕하세요";
    	}
    	
    }   //메서드의 끝
    , created: function () { //created:최초 화면이 호출될때 실행되는 메서드
    	var self = this; // ajax통신을 실행하는 메서드
    	/* self.result = "abc"; */
    	
    	 self.fnGetList(); 

	}
});
</script>