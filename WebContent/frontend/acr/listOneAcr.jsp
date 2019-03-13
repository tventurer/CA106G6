<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.acr.model.*"%>

<% 
	AcrVO acrVO =(AcrVO) request.getAttribute("acrVO");//AcrServlet.java(Concroller),存入req的AcrVO物件
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員交易歷史紀錄 - listOneAcr.jsp</title>
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
		 <h3>會員交易歷史紀錄 - listOneAcr.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/catimage.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
	    <th>交易編號</th>
		<th>會員編號</th>
		<th>交易金額</th>
		<th>轉入/轉出</th>
		<th>交易時間</th>
		<th>匯款目的地</th>
		<th>餘額</th>
	</tr>
	<tr>
			<td>${acrVO.acrid}</td>
			<td>${acrVO.memno}</td>
			<td>${acrVO.acrprice < 0 ? 0-acrVO.acrprice : acrVO.acrprice}</td>
			<td>${acrVO.acrsource eq 0?"轉出":"轉入"}</td>
			<td>${acrVO.acrtime}</td>
			<td>${acrVO.acrend}</td>
			<td>${acrVO.acrtotal}</td>
	</tr>
</table>

</body>
</html>