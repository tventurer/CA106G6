<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>管理員資料新增 - addEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor="white">
	
<table id="table-1">
	<tr>
		<td>
			<h3>管理員資料新增</h3>
			<h4><a href="select_page.jsp"><img src="images/beauty.jpg" width="100" height="100" border="0">回首頁</a></h4>	
		</td>
	</tr>
</table>

<h3>資料新增:</h3>
<c:if test="${not empty errorMsgs}" >
	<font style="color:red">請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="emp" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>管理員姓名:</td>
		<td><input type="text" name="empname" size="45" 
			 value="<%= (empVO==null)? "請輸入姓名" : empVO.getEmpname()%>" /></td>
	</tr>
	<tr>
		<td>密碼:</td>
		<td><input type="password" name="emppwd" size="45"
			 value="<%= (empVO==null)? "請輸入密碼" : empVO.getEmppwd()%>" /></td>
	</tr>
	<tr>
		<td>性別:</td>
		<td><input type="radio" name="empgen"
			 value="1" ${(empVO.empgen==1||empVO==null)? 'checked' : '' } />男
			<input type="radio" name="empgen"
			 value="0" ${(empVO.empgen==0)? 'checked' : '' } />女</td>
	</tr>
	<tr>
		<td>電話:</td>
		<td><input type="text" name="empphone" size="45"
			 value="<%= (empVO==null)? "請輸入電話" : empVO.getEmpphone()%>" /></td>
	</tr>
	<tr>
		<td>手機:</td>
		<td><input type="text" name="empcell" size="45"
			 value="<%= (empVO==null)? "請輸入手機" : empVO.getEmpcell()%>" /></td>
	</tr>
	<tr>
		<td>email:</td>
		<td><input type="text" name="empmail" size="45"
			 value="<%= (empVO==null)? "請輸入email": empVO.getEmpmail()%>"/></td>
	</tr>
	<tr>
		<td>部門:</td>
		<td><select size="1" name="empdept">
				<option value="ENG" selected>工程部</option>
				<option value="SAL">業務部</option>
				<option value="CUS">客服部</option>	
		</select></td>
	</tr>
	<tr>
		<td>職務:</td>
		<td><input type="text" name="empposi" size="45"
			 value="<%= (empVO==null)? "請輸入職務" : empVO.getEmpposi()%>" /></td>
	</tr>
	<tr>
		<td>薪資:</td>
		<td><input type="text" name="empsal" size="45"
			 value="<%= (empVO==null)? "請輸入薪資" : empVO.getEmpsal()%>" /></td>
	</tr>
	<tr>
		<td>到職日:</td>
		<td><input name="empdoe" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>照片:</td>
		<td><input type="file" name="emppic" onchange="loadFile(event)" 
			 value="<%= (empVO==null)? "" : empVO.getEmppic()%>" />
			 <img src="" id="output"></td>	  
	</tr>
</table>

	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="新增">
	
</form>
 
	<script>
	var loadFile = function(event){
		var reader = new FileReader();
		reader.onload = function(event){
			var output = document.getElementById("output");
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	};
	</script>
	
</body>


<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Date empdoe = null;
  try {
	    empdoe = empVO.getEmpdoe();
   } catch (Exception e) {
	   	empdoe = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- 下面style是調月曆版面大小 -->
<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
<!-- 下面script是調語言，時間區間等等設定 -->
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=empdoe%>',   // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           minDate: '<%=empdoe%>', //'-1970-01-01', //去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
//(下面這邊是老師寫好的可用來設定日曆日期選擇，這是萬用的，可以用在不同的datetimepicker上)  
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');  //new Date()裡面的日期參數就是指定這日期前不能選擇
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>