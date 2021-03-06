<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pos.model.*" %>
<!DOCTYPE html>

<%
  PosVO posVO = (PosVO) request.getAttribute("posVO");
%>
<html>
<head>
<meta charset="UTF-8">
<title>文章資料 - listOnePos.jsp</title>

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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>文章資料 - listOnePos.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/pos/select_page.jsp"><img src="<%=request.getContextPath()%>/backend/pos/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>文章編號</th>
		<th>會員編號</th>
		<th>文章標籤編號</th>
		<th>標題</th>
		<th>內文</th>
		<th>發表時間</th>		
	</tr>
	<tr>
		<td><%=posVO.getPosno()%></td>
		<td><%=posVO.getMemno()%></td>
		<td><%=posVO.getTagno()%></td>
		<td><%=posVO.getPostitle()%></td>
		<td><%=posVO.getPoscontent()%></td>
		<td><%=posVO.getPostime()%></td>
	</tr>
</table>

</body>
</html>