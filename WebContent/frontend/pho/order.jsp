<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="java.util.*"%>

<%
	PhoVO phovo = (PhoVO)request.getAttribute("phovo");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script> --%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>	
	

<script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery-migrate.min.js"></script>
<link href="<%=request.getContextPath()%>/style/f/img/favicon.png" rel="icon">
<link href="<%=request.getContextPath()%>/style/f/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/f/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/f/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/f/lib/animate/animate.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/f/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/f/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/f/css/style.css" rel="stylesheet">	
<script src="<%=request.getContextPath()%>/style/f/lib/popper/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/lib/easing/easing.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/contactform/contactform.js"></script>
<script src="<%=request.getContextPath()%>/style/f/js/main.js"></script>

	
	
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<title>商品下訂</title>

<script>  
	function next(obj) {  
	    if (obj.value.length == obj.maxLength) {  
	        do {  
	            obj = obj.nextSibling;  
	        } while (obj.nodeName != "INPUT");  
	        obj.focus();  
	    }         
	}  
	document.forms[0].N1.focus();  
</script> 

</head>
<body>

<!-----------------------------------/ 到底在幹嘛開始 /----------------------------------->
  <div class="click-closed"></div>
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
<!-----------------------------------/ 到底在幹嘛結束 /----------------------------------->

<!-----------------------------------/ HEADER開始 /----------------------------------->
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
            <a class="nav-link active" href="property-grid.html">Property</a>
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
              <a class="dropdown-item" href="property-single.html">Property Single</a>
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
<!-----------------------------------/ HEADER結束 /----------------------------------->

<!----------------------------------------------- 標題列 -------------------------------------------->   
   <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">輸入訂單資料</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
<!----------------------------------------------- 標題列 -------------------------------------------->    
  


<!-----------------------------------/ 訂單開始 /----------------------------------->


  <section class="property-grid grid">
    <div class="container">
      <div class="row">      
        <div class="col-12">
			<font style="color:red">${errorMsg}</font>
			<form action="<%=request.getContextPath()%>/pho/phocontrol" method="post">
			
<!-- 					輸入姓名、手機 -->
				<div class="form-row">
					<div class="form-group col-7">
						聯絡人姓名<input type="text" class="form-control" name="phoowner" 
									value="<%=(phovo==null)?"":phovo.getPhoowner()%>">
    					<font style="color:red">${nameerrorMsgs}</font>
    				</div>
    				<div class="form-group col-7">
						聯絡手機<input type="tel" class="form-control" name="phophone"
									value="<%=(phovo==null)?"":phovo.getPhophone()%>">
    					<font style="color:red">${phoneerrorMsgs}</font>
    				</div>
   				</div>
<!-- 					輸入EMAIL -->
   				<div class="form-row">
					<div class="form-group col-7">
						E-mail<input type="email" class="form-control" name="phomail"
									value="<%=(phovo==null)?"":phovo.getPhomail()%>">
    					<font style="color:red">${emailerrorMsgs}</font>
    				</div>
   				</div>
   				
<!-- 					輸入信用卡號\ -->  
				信用卡號碼
   				<br>
				<div class="form-row" style="float:left;">  				
						<input style="width:70px" class="form-control" type="text" name="phovisa0" maxlength="4" size="4" onKeyUp="next(this)">-  
						<br><input style="width:70px" class="form-control" type="text" name="phovisa1" maxlength="4" size="4" onKeyUp="next(this)">- 
						<br><input style="width:70px" class="form-control" type="text" name="phovisa2" maxlength="4" size="4" onKeyUp="next(this)">-
						<br><input style="width:70px" class="form-control" type="text" name="phovisa3" maxlength="4" size="4" onKeyUp="next(this)">
   				</div>
   				
   				
   				<font style="color:red">${carderrorMsgs}</font>
   				<br><br><br>
				<input type="submit" class="btn btn-b" value="確認購買">
				<input type="hidden" name="action" value="insert">
			</form>
			<br>
			<form action="<%=request.getContextPath()%>/pho/phocontrol" method="post">
				<input type="submit" class="btn btn-b" value="神奇小按鈕">
				<input type="hidden" name="action" value="buildOrder">
			</form>
			
			
 		</div>
      </div>	
    </div>
  </section>
  <!-----------------------------------/ 訂單結束 /----------------------------------->
	
 <!----------------------------------/ footer開始 /---------------------------------------->
  <section class="section-footer">
  </section>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                Home
              </li>
              <li class="list-inline-item">
                About
              </li>
              <li class="list-inline-item">
                Property
              </li>
              <li class="list-inline-item">
                Blog
              </li>
              <li class="list-inline-item">
                Contact
              </li>
            </ul>
          </nav>
          <div class="socials-a">
            <ul class="list-inline">
              <li class="list-inline-item">
                  <i class="fa fa-facebook" aria-hidden="true"></i>
              </li>
              <li class="list-inline-item">
                  <i class="fa fa-twitter" aria-hidden="true"></i>
              </li>
              <li class="list-inline-item">
                  <i class="fa fa-instagram" aria-hidden="true"></i>
              </li>
              <li class="list-inline-item">
                  <i class="fa fa-pinterest-p" aria-hidden="true"></i>
              </li>
              <li class="list-inline-item">
                  <i class="fa fa-dribbble" aria-hidden="true"></i>
              </li>
            </ul>
          </div>
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; Copyright
              <span class="color-a">EstateAgency</span> All Rights Reserved.
            </p>
          </div>
          <div class="credits">
            Designed by BootstrapMade
          </div>
        </div>
      </div>
    </div>
  </footer>
  <i class="fa fa-chevron-up"></i>
  <div id="preloader"></div>
 <!----------------------------------/ footer結束 /---------------------------------------->	
	
				
			
			
			
</body>
</html>