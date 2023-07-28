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
   th, td {
      padding : 0px 10px;
   }
</style>
<body>
   <div id="app">
   <div style="margin-bottom : 30px;">
         <input type="text" v-model="search">
         <select v-model="selectItem">
         	<option value="">전체</option>
         	<option value="컴퓨터정보">컴퓨터정보</option>
         	<option value="기계">기계</option>
         	<option value="전기전자">전기전자</option>
         </select>
         <button @click="fnGetList()">검색</button>
      </div>
      <table border="1">
         <tr>
            <th>No.</th>
            <th>학번</th>
            <th>이름</th>
            <th>학과</th>
            <th v-if="heightFlg">키</th>
            <th>평균점수</th>
            <th>합격여부</th>
            <th>정지여부</th>
            <th>정지</th>
            <th>키 초기화</th>
         </tr>
         <tr v-for="(item, index) in list" >
            <td>{{index + 1}}</td>
            <td>{{item.stuNo}}</td>
            <td>{{item.stuName}}</td>
            <td>{{item.stuDept}}</td>
            <td v-if="heightFlg">{{item.stuHeight}}</td>
            <td>{{item.avgGrade}}</td>
            <td>
            	<span v-if="item.avgGrade >= 60" style="color:blue;">합격</span>
            	<span v-else style="color:red;">불합격</span>
            </td>
            <td>
               <span v-if="item.banYn" style="color:red;">정지</span>
            </td>
            <td><button @click="item.banYn = true">정지</button></td>
            <td><button @click="fnSelect(index)">초기화</button></td>
         </tr>
      </table>
      <div>
         <button @click="heightFlg = !heightFlg">테이블변경1</button>
      </div>
   </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
      list : [],
      heightFlg : true,
      dept : "",
      search : "",
      selectItem : ""
    }   
    , methods: {
       fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.search, dept : self.selectItem};
            console.log(self.selectItem);
            $.ajax({
                url : "list.dox",
                dataType:"json",   
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                   self.test = data.name;
                   self.result = data.result;
                   self.list = data.list;
                   console.log(self.list);
                }
            }); 
        },
        fnSelect : function(index){
           var self = this;
           self.list[index].stuHeight = "알수없음";
        }
    
    }   /* methods 끝 */
    , created: function () {
       var self = this;
       self.fnGetList();
   }
});
</script>
​