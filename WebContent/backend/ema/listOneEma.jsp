<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ema.model.*"%>

<% EmaVO emaVO = (EmaVO) request.getAttribute("emaVO"); %>

<!DOCTYPE html>
<html>
<head>
<title>管理員資料 - listOneEma.jsp</title>

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
	width: 600px;
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
		<h3>管理員單筆資料</h3>
		<h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<td>管理員編號</td>
		<td>權限編號</td>
		<td>權限狀態</td>

	</tr>
	<tr>
		<td><%=emaVO.getEmpno() %></td>
		<td><%=emaVO.getEmrno() %></td>
		<td><%=emaVO.getEmastate() %></td>
	</tr>
</table>

</body>
</html>