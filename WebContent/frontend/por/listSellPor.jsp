<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.pur.model.*"%>
<%
	String name = "MEM000003";
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


<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<title>販售訂單管理</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/style/f/img/favicon.png"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/style/f/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link
	href="<%=request.getContextPath()%>/style/f/lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Libraries CSS Files -->
<link
	href="<%=request.getContextPath()%>/style/f/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/style/f/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/style/f/lib/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/style/f/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="<%=request.getContextPath()%>/style/f/css/style.css"
	rel="stylesheet">

<!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<style>
.img-fluid {
	height: 250px;
}
.table td, .table th{
    text-align: center;
}
</style>
</head>

<body>
<body>

	<div class="click-closed"></div>
	<!--/ Form Search Star 搜尋欄位的多重搜尋/-->
	<div class="box-collapse">
		<div class="title-box-d">
			<h3 class="title-d">Search Property</h3>
		</div>
		<span class="close-box-collapse right-boxed ion-ios-close"></span>
		<div class="box-collapse-wrap form">
			<form class="form-a">
				<div class="row">
					<div class="col-md-12 mb-2">
						<div class="form-group">
							<label for="Type">Keyword</label> <input type="text"
								class="form-control form-control-lg form-control-a"
								placeholder="Keyword">
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="Type">Type</label> <select
								class="form-control form-control-lg form-control-a" id="Type">
								<option>All Type</option>
								<option>For Rent</option>
								<option>For Sale</option>
								<option>Open House</option>
							</select>
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="city">City</label> <select
								class="form-control form-control-lg form-control-a" id="city">
								<option>All City</option>
								<option>Alabama</option>
								<option>Arizona</option>
								<option>California</option>
								<option>Colorado</option>
							</select>
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="bedrooms">Bedrooms</label> <select
								class="form-control form-control-lg form-control-a"
								id="bedrooms">
								<option>Any</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="garages">Garages</label> <select
								class="form-control form-control-lg form-control-a" id="garages">
								<option>Any</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
							</select>
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="bathrooms">Bathrooms</label> <select
								class="form-control form-control-lg form-control-a"
								id="bathrooms">
								<option>Any</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
							</select>
						</div>
					</div>
					<div class="col-md-6 mb-2">
						<div class="form-group">
							<label for="price">Min Price</label> <select
								class="form-control form-control-lg form-control-a" id="price">
								<option>Unlimite</option>
								<option>$50,000</option>
								<option>$100,000</option>
								<option>$150,000</option>
								<option>$200,000</option>
							</select>
						</div>
					</div>
					<div class="col-md-12">
						<button type="submit" class="btn btn-b">Search Property</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--/ Form Search End /-->

	<!--/ Nav Star /-->
	<nav
		class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
		<div class="container">
			<button class="navbar-toggler collapsed" type="button"
				data-toggle="collapse" data-target="#navbarDefault"
				aria-controls="navbarDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<!--/ 此處有用不能刪除 上面縮起來的三條橫線/-->
				<span></span> <span></span> <span></span>
				<!--/ 此處有用不能刪除/-->
			</button>
			<a class="navbar-brand text-brand" href="index.html">T-<span
				class="color-b">Venturer</span></a>
			<button type="button"
				class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none"
				data-toggle="collapse" data-target="#navbarTogglerDemo01"
				aria-expanded="false">
				<span class="fa fa-search" aria-hidden="true"></span>
			</button>
			<div class="navbar-collapse collapse justify-content-center"
				id="navbarDefault">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="index.html">首頁</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="about.html">關於</a>
					</li>
					<li class="nav-item"><a class="nav-link active"
						href="purIndex.jsp">代購商品</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 會員 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/acr/addOneAcr.jsp">儲值</a>
							<a class="dropdown-item" href="blog-single.html">訂單</a> <a
								class="dropdown-item" href="agents-grid.html">新增代購商品</a> <a
								class="dropdown-item" href="agent-single.html">我的代購商品</a>
						</div></li>
						
					<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
					</li>
				</ul>
			</div>
			<button type="button"
				class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block"
				data-toggle="collapse" data-target="#navbarTogglerDemo01"
				aria-expanded="false">
				<span class="fa fa-search" aria-hidden="true"></span>
			</button>
		</div>
	</nav>
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
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item active" aria-current="page">
								會員&nbsp;＞&nbsp;販售訂單管理</li>
						</ol>
					</nav>
				</div>
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
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="nav-footer">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#">Home</a></li>
							<li class="list-inline-item"><a href="#">About</a></li>
							<li class="list-inline-item"><a href="#">Property</a></li>
							<li class="list-inline-item"><a href="#">Blog</a></li>
							<li class="list-inline-item"><a href="#">Contact</a></li>
						</ul>
					</nav>
					<div class="socials-a">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-facebook" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-twitter" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-instagram" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-pinterest-p" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-dribbble" aria-hidden="true"></i>
							</a></li>
						</ul>
					</div>
					<div class="copyright-footer">
						<p class="copyright color-text-a">
							&copy; Copyright <span class="color-a">T-Venturer</span> All
							Rights Reserved.
						</p>
					</div>
					<div class="credits">
						<!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ Footer End /-->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>
	<!-- JavaScript Libraries -->
	<script
		src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery-migrate.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/style/f/lib/popper/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/style/f/lib/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/style/f/lib/easing/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script
		src="<%=request.getContextPath()%>/style/f/contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="<%=request.getContextPath()%>/style/f/js/main.js"></script>

</body>
</html>
