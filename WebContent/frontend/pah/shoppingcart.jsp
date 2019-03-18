<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
	PahService phs = new PahService();
	pageContext.setAttribute("phs", phs);
%>
<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

<head>
<meta charset="UTF-8">
<title>購物車</title>
</head>
<body>


<H3><font color="red"><center>${shoppingMsgs}</center></font></H3>
	<c:forEach var="buyItem" items="${shoppingcart}" varStatus="s">
	
		<div class="card">
			<div class="card-header">
			</div>
<!----------------------------  商品詳情 -------------------------------------->
			<div class="card-body">
				<div class="container">
					<div class="row">
						<div class="col-6">
			 				<h3 class="card-title"><a href="<%=request.getContextPath()%>/pah/pahcontrol?action=findByPk&pahno=${buyItem.pahno}">${phs.findByPk(buyItem.pahno).pahname}</a></h3>
							<p class="card-text">台灣 --> ${phs.findByPk(buyItem.pahno).pahcountry} &nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp ${phs.findByPk(buyItem.pahno).pahcountry} --> 台灣</p>
							<p class="card-text">出發日期:${phs.findByPk(buyItem.pahno).pahstdate} &nbsp&nbsp|&nbsp&nbsp 回程日期:${phs.findByPk(buyItem.pahno).pahenddate}</p>
			  				<p class="card-text">商品單價:${phs.findByPk(buyItem.pahno).pahprice}</p>
			  				<footer class="blockquote-footer">
								購買數量: ${buyItem.pahnum} &nbsp&nbsp ( ${buyItem.pahprice} )<cite title="Source Title"></cite>
							</footer>								
			   				<form method="post" action="<%=request.getContextPath()%>/pah/shoppingcontrol">
								<input type="hidden" name="action" value="delete"> 
								<input type="hidden" name="url" value="<%=request.getServletPath()%>">
								<input type="hidden" name="del" value="${s.index}"> 
								<input type="hidden" name="pahno" value="${pahvo.pahno}">
								<input type="submit" class="btn btn-primary" value="刪除商品">
							</form>
						</div>
						<div class="col-6">
						</div>
					</div>
				</div>
			 </div>
<!----------------------------  商品詳情 -------------------------------------->			 
		</div>	
					
	</c:forEach>
				
<H1><font color="red">總金額:<c:out value="${totalbuy}" default="0"></c:out></font></H1>
							
				

</body>
</html>