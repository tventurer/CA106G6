<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pcd.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    PcdService pcdSvc = new PcdService();
    List<PcdVO> list = pcdSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllPcd.jsp</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 10px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='pink'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3 align="center">所有套裝出團資訊 - listAllPcd.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
	<%@ include file="page1" %> 
	<c:forEach var="pcdVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<!-- 	begin 後面 跟page1  page2是分頁的東西	 -->
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
			<td>${pcdVO.pcdmark==null ? '' : pcdVO.pcdmark}</td>
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
	</c:forEach>
</table>
<%@ include file="page2" %>

</body>
</html>