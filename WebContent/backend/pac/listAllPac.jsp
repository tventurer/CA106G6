<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	PacService pacSvc = new PacService();
    List<PacVO> list = pacSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllPac.jsp</title>

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
<body bgcolor='yellow'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3 align="center">所有套裝行程資訊 - listAllPac.jsp</h3>
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
		<th>套裝行程編號</th>
		<th>管理員編號</th>
		<th>行程名稱</th>
		<th>旅遊國家</th>
		<th>旅遊城市</th>
		<th>行程總天數</th>
		<th>行程價格</th>
		<th>預繳訂金</th>
		<th>特色標籤</th>
		<th>行程內容</th>
		<th>行程特色1</th>
		<th>行程特色2</th>
		<th>注意事項</th>
		<th>套裝狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1" %> 
	<c:forEach var="pacVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<!-- 	begin 後面 跟page1  page2是分頁的東西	 -->
		<tr>
			<td>${pacVO.pacno}</td>
			<td>${pacVO.empno}</td>
			<td>${pacVO.pacname}</td>
			<td>${pacVO.paccountry}</td>
			<td>${pacVO.paccity}</td>
			<td>${pacVO.pactotalday}</td>
			<td>${pacVO.pacprice}</td> 
			<td>${pacVO.pacdeposit}</td>
			<td>${pacVO.pacdiv}</td>
			<td>${pacVO.paccontent}</td>
			<td><img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1"></td>
			<td><img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=2"></td>
			<td>${pacVO.pacremark}</td>
			<td>${pacVO.pacstatus}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="pacno"  value="${pacVO.pacno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="pacno"  value="${pacVO.pacno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2" %>

</body>
</html>