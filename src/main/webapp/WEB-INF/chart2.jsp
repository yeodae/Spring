<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<div id="app">
	<div id="chart">
       <apexchart type="pie" width="380" :options="chartOptions" :series="series"></apexchart>
     </div>
</div>
</body>
</html>

<script>
var app = new Vue({
	el : '#app',
	components: {
      apexchart: VueApexCharts,
    },
	data : {
		list : [],
		series: [44, 55, 13, 43, 22],
        chartOptions: {
          chart: {
            width: 380,
            type: 'pie',
          },
          labels: [],
          title: {
            text: '포털사이트 점유율',
            align: 'center'
          },
          responsive: [{
            breakpoint: 480,
            options: {
              chart: {
                width: 200
              },
              legend: {
                position: 'bottom'
              }
            }
          }]
        }
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "domain.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	self.list = data.list;
                	var cntList = [];
                	var domainList = [];
                	for(var i=0; i<self.list.length; i++){
                		cntList.push(self.list[i].joinCnt);
                		domainList.push(self.list[i].domain);
                	}
                	self.chartOptions = {
                		labels : domainList
           	        }
                	self.series = cntList;
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