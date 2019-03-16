<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.not.model.*"%>
<%
  NotService notSvc = new NotService();
  List<NotVO> list = notSvc.getByMemno((String) session.getAttribute("memno"));
  request.setAttribute("list", list);
%>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" /> 
<jsp:useBean id="bptSvc" scope="page" class="com.bpt.model.BptService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有通知</title>

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
		 <h3>所有通知AllMyNot.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/pos/AllPost.jsp">
		 <img src="<%=request.getContextPath()%>/backend/pos/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>通知內容</th>
		<th>已讀?</th>
		<th>時間</th>
	</tr>
	
	<%@ include file="page1.file" %>
	<c:forEach var="notVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${notVO.notcontent}</td>
			<td>${notVO.notreaded != 0? "已讀" : "未讀"}</td>
			<td>${notVO.nottime}</td> 
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


</body>
</html>