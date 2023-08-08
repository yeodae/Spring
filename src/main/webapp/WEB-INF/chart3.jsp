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
        <apexchart type="bar" height="350" :options="chartOptions" :series="series"></apexchart>
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
		series: [],
          chartOptions: {
            chart: {
              type: 'bar',
              height: 350,
              stacked: true,
              stackType: '100%'
            },
            plotOptions: {
              bar: {
                horizontal: true,
              },
            },
            stroke: {
              width: 1,
              colors: ['#fff']
            },
            title: {
              text: '년도별 프로그래밍 언어 사용량',
    		  align : 'center'
            },
            xaxis: {
              categories: [],
            },
            tooltip: {
              y: {
                formatter: function (val) {
                  return val + "K"
                }
              }
            },
            fill: {
              opacity: 1
            
            },
            legend: {
              position: 'top',
              horizontalAlign: 'left',
              offsetX: 40
            }
          }
	},// data
	methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "language.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	console.log(data.list);
                	
                	for(var i=0; i<data.list.length; i++){
                		self.series.push(self.fnSeries(data.list[i]));
                	} 
                	
                	var yearList = [];
                	for(var i=0; i<data.list[0].length; i++){
						yearList.push(data.list[0][i].year);
                	} //년도 리스트 추가
                	self.chartOptions = { 
                		xaxis : {categories: yearList}
                    } 
                }
            }); 
		},
		fnSeries : function(list){ //list를 알아서 가공
			var valueList = [];
			for(var i=0; i<list.length; i++){
				valueList.push(list[i].useCnt);
				//valueList = useCnt[i]
			}
			return {name : list[0].language, data : valueList};
			// {name : "JAVA", date : valueLIst[i]}
		}
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>