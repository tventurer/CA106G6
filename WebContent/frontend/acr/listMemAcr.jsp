<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.acr.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%
	String name=(String)session.getAttribute("memno");
	AcrService acrSvc = new AcrService();
	pageContext.setAttribute("name",name);
	
	Integer total = acrSvc.getMemacrtotal(name);
	pageContext.setAttribute("total",total);
	List<AcrVO> Acrlist = acrSvc.getMemAll(name);
	pageContext.setAttribute("Acrlist",Acrlist);
	int Acr_num = Acrlist.size();
	pageContext.setAttribute("Acr_num",Acr_num);
%> 

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />

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

</style>
	<!--/ Nav End /-->

	<!--/ Intro Single star /-->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">儲值紀錄</h1>
						<h3><span class="color-text-a">目前儲值餘額：${total}</span></h3>
						
					</div>
				</div>
<!-- 				<div class="col-md-12 col-lg-4"> -->
<!-- 					<nav aria-label="breadcrumb" -->
<!-- 						class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!-- 						<ol class="breadcrumb"> -->
<!-- 							<li class="breadcrumb-item"><a href="#">首頁</a></li> -->
<!-- 							<li class="breadcrumb-item active" aria-current="page"> -->
<!-- 								會員&nbsp;＞&nbsp;代幣儲值&nbsp;＞&nbsp;儲值紀錄</li> -->
<!-- 						</ol> -->
<!-- 					</nav> -->
<!-- 				</div> -->
			</div>
		</div>
	</section>
	<!--/ Intro Single End /-->

	<!--/ Agents Grid Star /-->
	<section class="agents-grid grid">
		<div class="container">
			<div class="row">
			<div class="col-md-12">
			<div class="tile">
			
			<h3 class="tile-title">代幣儲值紀錄</h3>
			<h4 style="text-align: right;"><span class="color-text-a"><i class="fa fa-hand-paper-o" aria-hidden="true"></i>&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/frontend/acr/addOneAcr.jsp">我要儲值</a></span></h4>
			<table class="table table-hover">
				<thead>
					<tr>
					<th>編號</th>
					<th>交易編號</th>
					<th>交易金額</th>
					<th>交易日期</th>
					<th>交易動作</th>
					<th>交易內容</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${fn:length(Acrlist) == 0}">
					<tr>
						<td  colspan="10"><br><h5>您尚無任何交易儲值紀錄~ <a href="<%=request.getContextPath()%>/frontend/acr/addOneAcr.jsp">馬上儲值去~ </a></h5><br></td>
					</tr>
				</c:if>
				<%@ include file="page1.file" %>
				<c:forEach var="acrVO" items="${Acrlist}" varStatus="s" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<tr>
					<td>${s.count}</td>
					<td>${acrVO.acrid}</td>
						<c:if test="${acrVO.acrprice < 0}">
						<td>${0-acrVO.acrprice}</td>
						</c:if>
						<c:if test="${acrVO.acrprice > 0}">
						<td>${acrVO.acrprice}</td>
						</c:if>
					<td><fmt:formatDate value="${acrVO.acrtime}"  timeStyle="short" type="both"/></td>
					<td>${acrVO.acrsource eq 0? "轉出" : "轉入"}</td>
					<td>${acrVO.acrend}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
			</div>
	 <!--頁碼-->
    <%@ include file="page2.file" %>
     <!--頁碼-->
		</div>
	</section>
	<!--/ Agents Grid End /-->
	<br>

<jsp:include page="/frontend/footer.jsp" />
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>

</body>
</html>
