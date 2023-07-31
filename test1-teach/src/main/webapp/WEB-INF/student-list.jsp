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
	.bg {
		background-color : #eee;
	}
	.bg2 {
		background-color : tomato;
	}
</style>
<body>
	<div id="app">
		<button @click="flg = !flg">클릭</button>
		<button @click="fnAlert()">메소드 호출</button>
		<input v-model="contents">
		<table border="1" v-if="flg">
			<tr>
				<th>No.</th>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>키</th>
			</tr>
			<tr v-for="(item, index) in list" v-bind:class="item.stuHeight >= 170 ? 'bg' : 'bg2'">
				<td>{{index + 1}}</td>
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>
					<span v-if="item.stuDept == '기계'" style="color:red;">{{item.stuDept}}</span>
					<span v-else-if="item.stuDept == '전기전자'" style="color:blue;">{{item.stuDept}}</span>
					<span v-else>{{item.stuDept}}</span>
				</td>
				<td>{{item.stuHeight}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		test : "",
		result : "123",
		flg : true,
		contents : "공사좀 어케 해봐라"
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.test = data.name;
                	self.result = data.result;
	                self.list = data.list;
                }
            }); 
        }
    
    	, fnAlert : function(){
        	/* alert("수업 시작!!"); */
        	var self = this;
        	self.contents = "안녕하세요";
        }
        
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	/* self.result = "abc"; */
    	self.fnGetList();
	}
});
</script>