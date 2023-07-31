<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day3</title>
<style>
	
</style>
</head>
<body>
<div id="app">
	<div>�й� : {{info.stuNo}}</div>	
	<div>�̸� : {{info.stuName}}</div>	
	<div>�а� : {{info.stuDept}}</div>	
	<div>�г� : {{info.stuGrade}}</div>	
	<div>Ű : {{info.stuHeight}}</div>	
	<div>������ : {{info.stuWeight}}</div>	
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		stuNo : "${map.stuNo}",
		info : {}

    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {stuNo : self.stuNo};
             $.ajax({
                url : "/enrol/info2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	             	self.info = data.info;
                }
            });  
        },
    }   /* methods �� */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>