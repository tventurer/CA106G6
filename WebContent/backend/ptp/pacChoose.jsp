<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>
<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>
<%

String pacno = request.getParameter("pacno");
PacVO pacVO = pacSvc.getOnePac(pacno);
pageContext.setAttribute("pacVO", pacVO);
String ptpno = request.getParameter("ptpno");
PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
pageContext.setAttribute("ptpVO", ptpVO);
List<PacVO> list = pacSvc.getAll();
pageContext.setAttribute("list",list);
List<PtpVO> listptp = ptpSvc.getAll();
pageContext.setAttribute("listptp", listptp);
%>


<%
String errorInfo = (String)request.getAttribute("loginError");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title><%=pacVO.getPacname()%></title>
<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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
  <style>
  carousel-item-b img{
      max-width:600px;
      height:700px; 
      
  }
</style>
</head>

<body>
<jsp:include page="/frontend/navbar.jsp"/>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=pacVO.getPacname()%></h1>
            <span class="color-text-a"><%=pacVO.getPacno() %></span>
          </div>
        </div>
      
       
       <table>
	<tr>
		<th>出發時間</th>
		<th>回程時間</th>
		<th>行程天數</th>
		<th>截止日期</th>
		<th>剩餘空位</th>
		<th>行程狀態</th>
		<th>訂金</th>
		<th>售價</th>
		<th>查詢詳情</th>
		
		
	</tr>
<% 
  List<PtpVO> newlist = ptpSvc.getAll();
  newlist = newlist.stream()
              .filter(vo -> vo.getPacno().equals(pacVO.getPacno()))
              .collect(java.util.stream.Collectors.toList());
  request.setAttribute("newlist", newlist);
%>
	
	<c:forEach var="ptpVO" items="${newlist}" >
		<tr ${(ptpVO.ptpno==param.ptpno) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色-->
	<c:if test="${ptpVO.pacno==pacVO.pacno}">
			<td>
	            <font color=blue><fmt:formatDate value="${ptpVO.ptpstart}" pattern="yyyy-MM-dd HH:MM E"/></font>
			</td>
			<td>
	            <fmt:formatDate value="${ptpVO.ptpend}" pattern="yyyy-MM-dd HH:MM E"/>
			</td>
			<td>
	                   【<font color=orange>${pacVO.pactotalday}</font>】
			</td>
			<td>${ptpVO.ptpsigndle}</td>
			<td>${ptpVO.ptpvacancy}</td>
			<td>
			<c:if test="${ptpVO.ptpstatus == 0}">報名中</c:if>
			<c:if test="${ptpVO.ptpstatus == 1}">額滿</c:if>
			<c:if test="${ptpVO.ptpstatus == 2}">已成團</c:if>
			<c:if test="${ptpVO.ptpstatus == 3}">保證成團</c:if>
			</td>
			<td>${pacVO.pacdeposit}</td>
			<td>${pacVO.pacprice}</td>
		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			    <input type="submit" value="查看詳情"> 
			    <input type="hidden" name="ptpno"      value="${ptpVO.ptpno}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--><!-- 目前尚未用到  -->
			    <input type="hidden" name="pacno"      value="${ptpVO.pacno}">
			    <input type="hidden" name="action"	   value="joinPtp1"></FORM>
			</td>
			</c:if>
			<c:if test="${ptpVO.pacno!=pacVO.pacno}">
				<tr><td><h4>無出團資訊</h4></tr></tr>
			</c:if>
			</c:forEach>
			<h4>無出團資訊</h4></tr>
			
</table>
        
  <!-- JavaScript Libraries -->
  <script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery-migrate.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/popper/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/easing/easing.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="<%=request.getContextPath()%>/style/f/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%=request.getContextPath()%>/style/f/js/main.js"></script>

</body>
</html>
