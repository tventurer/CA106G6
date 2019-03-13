<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    String name = new String(request.getParameter("memno"));
	PurService purSvc = new PurService();
	List<PurVO> list = purSvc.getAll();
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
<title>該會員販賣的所有商品 - listAllPur.jsp</title>
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
   td{
  width: 30px;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1" style="width:1800px;">
	<tr><td>
		 <h3>該會員販賣的所有商品 - listAllPur.jsp</h3>
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
		<th>修改</th>
		<th>下架</th>
	</tr>
	 <%@ include file="page1.file" %> 
	<c:forEach var="purVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
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
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pur/pur" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="purid"  value="${purVO.purid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pur/pur" style="margin-bottom: 0px;">
			     <input type="submit" value="會員下架產品">
			     <input type="hidden" name="purid"  value="${purVO.purid}">
			     <input type="hidden" name="memno"  value="${purVO.memno}">
			     <input type="hidden" name="allpur"  value="memallpur">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page3.file" %>
</body>
</html>