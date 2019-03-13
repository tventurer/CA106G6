<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    PorService porSvc = new PorService();
    List<PorVO> list = porSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有交易紀錄 - listAllPor.jsp</title>
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
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有交易紀錄 - listAllPor.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/catimage.gif" height="32" border="0">回首頁</a></h4>
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
	    <th>訂單編號</th>
		<th>代購編號</th>
		<th>會員編號_買家</th>
		<th>收貨人</th>
		<th>商品價格</th>
		<th>購買時間</th>
		<th>收貨地址</th>
		<th>連絡電話</th>
		<th>交易狀態</th>
		<th>買家給予評價分數</th>
		<th>買家給予評價內容</th>
		<th>賣家給予評價分數</th>
		<th>賣家給予評價內容</th>
		<th>商品數量</th>
		<th>物流狀態</th>
		<th>QRCode</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="porVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${porVO.porid}</td>
			<td>${porVO.purid}</td>
			<td>${porVO.memno}</td>
			<td>${porVO.pormemname}</td>
			<td>${porVO.porprice}</td>
			<td>${porVO.portime}</td>
			<td>${porVO.poraddress}</td>
			<td>${porVO.portel}</td>
			<td>${porVO.porstatus}</td>
			<td>${porVO.porbuyscore}</td>
			<td>${porVO.porbuycontent}</td>
			<td>${porVO.porsellscore}</td>
			<td>${porVO.porsellcontent}</td>
			<td>${porVO.porsum}</td>
			<td>${porVO.porlogistics}</td>
			<td>${porVO.porqr}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="porid"  value="${porVO.porid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="porid"  value="${porVO.porid}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>