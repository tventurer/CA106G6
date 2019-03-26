<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    PacService pacSvc = new PacService();
    List<PacVO> list = pacSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllPac.jsp</title>
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
    border: 10px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  h5, .h5 {
    font-size: 1.09375rem;
    text-align: right;
}
</style>

</head>
<body class="app sidebar-mini rtl" >
<jsp:include page="/backend/backbar.jsp" />
<main class="app-content">
<div class="container-fluid">
<div class="row">
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>



<div class="row">
<div class="col-md-12">
<div class="tile">
<div class="tile-body">
<div class='head'><h5><a href='../ptp/listAllPacX.jsp'>回套裝總覽</a></h5>
</div>
<table class="table table-hover table-bordered">
	<tr>
		<th>套裝行程編號</th>
		<th>行程名稱</th>
		<th>旅遊國家</th>
		<th>旅遊城市</th>
		<th>行程總天數</th>
		<th>行程價格</th>
		<th>預繳訂金</th>
		<th>特色標籤</th>
		<th>行程特色1</th>
		<th>行程特色2</th>
		<th>套裝狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1" %> 
	<c:forEach var="pacVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<!-- 	begin 後面 跟page1  page2是分頁的東西	 -->
		<tr>
			<td>${pacVO.pacno}</td>
			<td>${pacVO.pacname}</td>
			<td>${pacVO.paccountry}</td>
			<td>${pacVO.paccity}</td>
			<td>${pacVO.pactotalday}</td>
			<td>${pacVO.pacprice}</td> 
			<td>${pacVO.pacdeposit}</td>
			<td>${pacVO.pacdiv}</td>
			<td><img width="150px" src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1"></td>
			<td><img width="150px" src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=2"></td>
			<td>
			<c:if test="${pacVO.pacstatus == 0}">可出團</c:if>
			<c:if test="${pcdVO.pcdstatus == 1}">不再出團</c:if>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="pacno"  value="${pacVO.pacno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="pacno"  value="${pacVO.pacno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
 <%@ include file="page2" %>
 </div>
</div>
</div>
</div>
</div>  
</main>
</body>
</html>