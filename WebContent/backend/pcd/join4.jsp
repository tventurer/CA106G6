<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>

<%
PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");
pageContext.setAttribute("pcdVO", pcdVO);
  
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程新增 - addPcd.jsp</title>

<style>
  table#table-1 {
	background-color: LIGHTBLUE;
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
		 <h3>套裝訂單內容新增 - join4.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" name="form1">
<table>
	<tr>
		<td>*出團內容編號:</td>
		<td><input type="TEXT" name="ptpno" size="30" 
			 value="<%= pcdVO.getPtpno()%>" /></td>
	</tr>
	<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
	<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>
	<tr>
		<td>出團行程名稱:</td>
		<td><input type="TEXT" name="pacname" size="30" 
			 value="${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}" /></td>
<%-- 			 value="${pacSvc.getOnePac(ptpSvc.getOnePtp("PTP000003").pacno).pacname}" /></td> --%>
	</tr>
	<tr>
		<td>*會員編號:</td>
		<td><%= pcdVO.getMemno()%></td>
	</tr>
	<tr>
		<td>*參加人數:</td>
		<td>${pcdVO.pcdtripmen}</td>
	</tr>
	
	<%
	java.sql.Date pcdordday = new java.sql.Date(System.currentTimeMillis());

   		
  	%>
	
	<tr>
		<td>繳費日期:</td>
		<td><%= pcdordday.toString()%></td>
	</tr>
	
	<tr>
		<td>繳費金額:</td>
		<td>${pcdVO.pcdtripmen*pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacprice}</td>
	</tr>

	<tr>
		<td>繳費狀態:</td>
		<td>
			<select name="pcdstatus">
				<option value=0>未繳費
			</select> 	
	</tr>
	<tr>
		<td>次要聯絡人手機:</td>
		<td><input type="TEXT" name="pcdsecphone" size="30"
			 value="<%= (pcdVO.getPcdsecphone() == null)? "":pcdVO.getPcdsecphone() %>"> </td>
	</tr>
	
	<tr>
		<td>參團人員資料:</td>
		<td><input type="TEXT" name="pcdfamdata" size="30"
			 value="<%= (pcdVO.getPcdfamdata() == null)? "": pcdVO.getPcdfamdata() %>"> </td>
	</tr>
	<tr>
		<td>需求備註</td>
		<td><input type="TEXT" name="pcdmark" size="30"
			 value="<%= (pcdVO.getPcdmark() == null)? "": pcdVO.getPcdmark() %>" /></td>
	</tr>
</table>
	
	
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
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
$('.f_date').datetimepicker({
   		theme: '',              //theme: 'dark',
   		timepicker:false,       //timepicker:true,
   		step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
  		format:'Y-m-d',         //format:'Y-m-d H:i:s',
   
   		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   		//startDate:	            '2017/07/10',  // 起始日
   		//minDate:               '-1970-01-01', // 去除今日(不含)之前
  		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

</script>
</html>