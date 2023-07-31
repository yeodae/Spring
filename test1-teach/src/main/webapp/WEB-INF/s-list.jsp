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
	table{text-align : center;}
	.bg {
		background-color : #eee;
	}
	.bg2 {
		background-color : tomato;
	}
</style>
<body>
	<div id="app">
		<div style="margin: 10px;">
			<div>
				<span>입학년도 : </span>
				<label v-for="item in yearList" >
					<input v-model="year" :value="item" type="radio" name="year">{{item}}
				</label>
			</div>
			<!-- <select v-model="selectItem">
				<option value="">:: 전체 ::</option>
				<option value="컴퓨터정보">컴퓨터정보</option>
				<option value="기계">기계</option>
				<option value="전기전자">전기전자</option>
			</select>
			
			<select v-model="selectItem">
				<option value="">:: 전체 ::</option>
				<option v-for="item in deptList" :value="item">{{item}}</option>
			</select> -->
			
			<select v-model="selectItem" @change="fnGetList">
				<option v-for="item in deptList2" :value="item.sub">{{item.name}}</option>
			</select>

			<button @click="fnGetList">검색</button>
		</div>
		<table border="1">
			<tr>
				<th>선택</th>
				<th>No.</th>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>키</th>
			</tr>
			<tr v-for="(item, index) in list" >
				<td><input type="radio" v-model="stuNo" :value="item.stuNo" name="stuNo"></td>
				<td>{{index + 1}}</td>
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.stuDept}}</td>
				<td>{{item.stuHeight}}</td>
			</tr>
		</table>
		<button @click="fnStuSearch">학생검색</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		selectItem : "",
		year : "",
		yearList : [2013, 2014, 2015],
		deptList : ["컴퓨터정보", "전기전자", "기계"],
		deptList2 : [	
						{sub : "", name : ":: 전체 ::"}, 
						{sub : "컴퓨터정보", name : "컴퓨터정보"},
						{sub : "전기전자", name : "전기전자"},
						{sub : "기계", name : "기계"}
					],
		stuNo : ""
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {dept : self.selectItem, year : self.year};
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
        
        fnStuSearch : function(){
            var self = this;
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	self.stuNo = "";
                }
            }); 
        }
        
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>