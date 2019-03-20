<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pcd.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO"); //PacServlet.java(Concroller), 存入req的pacVO物件
%>
<html>
<head>
<title>員工資料 - listOnePcd.jsp</title>

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
		 <h3>員工資料 - ListOnePcd.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>套裝訂單編號</th>
		<th>套裝出團內容編號</th>
		<th>會員編號</th>
		<th>參加人數</th>
		<th>繳費日期</th>
		<th>繳費金額</th>
		<th>費用狀態</th>
		<th>第二聯絡人</th>
		<th>參團人資料</th>
		<th>需求註記</th>
		<th>修改</th>
		<th>刪除</th>
		
	</tr>
	<tr>
			<td>${pcdVO.pcdno}</td>
			<td>${pcdVO.pcdno}</td>
			<td>${pcdVO.memno}</td>
			<td>${pcdVO.pcdtripmen}</td> 
			<td><fmt:formatDate value="${pcdVO.pcdordday}" pattern="yyyy-MM-dd"/></td>
			<td>${pcdVO.pcdmoney}</td>
			<td>${pcdVO.pcdstatus}</td>
			<td>${pcdVO.pcdsecphone}</td>
			<td>${pcdVO.pcdfamdata}</td>
			<td>${pcdVO.pcdmark}</td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="pcdno"  value="${pcdVO.pcdno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="pcdno"  value="${pcdVO.pcdno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
 	</tr>
</table>

</body>
</html>