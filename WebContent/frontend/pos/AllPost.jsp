<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pos.model.*"%>
<%
  PosService posSvc = new PosService();
  List<PosVO> list = posSvc.getAll();
  request.setAttribute("list", list);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" /> 
<jsp:useBean id="bptSvc" scope="page" class="com.bpt.model.BptService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AllPost.jsp</title>

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

<table id="table-1">
	<tr><td>
		 <h3>AllPost.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/pos/AllPost.jsp">
		 <img src="<%=request.getContextPath()%>/backend/pos/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>會員帳號</th>
		<th>文章標籤編號</th>
		<th>標題</th>
		<th>內文</th>
		<th>發表時間</th>
		<th>文章全文</th>	
	</tr>
	
	<%@ include file="page1.file" %>
	<c:forEach var="posVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memSvc.getOneMem(posVO.memno).memacc}</td>
			<td>${bptSvc.getOneBpt(posVO.tagno).tagcontent}</td>
			<td>${posVO.postitle}</td>
			<td>${posVO.poscontent}</td>
			<td>${posVO.postime}</td>
			<td><a href="<%=request.getContextPath()%>/frontend/pos/listOnePos.jsp?posno=${posVO.posno}">全文</a></td>
		</tr>
	</c:forEach>
</table>
<h1><a href='<%=request.getContextPath()%>/frontend/pos/NewPost.jsp'>發表文章</a></h1>
<%@ include file="page2.file" %>


</body>
</html>