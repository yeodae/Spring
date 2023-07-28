<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day3</title>
<style>
	
</style>
</head>
<body>
<div id="app">
		<h1>��� �ݿ����̴�!</h1>
		<table border="1">
			<tr>
				<th></th>
				<th>�й�</th>
				<th>�̸�</th>
				<th>�������</th>
				<th>����</th>
			</tr>
			<tr v-for = "item in list">
				<td><input type="radio" v-model="stuNo" :value="item.stuNo" name="qq"></td>
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.avgGrade}}</td>
				<td><button @click="fnEdit(item)">����</button></td>
			</tr>
		</table>
		<button @click="fnDelete">�л�����</button>
		<button @click="fnRemove">��������</button>
		<button @click="fnSearch">�󼼺���</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		stuNo : "",
		info : {},
		name : ""
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "enrolList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                self.list = data.enrolList;
                }
            }); 
        },
        fnDelete : function(){
            var self = this;
            if(!confirm("���� �����Ͻðڽ��ϱ�?")){
            	return;
            }
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "/stu/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("�����Ǿ����ϴ�.");
	                self.fnGetList();
                }
            }); 
        },
        fnRemove : function(){
            var self = this;
            if(!confirm("���� �����Ͻðڽ��ϱ�?")){
            	return;
            }
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "/enrol/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("�����Ǿ����ϴ�.");
	                self.fnGetList();
                }
            }); 
        },
        fnSearch : function(){
            var self = this;       
            var nparmap = {stuNo : self.stuNo};
            $.ajax({
                url : "/enrol/info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                	self.fnGetList();
                	alert("�̸� : "+self.info.stuName+
                		 "\n�а� : "+self.info.stuDept+
                		 "\nŰ : "+self.info.stuHeight+
                		 "\nü�� : "+self.info.stuWeight);
                	self.stuNo = "";
                }
            }); 
        },
        fnEdit : function(item){
        	var self = this;
        	var name = prompt("���� �̸� : "+item.stuName+"\n������ �̸��� �Է����ּ���");
        	if(name == undefined || name == null){
        		return;
        	}
        	var nparmap = {stuNo : item.stuNo, stuName : name};
        	 $.ajax({
                 url : "/enrol/edit.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {
                 	self.fnGetList();
                 }
             }); 
        }
    }   /* methods �� */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>