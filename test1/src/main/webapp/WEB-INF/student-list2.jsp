<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>두번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<table border="1" > 
			<tr>
				<th>No.</th>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th v-if="Hflg">키</th>
			</tr>
			<tr v-for="(item, index) in list" v-if ="search == '' ? true : item.stuDept == search">
				<td>{{index + 1}}</td>
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td >{{item.stuDept}}</td>
				<td v-if="Hflg">{{item.stuHeight}}</td>
			</tr>
		</table>
		<div>
			<button @click="Hflg = !Hflg">클릭</button>
		</div>
		<div>
			<input type="text" v-model="dept">
			<button @click="search = dept">검색</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		Hflg : true,
		dept : "", // 학과 검색
		search : ""
		
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.search, dept : self.selectItem};
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
        },
    	fnDept : function(){
    		var self = this;
    		self.contents = "";
    	
    		/* self.contents = "안녕하세요"; */
    	}
    
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>