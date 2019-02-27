<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.emr.model.*" %>

<%  
	EmrService EmrSvc = new EmrService();
    List<EmrVO> list = EmrSvc.getAll();
	pageContext.setAttribute("list",list);  //取得值為何要  
%>

<!DOCTYPE html>
<html>
<head>
<title>所有管理員資料 - listAllEmr.jsp</title>

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
<body>

<table id="table-1">
	<tr>
		<td>
			<h3>所有管理員資料</h3>
			<h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
		</td>
	</tr>
</table>

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
		<td>權限編號</td>
		<td>權限名稱</td>
		<td>修改</td>
		<td>刪除</td>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="emrVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${emrVO.emrno}</td>
			<td>${emrVO.emrname}</td>
			<td>
			    <form method="post" action="<%=request.getContextPath()%>/backend/emr/emr" style="margin-bottom: 0px;">
			        <input type="submit" value="修改">
			        <input type="hidden" name="emrno"  value="${emrVO.emrno}">
			        <input type="hidden" name="action"	value="getOne_For_Update">
			    </form>
			</td>
			<td>
			    <form method="post" action="<%=request.getContextPath()%>/backend/emr/emr" style="margin-bottom: 0px;">
			        <input type="submit" value="刪除">
			        <input type="hidden" name="emrno"  value="${emrVO.emrno}">
			        <input type="hidden" name="action" value="delete">
			    </form>
			</td>	
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>