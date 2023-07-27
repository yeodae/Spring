<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>day2 stuNoflg</title>
<style>
	
</style>
</head>
<body>
<div id="app">
		
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "subject/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
	                self.list = data.subjectList;
	                console.log(self.list)
                }
            }); 
        },
    
    }   /* methods 끝 */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>