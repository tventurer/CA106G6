<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>

<%
  PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");
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
		 <h3>套裝訂單內容新增 - addPcd.jsp</h3></td><td>
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
		<td>出團內容編號:</td>
		<td><input type="TEXT" name="ptpno" size="30" 
			 value="<%= (pcdVO==null)? "PTP000002" : pcdVO.getPtpno()%>" /></td>
	</tr>
	<tr>
		<td>出團行程名稱:</td>
		<td><input type="TEXT" name="pacname" size="30" 
			 value="秀出對應名稱" /></td>
	</tr>
		<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="memno" size="30" 
			value="<%= (pcdVO == null)? "MEM000001" : pcdVO.getMemno()%>"></td>
	</tr>
	
		<tr>
		<td>參加人數:</td>
		<td><input type="TEXT" name="pcdtripmen" size="30" 
			value="<%= (pcdVO == null)? 2 : pcdVO.getPcdtripmen()%>"></td>
	</tr>
	<%
  	java.sql.Date pcdordday = null;
  		try {
  			pcdordday = pcdVO.getPcdordday();
   		} catch (Exception e) {
   			pcdordday = new java.sql.Date(System.currentTimeMillis());
   		}
  	%>
	
	<tr>
		<td>繳費日期:</td>
		<td><input name="pcdordday" type="TEXT" class="f_date" value="<%= (pcdVO == null)? pcdordday : pcdVO.getPcdordday()%>"></td>
	</tr>
	<tr>
		<td>繳費金額:</td>
		<td><input type="TEXT" name="pcdmoney" size="30" 
			value="<%= (pcdVO == null)? 8888 : pcdVO.getPcdmoney()%>"></td>
	</tr>
	<tr>
		<td>繳費狀態:</td>
		<td>
			<select name="pcdstatus">
				<option value=0>未繳費
				<option value=1>繳清
				<option value=2>已繳訂金
				<option value=3>取消訂單
			</select> 	
	</tr>
	<tr>
		<td>次要聯絡人手機:</td>
		<td><input type="TEXT" name="pcdsecphone" size="30"
			 value="<%= (pcdVO==null)? "0980888888" : pcdVO.getPcdsecphone()%>" /></td>
	</tr>
	
	<tr>
		<td>參團人員資料:</td>
		<td><input type="TEXT" name="pcdfamdata" size="30"
			 value="<%= (pcdVO==null)? "阿哩布達的資料" : pcdVO.getPcdfamdata()%>" /></td>
	</tr>
	<tr>
		<td>需求備註</td>
		<td><input type="TEXT" name="pcdmark" size="30"
			 value="<%= (pcdVO==null)? "我需要愛" : pcdVO.getPcdmark()%>" /></td>
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