<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ptp.model.*"%>
<%-- <%@ import java.sql.timestamp; %> --%>

<%
  PtpVO ptpVO = (PtpVO) request.getAttribute("ptpVO"); //EmpServlet.java (Concroller) 存入req的ptpVO物件 (包括幫忙取出的ptpVO, 也包括輸入資料錯誤時的ptpVO物件)
  String requestURL = request.getParameter("requestURL");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程修改 - update_ptp_input.jsp</title>

<style>
  table#table-1 {
	background-color: Yellow;
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
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>套裝行程修改 - update_ptp_inputX.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" name="form1">
<table>
	<tr>
		<td>套裝出團內容編號:<font color=red><b>*</b></font></td>
		<td><%=ptpVO.getPtpno()%></td>
	</tr>
	<tr>
		<td>套裝行程編號:</td>
		<td><input type="TEXT" name="pacno" size="30"
			 value="<%= ptpVO.getPacno()%>" /></td>
	</tr>
	<tr>
		<td>出發時間:</td>
		<td><input type="TEXT" name="ptpstart" class="f_date1" size="30"
			 value="<%= ptpVO.getPtpstart()%>" /></td>
	</tr>
	<tr>
		<td>回程時間:</td>
		<td><input type="TEXT" name="ptpend" class="f_date2" size="30"
			 value="<%= ptpVO.getPtpend()%>" /></td>
	</tr>
	<tr>
		<td>報名截止時間:</td>
		<td><input type="TEXT" name="ptpsigndle" class="f_date2" size="30"
			 value="<%= ptpVO.getPtpsigndle()%>" /></td>
	</tr>
	<tr>
		<td>行程異動公告:</td>
		<td><input type="TEXT" name="ptpnotice" size="30"
			 value="<%= ptpVO.getPtpnotice()%>" /></td>
	</tr>
	<tr>
		<td>剩餘空位:</td>
		<td><input type="TEXT" name="ptpvacancy" size="30"
			 value="<%= ptpVO.getPtpvacancy()%>" /></td>
	</tr>
	
	<tr>
		<td>最少出團人數:</td>
		<td><input type="TEXT" name="ptpminmen" size="30"
			 value="<%= ptpVO.getPtpminmen()%>" /></td>
	</tr>
	<tr>
		<td>團體人數上限:</td>
		<td><input type="TEXT" name="ptpmaxmen" size="30"
			 value="<%= ptpVO.getPtpmaxmen()%>" /></td>
	</tr>
	
	<tr>
		<td>出團狀態:</td>
		<td><select name="ptpstatus">
				<option value=0>報名中
				<option value=1>額滿
				<option value=2>已成團
				<option value=3>保證出團
			</select> 
	</tr>
	
	<tr>
		<td>上架時間:</td>
		<td><input type="TIMESTAMP" name="ptptimelog" class="f_date1" size="30"
			 value="<%= ptpVO.getPtptimelog()%>" /></td>
	</tr>
	

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.pac.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<!-- <input type="hidden" name="action" value="update"> -->
<%-- <input type="hidden" name="ptpno" value="<%=ptpVO.getPtpno()%>"> --%>
<!-- <input type="submit" value="原廠送出修改"> -->
<input type="hidden" name="action" value="updateX">
<input type="hidden" name="ptpno" value="<%=ptpVO.getPtpno()%>">
<input type="hidden" name="requestURL" value="<%=requestURL%>">
<input type="submit" value="改版送出修改"></FORM>
</body>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh');
$('.f_date1').datetimepicker({
   		theme: '',              //theme: 'dark',
   		timepicker:true,       //timepicker:true,
   		step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
  		format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
   
   		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   		//startDate:	            '2017/07/10',  // 起始日
   		//minDate:               '-1970-01-01', // 去除今日(不含)之前
  		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

$('.f_date2').datetimepicker({
	   theme: '',              //theme: 'dark',
	   timepicker:false,       //timepicker:true,
	   step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	   format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   
	   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	   //startDate:	            '2017/07/10',  // 起始日
	   //minDate:               '-1970-01-01', // 去除今日(不含)之前
	   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});



</script>

</html>