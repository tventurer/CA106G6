<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.emr.model.*" %>

<%
	EmrVO emrVO = (EmrVO) request.getAttribute("emrVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>管理員資料修改 - update_emr_input.jsp</title>

<style>
	table#table-1 {
		background-color: #CCCCFF;
		border: 2px solid black;
		text-align: center;
	}
	table#table-1 h4{
		color: red;
		display: block;
		margin-bottom: 1px;
	}
	h4{
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
			<h3>管理員資料修改</h3>
			<h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
		</td>
	</tr>
</table>

<h3>資料修改:</h3>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="emr" name="form1" enctype="application/x-www-form-urlencoded">
<table>
	<tr>
		<td>管理員編號:</td>
		<td><%= emrVO.getEmrno() %></td>
	</tr>
	<tr>
		<td>管理員姓名:</td>
		<td><input type="text" name="emrname" size="45"
			 value="<%= emrVO.getEmrname()%>" /></td>
	</tr>
</table>

<br>

<input type="hidden" name="emrno" value="<%= emrVO.getEmrno()%>" >
<input type="hidden" name="action" value="update" >
<input type="submit" value="修改" >
	
</form>
	
</body>

</html>