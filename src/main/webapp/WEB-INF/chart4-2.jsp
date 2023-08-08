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
        <apexchart type="line" height="350" :options="chartOptions" :series="series"></apexchart>
      </div>
    
    <table border="1">
    	<tr>
    		<th>이름</th>
    		<th>월</th>
    		<th>가격</th>
    	</tr>
    	<tr v-for = "item in abcList">
    		<td>{{item.cName}}</td>
    		<td>{{item.pDate}}</td>
    		<td>{{item.price}}</td>
    	</tr>
    </table>
    
</div>
</body>
</html>

<script>
var app = new Vue({
	el : '#app',
	components: {
      apexchart: VueApexCharts,
    },
    data: {
        abcList : [],
        series: [
          {
            name: "",
            data: []
          }
        ],
        chartOptions: {
          chart: {
            height: 350,
            type: 'line',
            dropShadow: {
              enabled: true,
              color: '#000',
              top: 18,
              left: 7,
              blur: 10,
              opacity: 0.2
            },
            toolbar: {
              show: false
            }
          },
          colors: ['#77B6EA', '#545454', '#C98BA4'],
          dataLabels: {
            enabled: true,
          },
          stroke: {
            curve: 'smooth'
          },
          title: {
            text: 'Average High & Low Temperature',
            align: 'center'
          },
          grid: {
            borderColor: '#e7e7e7',
            row: {
              colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
              opacity: 0.5
            },
          },
          markers: {
            size: 1
          },
          xaxis: {
            categories: [],
            title: {
              text: 'Month'
            }
          },
          yaxis: {
            title: {
              text: 'Temperature'
            },
            min: 5,
            max: 8000
          },
          legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
          }
        }
        
	},// data
	 methods : {
		fnGetList : function(){
			var self = this;
			var param = {};
			$.ajax({
                url : "gazua.dox",
                dataType:"json",	
                type : "POST",
                data : param,
                success : function(data) { 
                	data.allList;
                	var arr = [];
                	for(var i = 0 ; i < data.allList.length; i++){
                		self.fnFormat(data.allList[i]);
                	}
                	
                	 var monthList = [];
                	for(var i=0; i<data.allList[0].length; i++){
                		monthList.push(data.allList[0][i].pDate);
                		
                	}
                	self.chartOptions = {
                			xaxis : {categories : monthList}
                	} 
                }
            });
		},
		fnFormat : function(list){
			var arr = [];
        	for(var i = 0 ; i < list.length; i++){
        		arr.push(list[i].price);
        	}
        	var map = {name : list[0].cName, data : arr};
        	this.series.push(map);
		}
	
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created */
});
</script>