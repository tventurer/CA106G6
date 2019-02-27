<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ema.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	EmaVO emaVO = (EmaVO) request.getAttribute("emaVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>管理員權限資料新增 - addEma.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor="white">
	
<table id="table-1">
	<tr>
		<td>
			<h3>管理員權限資料新增</h3>
			<h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>	
		</td>
	</tr>
</table>

<h3>資料新增:</h3>
<c:if test="${not empty errorMsgs}" >
	<font style="color:red">請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="ema" name="form1" enctype="application/x-www-form-urlencoded">
<table>

	<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService"/>
	<jsp:useBean id="emrSvc" scope="page" class="com.emr.model.EmrService"/>
	
	<tr>
		<td>管理員姓名:</td>
		<td><select name="empno">
			<c:forEach var="empVO" items="${empSvc.all}">
				<option value="${empVO.empno}">${empVO.empname}</option>
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>權限名稱:</td>
		<td><select name="emrno">
			<c:forEach var="emrVO" items="${emrSvc.all}">
				<option value="${emrVO.emrno}">${emrVO.emrname}</option>
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>權限狀態:</td>
		<td><input type="radio" name="emastate"
			 value="1" ${(emaVO.emastate==1 || emaVO==null)? 'checked' : '' } />開通
			<input type="radio" name="emastate"
			 value="0" ${(emaVO.empgen==0)? 'checked' : '' } />停權</td>
	</tr>
</table>

	<br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="新增">
	
</form>
	
</body>

</html>