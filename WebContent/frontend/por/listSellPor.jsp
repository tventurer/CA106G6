<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.pur.model.*"%>
<%
	String name=(String)session.getAttribute("memno");
	PurService purSvc = new PurService();
	List<PurVO> Purlist = purSvc.getMemAll(name);
	pageContext.setAttribute("Purlist", Purlist);

	PorService porSvc = new PorService();
	List<PorVO> Porlist = porSvc.getAll();
	pageContext.setAttribute("Porlist", Porlist);

	String purstatus[] = { "未上架", "上架中", "已下架", "檢舉下架" };
	request.setAttribute("purstatus", purstatus);

	String[] pursort = { "生活居家", "生活休閒", "國際菸草", "各國酒類", "玩具遊戲", "毛小孩專屬", "經典品牌", "行家收藏", "運動用品", "美妝保養" };
	request.setAttribute("pursort", pursort);
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
</style>
	<!--/ Nav End /-->

	<!--/ Intro Single star /-->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">賣家訂單</h1>
						<span class="color-text-a">如您有販賣商品，此處顯示的訂單為您產品的所有訂單</span>
					</div>
				</div>
<!-- 				<div class="col-md-12 col-lg-4"> -->
<!-- 					<nav aria-label="breadcrumb" -->
<!-- 						class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!-- 						<ol class="breadcrumb"> -->
<!-- 							<li class="breadcrumb-item"><a href="#">首頁</a></li> -->
<!-- 							<li class="breadcrumb-item active" aria-current="page"> -->
<!-- 								會員&nbsp;＞&nbsp;販售訂單管理</li> -->
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
						<h3 class="tile-title">販售訂單管理</h3>
						<table class="table table-hover">

							<thead>
								<tr>
									<th>編號</th>
									<th>商品編號</th>
									<th>商品圖片</th>
									<th>商品名稱</th>
									<th>商品數量</th>
									<th>賣出數量</th>
									<th>預計出貨時間</th>
									<th>訂單數量</th>
									<th>最新訂單時間</th>
									<th>查看該商品訂單</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="purVO" items="${Purlist}" varStatus="s">
									<tr>
										<td>${s.count}</td>
										<td>${purVO.purid}</td>
										<td><img
											src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}"
											width="100px"></td>
										<td>${purVO.purname}</td>
										<td>${purVO.purstock}</td>
										<td>${purVO.pursell}</td>
										<td><fmt:formatDate value="${purVO.purextime}"  timeStyle="short" type="both"/></td>
										<c:set var="id" scope="page" value="${purVO.purid}" />
										<%
											String id = (String) pageContext.getAttribute("id");
												List<PorVO> Porlist1 = porSvc.getPurAll(id);
												int Por_num = Porlist1.size();
												pageContext.setAttribute("Porlist1",Porlist1);
												pageContext.setAttribute("Por_num", Por_num);
										%>
										<td>${Por_num}</td>
										<c:forEach var="porVO" items="${Porlist1}" varStatus="a">
										<c:choose>
										<c:when test="${a.last}">
											<td><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/></td>
										</c:when>
										</c:choose>
										</c:forEach>
										<td>
							     		  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
						   		     	     <input type="submit" value="查看">
			                                 <input type="hidden" name="purid"  value="${purVO.purid}">
			                                 <input type="hidden" name="action"	value="show_One_Pur_ListPor"></FORM>
			 							</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ Agents Grid End /-->
	<br>

	<!--/ footer Star /-->
<!-- 	<footer> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<nav class="nav-footer"> -->
<!-- 						<ul class="list-inline"> -->
<!-- 							<li class="list-inline-item"><a href="#">Home</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#">About</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#">Property</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#">Blog</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#">Contact</a></li> -->
<!-- 						</ul> -->
<!-- 					</nav> -->
<!-- 					<div class="socials-a"> -->
<!-- 						<ul class="list-inline"> -->
<!-- 							<li class="list-inline-item"><a href="#"> <i -->
<!-- 									class="fa fa-facebook" aria-hidden="true"></i> -->
<!-- 							</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#"> <i -->
<!-- 									class="fa fa-twitter" aria-hidden="true"></i> -->
<!-- 							</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#"> <i -->
<!-- 									class="fa fa-instagram" aria-hidden="true"></i> -->
<!-- 							</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#"> <i -->
<!-- 									class="fa fa-pinterest-p" aria-hidden="true"></i> -->
<!-- 							</a></li> -->
<!-- 							<li class="list-inline-item"><a href="#"> <i -->
<!-- 									class="fa fa-dribbble" aria-hidden="true"></i> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					<div class="copyright-footer"> -->
<!-- 						<p class="copyright color-text-a"> -->
<!-- 							&copy; Copyright <span class="color-a">T-Venturer</span> All -->
<!-- 							Rights Reserved. -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<div class="credits"> -->
<!-- 						
<!--               All the links in the footer should remain intact. -->
<!--               You can delete the links only if you purchased the pro version. -->
<!--               Licensing information: https://bootstrapmade.com/license/ -->
<!--               Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency -->
<!--             --> -->
<!-- 						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</footer> -->
	<!--/ Footer End /-->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>

</body>
</html>
