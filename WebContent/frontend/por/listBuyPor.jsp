<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.pur.model.*"%>
<%
	String name = "MEM000001";
	PurService purSvc = new PurService();
	pageContext.setAttribute("name",name);

	PorService porSvc = new PorService();
	List<PorVO> Porlist = porSvc.getMemAllPor(name);
	pageContext.setAttribute("Porlist", Porlist);

	String purstatus[] = { "未上架", "上架中", "已下架", "檢舉下架" };
	request.setAttribute("purstatus", purstatus);

	String[] pursort = { "生活居家", "生活休閒", "國際菸草", "各國酒類", "玩具遊戲", "毛小孩專屬", "經典品牌", "行家收藏", "運動用品", "美妝保養" };
	request.setAttribute("pursort", pursort);
	
	String porlogistics[] = { "待出貨" , "已出貨", "已領貨", "等待退換貨寄回", "寄出退換貨" ,"已收到退換貨"};
	request.setAttribute("porlogistics", porlogistics);
%>


<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<title>購買訂單管理</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

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
.modal-body{
text-align: left;
}

.success-box {
  margin:50px 0;
  padding:10px 10px;
  border:1px solid #eee;
  background:#f9f9f9;
}

.success-box img {
  margin-right:10px;
  display:inline-block;
  vertical-align:top;
}

.success-box > div {
  vertical-align:top;
  display:inline-block;
  color:#888;
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
						<h1 class="title-single">買家訂單</h1>
						<span class="color-text-a">如您有購買商品，此處顯示為您的所有購買商品的訂單</span>
					</div>
				</div>
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item active" aria-current="page">
								會員&nbsp;＞&nbsp;購買訂單管理</li>
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
						<h3 class="tile-title">購買訂單管理</h3>
						<table class="table table-hover">

							<thead>
								<tr>
									<th>編號</th>
									<th>訂單編號</th>
									<th>商品圖片</th>
									<th>商品名稱</th>
									<th>下單時間</th>
									<th>預計出貨時間</th>
									<th>物流狀態</th>
									<th>訂單詳情</th>
									<th>寄/收貨</th>
									<th>評價賣家</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="porVO" items="${Porlist}" varStatus="s">
									<tr>
										<td>${s.count}</td>
										<td>${porVO.porid}</td>
										<td><img
											src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${porVO.purid}"
											width="100px"></td>
										<c:set var="id" scope="page" value="${porVO.purid}" />
										<%
											String id = (String) pageContext.getAttribute("id");
											PurVO purVO = purSvc.getOnePur(id);
											pageContext.setAttribute("purVO",purVO);
										%>
										<td>${purVO.purname}</td>
										<td><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/></td>
										<td><fmt:formatDate value="${purVO.purextime}"  timeStyle="short" type="both"/></td>
										
									<!-- 物流狀態 -->
									<c:forEach var="myporlogistics" items="${porlogistics}" varStatus="s">
										 <c:choose>
										 <c:when test="${porVO.porlogistics == s.index}">
										 <td>${myporlogistics}</td>
										 </c:when>
										 </c:choose>
									 </c:forEach>
									 
									<!-- 訂單詳情 -->
										<td>
							     		<button type="button" data-toggle="modal" data-target="#myModal">查看</button>
												<div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">訂單詳情</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
							
												</div>
												<div class="modal-body">
												<strong>編&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${s.count}<br>
												<strong>訂&nbsp;單&nbsp;編&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${porVO.porid}<br>
												<strong>購&nbsp;買&nbsp;時&nbsp;間&nbsp;&nbsp;：&nbsp;</strong><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/><br>
												<strong>交&nbsp;易&nbsp;狀&nbsp;態&nbsp;&nbsp;：&nbsp;</strong>${porVO.porstatus}<br>
												<strong>收件人姓名：&nbsp;</strong>${porVO.pormemname}<br>
												<strong>收&nbsp;貨&nbsp;地&nbsp;址&nbsp;&nbsp;：&nbsp;</strong>${porVO.poraddress}<br>
												<strong>連&nbsp;絡&nbsp;電&nbsp;話&nbsp;&nbsp;：&nbsp;</strong>${porVO.portel}<br>
												<strong>訂&nbsp;購&nbsp;數&nbsp;量&nbsp;&nbsp;：&nbsp;</strong>${porVO.porsum}<br>
												<strong>訂&nbsp;購&nbsp;總&nbsp;額&nbsp;&nbsp;：&nbsp;</strong>${porVO.porprice}<br>
												<strong>物&nbsp;流&nbsp;狀&nbsp;態&nbsp;&nbsp;：&nbsp;</strong>${porVO.porlogistics}<br>
												<strong>物流最後更新時間：&nbsp;</strong><fmt:formatDate value="${porVO.porlogtime}"  timeStyle="short" type="both"/>
												</div>
												<div class="modal-footer">
												
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												</div>
												</div>
												</div>
												</div>
			 							</td>
			 							
			 							<!-- 寄收貨 -->
			 							<c:choose>
							     		<c:when test="${porVO.porlogistics == 1 }">
							     		<td>
			 							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
						   		     	     <input type="submit" value="收到商品">
						   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
						   		     	     <input type="hidden" name="memno" value="${name}">
						   		     	     <input type="hidden" name="porlogistics" value=2 >
			                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
			                             </td>
			 							</c:when>
			 							
			 							
			 							<c:when test="${porVO.porlogistics == 2 }">
			 							
			 							<c:if test="${porVO.porstatus == 0 }">
			 							<td>
				 							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	     <input type="submit" value="確認">
							   		     	     <input type="hidden" name="porstatus" value=1 >
							   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
				                                 <input type="hidden" name="action"	value="updata_porstatus"></FORM>
				                                 
				                            <button type="button" data-toggle="modal" data-target="#qa${s.count}">換貨</button>
											 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
													<div class="modal fade" id="qa${s.count}" role="dialog">
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header">
													<h4 class="modal-title">要求換貨</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">
													
													換貨原因：<br>
													<textarea class="form-control rounded-0" name="changebuy" rows="4" ></textarea>
													
													<input type="hidden" name="porid"  value="${porVO.porid}">
													<input type="hidden" name="porstatus" value=5 >
				                                 	<input type="hidden" name="action"	value="updata_porstatus">
													</div>
													<div class="modal-footer"> 
													<input type="submit" class="btn btn-default" value="送出換貨需求">
													</div>
													</div>
													</div>
													</div>
											 </FORM>
											 
				                            <button type="button" data-toggle="modal" data-target="#qab${s.count}">退貨</button>
											 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
													<div class="modal fade" id="qab${s.count}" role="dialog">
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header">
													<h4 class="modal-title">要求退貨</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">
													
													退貨原因：<br>
													<textarea class="form-control rounded-0" name="changebuy" rows="4" ></textarea>
													
													<input type="hidden" name="porstatus" value=2 >
													<input type="hidden" name="porid"  value="${porVO.porid}">
				                                 	<input type="hidden" name="action"	value="updata_porstatus">
													</div>
													<div class="modal-footer"> 
													<input type="submit" class="btn btn-default" value="送出">
													</div>
													</div>
													</div>
													</div>
											 </FORM></td>
										 </c:if>
			 							<c:if test="${porVO.porstatus == 1 }">
			 								<td>已結單</td>
			 							</c:if>
			 							<c:if test="${porVO.porstatus == 2 }">
			 								<td>已送出退貨要求</td>
			 							</c:if>
			 							<c:if test="${porVO.porstatus == 3}">
											<td>退貨申請成功
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
						   		     	     <input type="submit" value="已寄出需退商品">
						   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
						   		     	     <input type="hidden" name="porlogistics" value=5 >
						   		     	     <input type="hidden" name="memno" value="${name}">
			                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
											</td>
										</c:if>
										<c:if test="${porVO.porstatus == 4}">
											<td>退貨申請失敗</td>
										</c:if>
			 							<c:if test="${porVO.porstatus == 5 }">
			 								<td>已送出換貨要求</td>
			 							</c:if>
			 							<c:if test="${porVO.porstatus == 6}">
											<td>換貨申請成功
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
						   		     	     <input type="submit" value="已寄出需換商品">
						   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
						   		     	     <input type="hidden" name="porlogistics" value=5 >
						   		     	     <input type="hidden" name="memno" value="${name}">
			                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
											</td>
											
										</c:if>
										<c:if test="${porVO.porstatus == 7}">
											<td>換貨申請失敗</td>
										</c:if>
										<c:if test="${porVO.porstatus == 8}">
											<td>因賣家商品被檢舉下架退款</td>
										</c:if>
			 							
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 0 }">
			 							<td>待出貨</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 1 }">
			 							<td>已出貨</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 2 }">
			 							<td>買家已領貨</td>
			 							
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 3 }">
			 							<td>
			 							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		    <button type="submit" name="porlogistics" value=4 >寄出退換貨</button>
							   		    <input type="hidden" name="memno"  value="${name}">
				                        <input type="hidden" name="porid"  value="${porVO.porid}">
				                        <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
			 							
			 							</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 4 }">
			 							<td>等待退換貨寄回</td>
			 							</c:when>
			 							
			 							
			 							<c:when test="${porVO.porlogistics == 5 }">
			 							<c:if test="${porVO.porstatus == 6 }">
			 							<td><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	<button type="submit" name="porlogistics" value=6 >收到換貨</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="memno"  value="${name}">
				                            <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
			 							</td>
			 							</c:if>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 6 }">
			 							<td><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	<button type="submit" name="porstatus" value=1 >確認商品無誤</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="action"	value="updata_porstatus"></FORM>
				                            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	<button type="submit" name="porstatus" value=5 >再次換貨</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="action"	value="updata_porstatus"></FORM>
										</td>
			 							</c:when>
			 							</c:choose>
			 							
			 							<!-- 評價賣家 -->
			 							<c:if test="${porVO.porstatus < 8  }"><!--取消交易，你不能給予評價 -->
				 						<c:if test="${empty porVO.porbuytime}">
				 						<td><button type="button" data-toggle="modal" data-target="#showbox${s.count}"  class='sellscore' value="${porVO.porbuyscore}" data-data="${s.count}">評價賣家</button>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
												<div class="modal fade" id="showbox${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">評價賣家</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
												
												給予評價：
												<!-- Rating Stars Box -->
												<section class='rating-widget'>
												  <div class='rating-stars text-center'>
												    <ul id='stars' class="stars">
												      <li id='star1${s.count}' class='star1 star' title='Poor' data-value='1'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star2${s.count}' class='star2 star' title='Fair' data-value='2'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star3${s.count}' class='star3 star' title='Good' data-value='3'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star4${s.count}' class='star4 star' title='Excellent' data-value='4'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star5${s.count}' class='star5 star' title='WOW!!!' data-value='5'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												    </ul>
												  </div>
												  
												</section>
												<div class='success-box'>
												    <div class='text-message'></div>
												</div>
												評價內容：<br>
												<textarea class="form-control rounded-0" name="porbuycontent" id="porbuycontent" rows="4" >${porVO.porbuycontent}</textarea>
												<input type="hidden" name="porbuyscore2" value="${porVO.porbuyscore}" >
			                                    <input type="hidden" name="porid"  value="${porVO.porid}">
			                                    <input type="hidden" name="action"	value="go_buygivescore">
												</div>
												<div class="modal-footer"> 
												<input type="submit" class="btn btn-default" value="評價買家">
												</div>
												</div>
												</div>
												</div>
										 </FORM></td>
				 						</c:if>
				 						<c:if test="${not empty porVO.porbuytime}"><!--更改評價評價 -->
							     		  <td><button type="button" data-toggle="modal" data-target="#showbox${s.count}"  class='sellscore' value="${porVO.porbuyscore}" data-data="${s.count}">更改評價</button>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
												<div class="modal fade" id="showbox${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">更改評價</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
												
												給予評價：
												<!-- Rating Stars Box -->
												<section class='rating-widget'>
												  <div class='rating-stars text-center'>
												    <ul id='stars' class="stars">
												      <li id='star1${s.count}' class='star1 star' title='Poor' data-value='1'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star2${s.count}' class='star2 star' title='Fair' data-value='2'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star3${s.count}' class='star3 star' title='Good' data-value='3'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star4${s.count}' class='star4 star' title='Excellent' data-value='4'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star5${s.count}' class='star5 star' title='WOW!!!' data-value='5'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												    </ul>
												  </div>
												  
												</section>
												<div class='success-box'>
												    <div class='text-message'></div>
												</div>
												評價內容：<br>
												<textarea class="form-control rounded-0" name="porbuycontent" id="porbuycontent" rows="4" >${porVO.porbuycontent}</textarea>
												<input type="hidden" name="porbuyscore2" value="${porVO.porbuyscore}" >
			                                    <input type="hidden" name="porid"  value="${porVO.porid}">
			                                    <input type="hidden" name="action"	value="go_buygivescore">
												</div>
												<div class="modal-footer"> 
												<input type="submit" class="btn btn-default" value="更改評價">
												</div>
												</div>
												</div>
												</div>
										 </FORM>
										 </c:if><!--更改評價評價 -->
			 							</c:if><!--取消交易不能給予評價 -->
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
	<script>
	$(document).ready(function(){
		var elements = document.getElementsByClassName('sellscore');
		for(var i = 0; i < elements.length; i++){
			elements[i].addEventListener("mouseover",Showstar,false);
		}
	})
	function Showstar(e){
		var sc = e.target.value;
		var data = e.target.getAttribute("data-data");
		
		if(sc > 0){
			for(i = 1; i <= sc; i++){
				if(sc >= i){
					$('#star'+i+data).addClass('selected');
				}else{
					$('#star'+i+data).removeClass('selected');
				}
			}
		}			
	}
	$(document).ready(function(){
		
		  /* 1. Visualizing things on Hover - See next part for action on click */
		$('.stars li').on('mouseover', function(){
			var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
		   
		    // Now highlight all the stars that's not after the current hovered star
			$(this).parent().children('li.star').each(function(e){
				if (e < onStar) {
		        	$(this).addClass('hover');
				}else {
					$(this).removeClass('hover');
				}
			});
		}).on('mouseout', function(){
			$(this).parent().children('li.star').each(function(e){
			$(this).removeClass('hover');
			});
		});
		  
		  /* 2. Action to perform on click */
		$('.stars li').on('click', function(){
		    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
		    var stars = $(this).parent().children('li.star');
		    
		    for (i = 0; i < stars.length; i++) {
		      $(stars[i]).removeClass('selected');
		    }
		    for (i = 0; i < onStar; i++) {
		      $(stars[i]).addClass('selected');
		    }
		    // JUST RESPONSE (Not needed)
		    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
		    var msg = "";
		    if (ratingValue > 1) {
		        msg =  ratingValue ;
		    }
		    else {
		        msg =  ratingValue ;
		    }
		    responseMessage(msg);
		    
		  });
		  
		  
		});


		function responseMessage(msg) {
		  $('.success-box div.text-message').html("<input type='hidden' name='porbuyscore' class='porbuyscore'  value='"+msg+"' >");
		}
	</script>
</html>
