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
	th, td{
		padding : 5px 10px;
	}
</style>
</head>
<body>
<div id="app">
		<table border="1">
		<tr>
			<th></th>
			<th>�й�</th>
			<th>�̸�</th>
			<th>���̵�</th>
			<th>�г�</th>
			<th>��ȭ��ȣ</th>
		</tr>
		<tr v-for="item in list">
				<td><input type="radio" v-model="studNo" :value="item.studNo"></td>
				<td >{{item.studNo}}</td>
				<td>{{item.name}}</td>
				<td>{{item.id}}</td>
				<td>{{item.grade}}</td>
				<td>{{item.tel}}</td>
				
		</tr>
	</table>
	<button @click="fnRemove(studNo)">����</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		studNo : ""
		
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/lastStudent/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                self.list = data.list;
                }
            }); 
        },
        fnRemove : function(studNo){
        	var self = this;
        	if(!confirm("���� �����Ͻðڽ��ϱ�?")){
        		return;
        	}
            var nparmap = {studNo : self.studNo};
            console.log(studNo);
            $.ajax({
                url : "/lastStudent/remove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�����Ǿ����ϴ�.");
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