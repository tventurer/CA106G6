<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.acr.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	String name = request.getParameter("memno");
    AcrService acrSvc = new AcrService();
    List<AcrVO> list = acrSvc.getMemAll(name);
    pageContext.setAttribute("list",list);
    String purstatus[]={"未上架","上架中","已下架","檢舉下架"};
    request.setAttribute("purstatus", purstatus);
    
    String[] pursort = {"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
    request.setAttribute("pursort", pursort);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有交易紀錄 - listAllAcr.jsp</title>
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
		 <h3>所有交易紀錄 - listMemAllAcr.jsp</h3>
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
	    <th>交易編號</th>
		<th>會員編號</th>
		<th>交易金額</th>
		<th>轉入/轉出</th>
		<th>交易時間</th>
		<th>匯款目的地</th>
		<th>餘額</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>

   <%@ include file="page1.file" %> 
    
	<c:forEach var="acrVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr>
			<td>${acrVO.acrid}</td>
			<td>${acrVO.memno}</td>
			<td>${acrVO.acrprice < 0 ? 0-acrVO.acrprice : acrVO.acrprice}</td>
			<td>${acrVO.acrsource eq 0?"轉出":"轉入"}</td>
			<td>${acrVO.acrtime}</td>
			<td>${acrVO.acrend}</td>
			<td>${acrVO.acrtotal}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/acr/acr" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="acrid"  value="${acrVO.acrid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/acr/acr" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="acrid"  value="${acrVO.acrid}">
			     <input type="hidden" name="action" value="delete">
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page3.file" %>
</body>
</html>