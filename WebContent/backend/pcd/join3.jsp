<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>
<%@ page import="com.ptp.model.*"%>
<%@ page import="java.util.*"%>


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
		 <h3>套裝訂單內容新增 - join3.jsp</h3></td><td>
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
	<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
	<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>
	<tr>
		<td>出團行程名稱:</td>
		<td><input type="TEXT" name="pacname" size="30" 
			 value="${pacSvc.getOnePac(ptpSvc.getOnePtp("PTP000002").pacno).pacname }" /></td>
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
		
	
</table>
<br>


<input type="hidden" name="action" value="join4">
<input type="submit" value="送出新增"></FORM>
</body>

</html>