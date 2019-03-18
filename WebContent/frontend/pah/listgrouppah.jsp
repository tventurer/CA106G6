<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="java.util.*"%>

<%
	List<PahVO> pahList = (List)session.getAttribute("pahList");
%>
<!DOCTYPE html>
<html>
<head>

<script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery-migrate.min.js"></script>
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
	
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<title>看看機加酒們</title>		
	

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
	$.datetimepicker.setLocale('zh');
	$('.f_date1').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 10, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',
		value : '', // value:   new Date(),
	});


	$.datetimepicker.setLocale('zh'); // kr ko ja en
	$(function() {
		$('#start_date').datetimepicker(
				{
					format : 'Y-m-d',
					onShow : function() {
						this.setOptions({
							maxDate : $('#end_date').val() ? $('#end_date')
									.val() : false
						})
					},
					timepicker : false
				});

		$('#end_date').datetimepicker(
				{
					format : 'Y-m-d',
					onShow : function() {
						this.setOptions({
							minDate : $('#start_date').val() ? $('#start_date')
									.val() : false
						})
					},
					timepicker : false
				});
	});
</script>


</head>
<body>

<div class="click-closed"></div>
<!----------------------------------------------- 不知道在幹嘛 -------------------------------------------->
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
<!----------------------------------------------- 不知道在幹嘛 --------------------------------------------> 
<!----------------------------------------------- HEADER開始 -------------------------------------------->  
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
            <a class="nav-link active" href="blog-grid.html">Blog</a>
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
<!------------------------------------------------- 	查看購物車商品 -->
    <div id="service" style="position: fixed;top: 85%;left: 92%;">
		<form method="post" action="<%=request.getContextPath()%>/pah/shoppingcontrol">
			<input type="hidden" name="action" value="checkOut">
			<input type="hidden" name="url" value="<%=request.getServletPath()%>">
			<input  type="image" id="mycart" src="<%=request.getContextPath()%>/frontend/pah/img/cart.png" style="width: 75px;height: 75px;">
		</form>
	</div>    
		
<!-------------------------------------------------- 	查看訂單 -->
<form method="post" action="<%=request.getContextPath()%>/pho/phocontrol">
	<input type="hidden" name="action" value="listMeOrder">
	<input type="hidden" name="memno" value="MEM000001">
	<input type="submit" value="查看訂單" class="btn btn-info">
</form>       
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    </div>
  </nav>
  <!--/ Nav End /-->
<!----------------------------------------------- HEADER結束 -------------------------------------------->   
  
<!----------------------------------------------- 標題列 -------------------------------------------->   
   <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">機加酒票券</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
<!----------------------------------------------- 標題列 -------------------------------------------->    
  
  
<!----------------------------------------------- 主內容 -------------------------------------------->  

  <!--/ Property Grid Star /-->
 
 <section class="property-grid grid">
    <div class="container">
      <div class="row">
<!--    條件搜尋商品-->
<!-- --------------------------------------	以國家搜尋商品 -------------------------------------->	
        <div class="col-sm-2">
          <div class="grid-option">
			<form method="post"
				action="<%=request.getContextPath()%>/pah/pahcontrol">	

					<jsp:useBean id="pahCountryList" scope="page"
						class="com.pah.model.PahService" />
					<select name="pahcountry" class="form-control form-control-sm">
							<option value="" name="pahcountry" selected>查詢所有國家
						<c:forEach var="country" items="${pahCountryList.country}">
							<option value="${country}" name="pahcountry">${country}
						</c:forEach>
					</select> 
			</div>
        </div> 
<!-- --------------------------------------	以國家搜尋商品 -------------------------------------->	
        <div class="col-sm-1">
          <div class="grid-option">
      	   <p> /</p>
          </div>
        </div> 
<!---------------------------------------- 以價格搜尋商品 ----------------------------------------->
 		<div class="col-sm-2">
          <div class="grid-option">		
			 <input type="text" name="pahprice"
				class="form-control form-control-sm" placeholder="請輸入最低價">
		 </div>
		 	</div>
		 <div class="col-sm-2">
          <div class="grid-option">	
			 <input type="text" name="pahprice" 
		 		class="form-control form-control-sm" placeholder="請輸入最高價">
          </div>
		 </div>
<!---------------------------------------- 以價格搜尋商品 ----------------------------------------->
		<div class="col-sm-1">
          <div class="grid-option">
        	 <p> /</p>
          </div>
        </div> 
<!---------------------------------------- 以日期搜尋商品 ------------------------------------------>			
		<div class="col-sm-2">
	      <div class="grid-option">		 	
				<input type="text" id="start_date" name="pahstdate"
					class="f_date1 form-control form-control-sm" placeholder="起始日期">
          </div>
        </div>  
        <div class="col-sm-2">
	      <div class="grid-option">	
				<input type="text" id="end_date" name="pahstdate"
					class="f_date1 form-control form-control-sm" placeholder="截止日期"> 
					
					
		<input type="hidden" value="listPahBySelect" name="action"> 
		<input type="submit" value="綜合查詢" class="btn btn-b">
			</div>
        </div> 
</form>     
<!---------------------------------------- 以日期搜尋商品 ------------------------------------------>
	
<!---------------------------------------- 顯示商品 ------------------------------------------>	
<%@ include file="page1" %> 
                
      <c:forEach var="pahVO" items="${pahList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
        <div class="col-md-4">
          <div class="card-box-b card-shadow news-box">
            <div class="img-box-b">
          		<c:set var="pc1" value="${pahVO.pahpc1}"></c:set>            
           			<%
						byte b[] = (byte[])pageContext.getAttribute("pc1");
						String encoding = null;
						if(b != null){
						encoding = Base64.encode(b); 
					%>
					<img src="data:image/jpg;base64,<%=encoding %>"
						class="img-b img-fluid">
					<%}%>              
            </div>
            <div class="card-overlay">
              <div class="card-header-b">
                <div class="card-category-b">
                  <a href="<%=request.getContextPath()%>/pah/pahcontrol?action=findByPk&pahno=${pahVO.pahno}" class="category-b">查看詳情
                 </a>
                </div>
                <div class="card-title-b">
                  <h2 class="title-2" style="color:white;">
                    ${pahVO.pahname}   
                  </h2>
                </div>
                <div class="card-date">
                  <span class="date-b" style="color:grey;">${pahVO.pahintro}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
     </c:forEach>       
   </div>    
      
<!------------------------------------------------------------------------- 引入購物車、錯誤表列       -->
<%@ include file="listbootcart" %>	  
<c:if test="${not empty errorMsgs}">
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
      
<!--------------------------- 頁面標籤       -->
      <div class="row">
        <div class="col-sm-12">
          <nav class="pagination-a">
            
            <%@ include file="page2" %> 
            
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ News Grid End /-->
<!----------------------------------------------- 主內容結束 -------------------------------------------->    
  			
</body>

<script>

//SWEETALERT
<%if("sendMail".equals(request.getAttribute("sendMail"))){%>
	swal({
		  title: "訂單已成立!",
		  text: "請至信箱確認訂單，謝謝",
		  icon: "success",
		  button: "關閉",
		});
<%}%>

</script>

</html>





		
        
        
        