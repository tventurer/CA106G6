<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mpm.model.*" %>
<%@ page import="com.mem.model.*" %>
<%
  List<MpmVO> list = (List<MpmVO>) request.getAttribute("list");
%>
<jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有私人訊息</title>

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
		 <h3>AllMyPM.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/pos/AllPost.jsp">
		 <img src="<%=request.getContextPath()%>/backend/pos/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>
<h1>${errorMsgs.mpmisempty}</h1>
<table>
	<tr>
		<th>發送者</th>
		<th>收信者</th>
		<th>標題</th>
		<th>內文</th>
		<th>時間</th>
		<th>已讀?</th>		
	</tr>
	
	<%@ include file="page1.file" %>
	<c:forEach var="mpmVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td><a href="<%=request.getContextPath()%>/frontend/mem/MyPage.jsp?memno=${memSvc.getOneMem(mpmVO.mpmsender).memno}">${memSvc.getOneMem(mpmVO.mpmsender).memacc}</a></td>
			<td><a href="<%=request.getContextPath()%>/frontend/mem/MyPage.jsp?memno=${memSvc.getOneMem(mpmVO.mpmreceiver).memno}">${memSvc.getOneMem(mpmVO.mpmreceiver).memacc}</a></td>
			<td>${mpmVO.mpmtitle}</td>
			<td>${mpmVO.mpmcontent}</td>
			<td>${mpmVO.mpmtime}</td>
			<td>${mpmVO.mpmreaded == 0 ? "未讀" : "已讀"}</td> 
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


</body>
</html>