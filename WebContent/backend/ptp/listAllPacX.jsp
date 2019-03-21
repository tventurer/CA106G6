<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ptp.model.*"%>

<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />

<html>
<head><title>所有部門 - listAllPacX.jsp</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有部門 - ListAllPacX.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/pac/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
<a href='addPacX.jsp'>新增</a>一個套裝行程 .
<table>
	<tr>
		<th>行程編號</th>
		<th>行程名稱</th>
		<th>行程價格</th>
		<th>修改</th>
		<th>刪除<font color=red>(關聯測試與交易-小心)</font></th>
		<th>查詢細節時間</th>
	</tr>
	
	<c:forEach var="pacVO" items="${pacSvc.all}">
		<tr ${(pacVO.pacno==param.pacno) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色-->
			<td>${pacVO.pacno}</td>
			<td>${pacVO.pacname}</td>
			<td>${pacVO.pacprice}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			    <input type="submit" value="修改"  > 
			    <input type="hidden" name="pacno" value="${pacVO.pacno}">
			    <input type="hidden" name="requestURL" value="/backend/ptp/listAllPacX.jsp">
			    <input type="hidden" name="action" value="getOne_For_Update_Pac"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			    <input type="submit" value="刪除" disabled="disabled">
			    <input type="hidden" name="pacno" value="${pacVO.pacno}">
			    <input type="hidden" name="action" value="delete_Pac"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			    <input type="submit" value="送出查詢"> 
			    <input type="hidden" name="pacno" value="${pacVO.pacno}">
			    <input type="hidden" name="action" value="listPtps_ByPacno_B"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listPtps_ByPacno")!=null){%>
       <jsp:include page="listPtps_ByPacno.jsp" />
<%} %>

</body>
</html>