<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.ptp.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  PtpVO ptpVO = (PtpVO) request.getAttribute("ptpVO"); //PacServlet.java(Concroller), 存入req的pacVO物件
%>
<html>
<head>
<title>套裝出團資料 - listOnePtp.jsp</title>

<style>
  table#table-1 {
	background-color: orange;
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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid green;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>套裝出團資料 - ListOnePtp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>套裝出團內容編號</th>
		<th>套裝行程編號</th>
		<th>出發時間</th>
		<th>回程時間</th>
		<th>報名截止時間</th>
		<th>行程異動公告</th>
		<th>剩餘空位</th>
		<th>最少出團人數</th>
		<th>團體人數上限</th>
		<th>出團狀態</th>
		<th>上架時間</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<tr>
		<td><%=ptpVO.getPtpno()%></td>
		<td><%=ptpVO.getPacno()%></td>
		<td><fmt:formatDate value="<%=ptpVO.getPtpstart()%>" pattern="yyyy-MM-dd HH:MM:ss"/></td>
		<td><%=ptpVO.getPtpend()%></td>
		<td><%=ptpVO.getPtpsigndle()%></td>
		<td><%=ptpVO.getPtpnotice()%></td>
		<td><%=ptpVO.getPtpvacancy()%></td>
		<td><%=ptpVO.getPtpminmen()%></td>
		<td><%=ptpVO.getPtpmaxmen()%></td>
		<td><%=ptpVO.getPtpstatus()%></td>
		<td><fmt:formatDate value="${ptpVO.ptptimelog}" pattern="yyyy-MM-dd HH:MM:ss"/></td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ptpno"  value="${ptpVO.ptpno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="ptpno"  value="${ptpVO.ptpno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
 	</tr>
</table>

</body>
</html>