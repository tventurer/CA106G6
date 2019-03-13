<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pur.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
	PurVO purVO =(PurVO) request.getAttribute("purVO");//PurServlet.java(Concroller),存入req的PurVO物件
    String purstatus[]={"未上架","上架中","已下架","檢舉下架"};
    request.setAttribute("purstatus", purstatus);
    
    String[] pursort = {"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
    request.setAttribute("pursort", pursort);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員商品明細 - listOnePur.jsp</title>
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
<table id="table-1" style="width:1800px;">
	<tr><td>
		 <h3>會員交易歷史紀錄 - listOnePur.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/catimage.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table border="1" style="word-break:break-all; word-wrap:break-word; width:1800px;">
	<tr>
		<th>代購商品編號</th>
		<th>賣家會員編號</th>
		<th>代購商品名稱</th>
		<th>商品描述</th>
		<th>商品類別</th>
		<th>參考網址</th>
		<th>購買國家</th>
		<th>收貨國家</th>
		<th>參考售價</th>
		<th>訂單定價</th>
		<th>下架時間</th>
		<th>發佈時間</th>
		<th>提供收據</th>
		<th>代購狀態</th>
		<th>商品圖片</th>
		<th>預計出貨時間</th>
		<th>商品數量</th>
		<th>評價限制</th>
		<th>最後修改時間</th>
	</tr>
	<tr>
					<tr>
			<td>${purVO.purid}</td>
			<td>${purVO.memno}</td>
			<td>${purVO.purname}</td>
			<td>${purVO.purcontent}</td>
		 <c:forEach var="mypursort" items="${pursort}" varStatus="s">
		 <c:choose>
		 <c:when test="${purVO.pursort == s.index}">
		 <td>${mypursort}</td>
		 </c:when>
		 </c:choose>
		 </c:forEach>
			<td>${purVO.pururl}</td> 
			<td>${purVO.purcountry}</td>
			<td>${purVO.purdelivery}</td>
			<td>${purVO.purreprice}</td>
			<td>${purVO.purpricing}</td>
			<td>
			<fmt:formatDate value="${purVO.purobtained}"  timeStyle="short" type="both"/>
			</td>
			<td><fmt:formatDate value="${purVO.purtime}"  timeStyle="short" type="both"/></td>
			<td>${purVO.purreceipt eq 0? "不提供" : "提供"}</td>
		<c:forEach var="mypurstatus" items="${purstatus}" varStatus="s">
		 <c:choose>
		 <c:when test="${purVO.purstatus == s.index}">
		 <td>${mypurstatus}</td>
		 </c:when>
		 </c:choose>
		 </c:forEach> 
			<td><img src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" width="100px"></td>
			<td><fmt:formatDate value="${purVO.purextime}"  timeStyle="short" type="both"/></td>
			<td>${purVO.purstock}</td>
			<td>${purVO.purlimit}</td>
			<td><fmt:formatDate value="${purVO.pursavetime}" pattern="yyyy-MM-dd HH:mm"/></td>
	</tr>
</table>

</body>
</html>