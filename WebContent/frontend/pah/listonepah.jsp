<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--拿到CONTROLER傳來的物件 --%>
<% 
	PahVO pahvo = (PahVO)request.getAttribute("pahvo"); 
	List<PahVO> buyList = (Vector<PahVO>)session.getAttribute("shoppingcart");
	
// 	顯示購買數量及剩餘數量
	int buynum = 0;
	if(buyList!=null){
		if(!buyList.isEmpty()){
			for(PahVO buy:buyList){
				if(pahvo.equals(buy)){
					buynum=buy.getPahnum();
				}
			}		
		}
	}
	
%>



<!DOCTYPE html>
<html>
<head>

<script
	src="<%=request.getContextPath()%>/bootstrap/sweetAlert/sweetalert.min.js"></script>	
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/sweetAlert/jquery-3.2.1.min.js"></script>

<script>

// 數量顯示器
window.onload = function() {
    var count = document.getElementById("count");
    var inc = document.getElementById("inc");
    var dec = document.getElementById("dec");
    inc.onclick = function() {
    	if(count.value<<%=pahvo.getPahnum()-buynum%>){
	        count.value = parseInt(count.value) + 1;		
    	}
    };
    dec.onclick = function() {
    	if(count.value>1){
	        count.value = parseInt(count.value) - 1;
    	}
    };
};

</script>


<meta charset="UTF-8">
<title>機加酒資料一筆</title>




<!---------------------- 外方引入 --------------------------------->
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/style/f/img/favicon.png" rel="icon">
  <link href="<%=request.getContextPath()%>/style/f/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<%=request.getContextPath()%>/style/f/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<%=request.getContextPath()%>/style/f/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/animate/animate.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<%=request.getContextPath()%>/style/f/css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->

</head>
<body>

<!------------------------------------ 標頭 ---------------------------------------->
<div class="click-closed"></div>
  <!--/ Form Search Star /-->
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
              <label for="Type">Keyword</label>
              <input type="text" class="form-control form-control-lg form-control-a" placeholder="Keyword">
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="Type">Type</label>
              <select class="form-control form-control-lg form-control-a" id="Type">
                <option>All Type</option>
                <option>For Rent</option>
                <option>For Sale</option>
                <option>Open House</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="city">City</label>
              <select class="form-control form-control-lg form-control-a" id="city">
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
              <label for="bedrooms">Bedrooms</label>
              <select class="form-control form-control-lg form-control-a" id="bedrooms">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="garages">Garages</label>
              <select class="form-control form-control-lg form-control-a" id="garages">
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
              <label for="bathrooms">Bathrooms</label>
              <select class="form-control form-control-lg form-control-a" id="bathrooms">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="price">Min Price</label>
              <select class="form-control form-control-lg form-control-a" id="price">
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
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="index.html">Estate<span class="color-b">Agency</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="property-grid.html">Property</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="blog-grid.html">Blog</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Pages
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item active" href="property-single.html">Property Single</a>
              <a class="dropdown-item" href="blog-single.html">Blog Single</a>
              <a class="dropdown-item" href="agents-grid.html">Agents Grid</a>
              <a class="dropdown-item" href="agent-single.html">Agent Single</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
        </ul>
      </div>
      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    </div>
  </nav>
  <!--/ Nav End /-->

<!--------------------------------------- 標頭結尾 ------------------------------------------>


<!-------------------------------------- 內文開始(不可砍) --------------------------------------->
<!--/ 機加酒標題介紹 /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=pahvo.getPahname()%></h1>
            <span class="color-text-a"><%=pahvo.getPahintro()%></span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
        </div>
      </div>
    </div>
  </section>
<!--/ 機加酒標題介紹 /-->


<!--/ 機加酒內文 /-->
<section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property">
          
            <div class="carousel-item-b">
              <%
              	byte[] bt2 = pahvo.getPahpc2();
            	if(bt2!=null){
            		String pic2 = Base64.encode(bt2);	     
              %>
              	<img src="data:image/jpg;base64,<%=pic2%>" class="img-fluid">
              <%}%>
            </div>
             <div class="carousel-item-b">
              <%
              	byte[] bt3 = pahvo.getPahpc3();
            	if(bt3!=null){
            		String pic3 = Base64.encode(bt3);	     
              %>
              	<img src="data:image/jpg;base64,<%=pic3%>" class="img-fluid">
              <%}%>
            </div>
            
          </div>
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-4">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                  <div class="card-box-ico">
                    <span class="ion-money">$</span>
                  </div>
                  <div class="card-title-c align-self-center">
                    <h5 class="title-c"><%=pahvo.getPahprice()%></h5>
                  </div>
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">商品簡介</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>出發日期:</strong>
                      <span><%=pahvo.getPahstdate()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>回程日期:</strong>
                      <span><%=pahvo.getPahenddate()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>國家:</strong>
                      <span><%=pahvo.getPahcountry()%></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">當地特色</h3>
                  </div>
                </div>
              </div>
              <div class="property-description">
                <p class="description color-text-a">
                	<%=pahvo.getPahcontent()%>
                </p>
              </div>
        </div>
   	  </div>
	  <div class="row">
            <div class="col-6">
			<%
			 	byte[] bt4 = pahvo.getPahpc4();
			if(bt3!=null){
				String pic4 = Base64.encode(bt4);	     
			 %>
			<img src="data:image/jpg;base64,<%=pic4%>" class="img-fluid">
			<%}%>
         </div>
         <div class="col-6">
       		<%
			 	byte[] bt5 = pahvo.getPahpc5();
			if(bt3!=null){
				String pic5 = Base64.encode(bt5);	     
			%>
			  <img src="data:image/jpg;base64,<%=pic5%>" class="img-fluid">
			<%}%>
         </div>
   	   </div>
   	   <div class="row">
            <div class="col-3">
            </div>
            <div class="col-2">
            	<br>
	        	<input type="button" onclick="location.href='<%= request.getContextPath()%>/pah/pahcontrol?action=listPahBySelect';" value="繼續選購" class="btn btn-b"/>
            </div>
            <div class="col-4">
            	<br>
            	<form method="post" action="<%=request.getContextPath()%>/pah/shoppingcontrol">	
				    <input id="dec" type="button" value="-" class='qtyminus btn btn-outline-warning'>	
				    <input id="count" min="1" max="<%=pahvo.getPahnum()-buynum%>" type="number" value="1" size="1" style="text-align:center;" name="quantity">
					<input id="inc" type="button" value="+" class='qtyminus btn btn-outline-warning'>
					
					<input type="hidden" name="price" value="${pahvo.pahprice}">
					<input type="hidden" name="pahno" value="${pahvo.pahno}">
					<input type="hidden" name="action" value="add">
					<input type="submit" value="加入購物車" class="btn btn-b">
				</form>
				<br>
            	<h3>選購數量 / 剩餘數量 : <%=buynum%>/<%=pahvo.getPahnum()-buynum%></h3>
            </div>
            <div class="col-3">
            </div>
        </div>   	   
      </div>
    </div>
   </div>
 <section>


	




<div id="service" style="position: fixed;top: 85%;left: 92%;">
	<form method="post" action="<%=request.getContextPath()%>/pah/shoppingcontrol">
		<input type="hidden" name="action" value="checkOut">
		<input type="hidden" name="pahno" value="${pahvo.pahno}">
		<input type="hidden" name="url" value="<%=request.getServletPath()%>">
		<input  type="image" id="mycart" src="<%=request.getContextPath()%>/frontend/pah/img/cart.png" style="width: 75px;height: 75px;">
	</form>
</div>
	<%@ include file="listbootcart" %>


</body>
<script>

//SWEETALERT
<%if("sweetalert6".equals(request.getAttribute("sweetalert6"))){%>
	swal({
		  title: "已加入購物車!",
		  text: "可以再多買一點哦",
		  icon: "success",
		  button: "關閉",
		  timer: 1500,
		});
<%}%>
</script>


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

</html>