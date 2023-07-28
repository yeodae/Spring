<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>day2 stuNoflg</title>
<style>
	th, td{
		padding : 5px 10px;
	}
</style>
</head>
<body>
<div id="app">
	<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직군</th>
			<th>급여</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<!-- <tr v-for="(item, index) in list">
			<td>{{item.empno}}</td>
			<td>
				<span v-if="editIndex == index"><input :value="item.ename"></span>
				<span v-else>{{item.ename}}</span>
			</td>
			<td>
				<span v-if="editIndex == index"><input :value="item.job"></span>
				<span v-else>{{item.job}}</span>
			</td>
			<td>
				<span v-if="editIndex == index"><input :value="item.sal"></span>
				<span v-else>{{item.sal}}</span>
			</td>
			<td><button @click="fnRemove(item.empno)">삭제</button></td>
			<td>
				<button v-if="editIndex == index" @click="editIndex = index">저장</button>
				<button v-else @click="editIndex = index">수정</button>
			</td>
		</tr> -->
		
		
		<tr v-for="(item, index) in list">
			<template v-if="!item.editFlg">
				<td>{{item.empno}}</td>
				<td>{{item.ename}}</td>
				<td>{{item.job}}</td>
				<td>{{item.sal}}</td>
				<td><button @click="fnRemove(item.empno)">삭제</button></td>
				<td><button @click="item.editFlg = true">수정</button></td>
			</template>
			
			<template v-else>
				<td>{{item.empno}}</td>
				<td><input :value="item.ename"></td>
				<td><input :value="item.job"></td>
				<td><input :value="item.sal"></td>
				<td><button @click="fnRemove(item.empno)">삭제</button></td>
				<td>
					<button @click="fnEdit(item)">저장</button>
					<button @click="item.editFlg = false">취소</button>
				</td>
			</template>
		</tr>
	</table>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : [],
		editIndex : 9999
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "emp/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.empList;
                	console.log(self.list);
                }
            }); 
        },
        fnRemove : function(empno){
        	var self = this;
        	if(!confirm("정말 삭제할거냐")){
        		return;
        	}
            var nparmap = {empno : empno};
            $.ajax({
                url : "emp/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("삭제되었습니다.");
                	self.fnGetList();
                }
            });
        },
        fnEdit : function(item){
                var self = this;
                if(!confirm("정말 수정할거냐")){
            		return;
            	}
                var nparmap = item; // item자체가 list안에있는 맵이기때문에 다 넘어간다.
                $.ajax({
                    url : "emp/edit.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	self.list = data.empList;
                    	console.log(self.list);
                    }
                }); 
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
	
});
</script>
​