<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pcd.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />
<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService" />
<jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService" />

<%
	String memno=(String)session.getAttribute("memno");
    Set<PcdVO> set = pcdSvc.member_query(memno);
    pageContext.setAttribute("set",set);
%>


<html>
<head>
<title>會員查詢訂單 - listAllPcd.jsp</title>
<style>
.img-fluid {
	height: 250px;
}
.table td, .table th{
    text-align: center;
}
.modal-body{
text-align: left;
}



/* Rating Star Widgets Style */
.rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2.5em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
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
<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">報名訂單</h1>
						<h4>您所有的報名訂單</a></h4>
					</div>
				</div>
			</section>
			
     <section class="agents-grid grid">
		<div class="container">
			<div class="row">
			<div class="col-md-12">
			<div class="tile">
<!-- 				<h3 class="tile-title">代購商品列表</h3> -->
			<table class="table table-hover">

				<thead>
					<tr>
						<th>訂單編號</th>
						<th>報名活動名稱</th>
						<th>人數</th>
						<th>繳費日期</th>
						<th>繳費金額</th>
						<th>費用狀態</th>
						<th>第二聯絡人</th>
						<th>參團人資料</th>
						<th>需求註記</th>
						<th>修改</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pcdVO" items="${set}">
					<tr ${(pcdVO.pcdno==param.pcdno) ? 'bgcolor=#CCCCFF':''}>
						<td>${pcdVO.pcdno}</td>
					<td>${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}</td>
					<td>${pcdVO.pcdtripmen}</td> 
					<td><fmt:formatDate value="${pcdVO.pcdordday}" pattern="yyyy-MM-dd"/></td>
					<td>${pcdVO.pcdmoney}</td>
					<td>
					<c:if test="${pcdVO.pcdstatus == 0}">未繳費</c:if>
					<c:if test="${pcdVO.pcdstatus == 1}">已繳全額</c:if>
					<c:if test="${pcdVO.pcdstatus == 2}">已繳訂金</c:if>
					<c:if test="${pcdVO.pcdstatus == 3}">取消訂單</c:if>
					</td>
					<td>${pcdVO.pcdsecphone}</td>
					<td>${pcdVO.pcdfamdata}</td>
					<td>${pcdVO.pcdmark==null ? '無' : pcdVO.pcdmark}</td>
					<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" style="margin-bottom: 0px;">
					     <input type="submit" value="修改">
					     <input type="hidden" name="pcdno"  value="${pcdVO.pcdno}">
					     <input type="hidden" name="action"	value="getOne_For_UpdateX"></FORM>
					</td>		
					</td>
				</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
			</div>
</body>
</html>