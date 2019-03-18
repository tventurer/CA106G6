<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.acr.model.*"%>
<% 
	String purid = new String(request.getParameter("purid")); 
	pageContext.setAttribute("purid",purid);

	PurService purSvc = new PurService();
	PurVO purVO = purSvc.getOnePur(purid);
	
    Integer purstock = purVO.getPurstock();
	  
	PorService porSvc = new PorService(); 
	Integer purporsum = porSvc.getPurporsum(purid);
	  
	Integer over = purstock - purporsum;
	
	String sellmem = purVO.getMemno();
	pageContext.setAttribute("sellmem",sellmem);
	
	//有登入才會跑這裡顯示目前擁有的代幣
	AcrService acrSvc = new AcrService();
	String memno = "MEM000002";
	pageContext.setAttribute("memno",memno);
	List<AcrVO> Acrlist = acrSvc.getMemAll(memno);
	pageContext.setAttribute("Acrlist",Acrlist);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>T-Venturer <%=purVO.getPurname() %></title>
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
<style>
.owl-carousel .owl-item img{
	width: auto;
    margin: auto;
}
</style>
<body>

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
      <a class="navbar-brand text-brand" href="index.html">T-<span class="color-b">Venturer</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">首頁</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">關於</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="purIndex.jsp">代購商品</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	會員
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/acr/addOneAcr.jsp">儲值</a>
              <a class="dropdown-item" href="blog-single.html">訂單</a>
              <a class="dropdown-item" href="agents-grid.html">新增代購商品</a>
              <a class="dropdown-item" href="agent-single.html">我的代購商品</a>
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

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=purVO.getPurname() %></h1>
            <span class="color-text-a">商品類別：<%=purVO.getPursort() %></span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="index.html">首頁</a>
              </li>
              <li class="breadcrumb-item">
                <a href="purIndex.jsp">代購商品</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                <%=purVO.getPurname() %>
              </li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Property Single Star /-->
  <section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property">
            <div class="carousel-item-b">
              <img height="500px" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=<%=purVO.getPurid() %>" alt="">
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
                    <h5 class="title-c"><%=purVO.getPurpricing() %></h5>
                  </div>
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">商品詳情</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>賣家會員：</strong>
                      <span><%=purVO.getMemno() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品類別：</strong>
                      <span><%=purVO.getPursort() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>參考網址：</strong>
                      <span><a href=<%=purVO.getPururl()%>>連結於此處</a></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>購買國家：</strong>
                      <span><%=purVO.getPurcountry() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>收貨國家：</strong>
                      <span><%=purVO.getPurdelivery() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品當地原價：</strong>
                      <span><%=purVO.getPurreprice() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>提供收據：</strong>
                      <span><%=purVO.getPurreceipt() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品總數量：</strong>
                      <span><%=purVO.getPurstock() %></span>
                    </li>
                    
                    <li class="d-flex justify-content-between">
                      <strong>已賣出的商品數：</strong>
                      <span><%=purVO.getPursell() %></span>
                    </li>
                  </ul>
                </div>
              </div>
              <form class="form-a" METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/addOnePor.jsp">
              <div class="row">
              <div class="col-md-12">
              <div class="form-group">
              <label for="Type">購買數量</label>
              <select name="porsum" id="porsum" class="form-control form-control-lg form-control-a" id="Type">
				<%for(int i = 1; i<=(purVO.getPurstock()-purVO.getPursell()); i++){
					out.println("<option>"+i+"</option>");
				} %>
                
              </select>
            </div>
            </div>
         <c:if test="${not empty memno}">
         <c:forEach var="myacr" items="${Acrlist}" varStatus="s">
		 <c:choose>
		 <c:when test="${s.last}">
		 <div class="col-md-12"><h6>您的代幣數量為：${myacr.acrtotal}<br></h6></div>
		 <input type="hidden" name="acrtotal" value="${myacr.acrtotal}">
		 </c:when>
		 </c:choose>
		 </c:forEach>
		 </c:if>
		 <c:choose> 
		 <c:when test="${sellmem != memno}">
		 <div class="col-md-12">
   		 <input type="hidden" name="action" value="insert">
   		 <input type="text" name="memno" value="${memno}">
   		 <input type="hidden" name="purid" value="${purid}">
         <button type="submit" class="btn btn-a">購買</button>
         </div>
		 </c:when>
		 </c:choose>
           </div>
           <br>
         </form>
         
                
            </div>
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">商品描述</h4>
                  </div>
                </div>
              </div>
              <div class="property-description">
                <p class="description color-text-a">
                 <%=purVO.getPurcontent() %>
                </p>
              </div>
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">下單截止時間</h4>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <p><i class="fa fa-calendar-times-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="<%=purVO.getPurobtained() %>" timeStyle="short" type="both"/></p>
                </ul>
              </div>
              
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">預計出貨時間</h4>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <p><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="<%=purVO.getPurextime() %>" timeStyle="short" type="both"/></p>
                </ul>
              </div>
              
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">購買評價限制</h4>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <p><i class="fa fa-user-times" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;購買者的購物評價<%=purVO.getPurlimit() %>以下不得購買</p>
                </ul>
              </div>
              
            </div>
          </div>
        </div>


                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Property Single End /-->
  
  <!--/ footer Star /-->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">Home</a>
              </li>
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Property</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Blog</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
            </ul>
          </nav>
          <div class="socials-a">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-dribbble" aria-hidden="true"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; Copyright
              <span class="color-a">T-Venturer</span> All Rights Reserved.
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