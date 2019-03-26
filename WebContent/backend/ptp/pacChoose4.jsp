<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>

<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>

<% 
 String ptpno = request.getParameter("ptpno");
 PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
 String pacno = ptpVO.getPacno();
 PacVO pacVO = pacSvc.getOnePac(pacno);
 List<PacVO> list = pacSvc.getAll();
 pageContext.setAttribute("list",list);
 List<PtpVO> listptp = ptpSvc.getAll();
 pageContext.setAttribute("ptpVO", ptpVO);
 pageContext.setAttribute("pacVO", pacVO);
 pageContext.setAttribute("listptp", listptp);
%>

<!DOCTYPE html>
<html lang="en">
<head>
 <title>666</title>
  <style>
  .carousel-item-b img{
      max-width:600px;
      height:400px; 
      
  }
</style>

</head>

<body>
<jsp:include page="/frontend/navbar.jsp"/>
  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=pacVO.getPacname()%></h1>
            <span class="color-text-a"><%=pacVO.getPacno() %></span>
          </div>
        </div>
        		<a href="join.jsp?ptpno=${ptpVO.ptpno}" class="link-a">
                    <span class="ion-ios-arrow-forward">
                      <img src="images/join.jpg" alt="">
                    </span>
                  </a>
        </div>
      </div>
  </section>
  <!--/ Intro Single End /-->

 
  <section class="news-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="news-img-box">
            <img src="<%=request.getContextPath()%>/DBGifReader?pacno=<%=pacVO.getPacno()%>&photo=1" alt="" class="img-fluid">
          </div>
        </div>
         <div class="row justify-content-between">
            <div class="col-md-5 col-lg-4">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                  <div class="card-box-ico">
                    <span class="ion-money">NT</span>
                  </div>
                  <div class="card-title-c align-self-center">
                    <h2 class="title-c"><%=pacVO.getPacprice()%></h2>
                  </div>
                </div>
              </div>
             <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">出發資訊</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>出發日期:</strong>
                      <span><fmt:formatDate value="<%=ptpVO.getPtpstart() %>" pattern="yyyy-MM-dd HH:mm"/></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>抵達日期:</strong>
                      <span><%=ptpVO.getPtpend() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>旅遊國家:</strong>
                      <span><%=pacVO.getPaccountry()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>旅遊城市:</strong>
                      <span><%=pacVO.getPaccity()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>最少成行:</strong>
                      <span><%=ptpVO.getPtpminmen()%> 人
                      </span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>可報名人數:</strong>
                      <span><%=ptpVO.getPtpvacancy()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>訂金:</strong>
                      <span><%=pacVO.getPacdeposit()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>備註:</strong>
                      <span>   </span>
                    </li>
                  </ul>
                </div>
              </div>
            </div> 
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row" style="line-height:15px;">
                <div class="col-sm-12">
                  <div class="title-box-d">
                  <span><br><br></span>
                    <h3 class="title-d">您可參考</h3><br>
                  </div>
                   <a href="https://www.cwb.gov.tw/V7/index.htm"><img src="images/h003.png" alt=""></a><a href="https://rate.bot.com.tw/xrt?Lang=zh-TW"><img src="images/h004.png" alt=""></a>
                    <a href="javascript:window.print()" _fcksavedurl="javascript:window.print()"><img src="images/h005.png"></a></span><span>
                </div>
              </div>
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
						<h4 class="title-d">${pacVO.pacdiv}	</h4>			  
				  </div>
                </div>
              </div>
          <div class="post-content color-text-a">
            <div>
            	<img src="<%=request.getContextPath()%>/DBGifReader?pacno=<%=pacVO.getPacno()%>&photo=2" alt="" class="img-fluid">
            </div>
        
      </div>
      
      </div>
      </div>
      </div>
      <a name="content"></a>
      <div class="container">
			<div class="row">
			<div class="col-md-12">
			<div class="tile">
			<h3 class="tile-title"><img src="images/bgbar001.png" alt=""></h3> 
			 <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
						<a name="content"></a>${pacVO.paccontent}				  
				  </div>
                </div>
              </div>
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">行程注意事項</h3>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
              <%=pacVO.getPacremark()%>
              </div>
              <span><a href="#content"><img src="images/h002.png" alt=""></a><a href="join.jsp?ptpno=${ptpVO.ptpno}" class="link-a"><img src="images/h001.png"></a></span>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="row section-t3">
            <div class="col-sm-12">
              <div class="title-box-d">
                <h3 class="title-d">猜你喜歡</h3>  
              </div>
            </div>
          </div>
      <div id="property-carousel" class="owl-carousel owl-theme">
      
      <c:forEach var="pacVO" items="${list}">
      <c:choose>
      <c:when test="${pacVO.pacstatus == 0}">
       <div class="carousel-item-b">
          <div class="card-box-a card-shadow">
          
            <div class="img-box-a">
              <img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1" alt="" class="img-a img-fluid">
            </div>
            
            <div class="card-overlay">
              <div class="card-overlay-a-content">
                <div class="card-header-a">
             
                  <h2 class="card-title-a">
                
                    <a  href="pacChoose.jsp?pacno=${pacVO.pacno}&ptpno=PTP000009">${pacVO.pacname}</a>
                  </h2>
                </div>
                
                <div class="card-body-a">
                  <div class="price-box d-flex">
                    <span class="price-a"> $ ${pacVO.pacprice}起</span>
                  </div>
                  <a href="pacChoose.jsp?pacno=${pacVO.pacno}&ptpno=PTP000009" class="link-a">觀看詳情
                    <span class="ion-ios-arrow-forward"></span>
                  </a>
                </div>
                
                <div class="card-footer-a">
                <ul class="card-info d-flex justify-content-around">
                <li>
                <h4 class="card-info-title">出發日期</h4>
                <span>剩餘空位</span>
                </li>
                <c:forEach var="ptpVO" items="${listptp}">
                	<c:choose>
                <c:when test="${ptpVO.pacno == pacVO.pacno}">
                    <li>
                      <h4 class="card-info-title"><fmt:formatDate value="${ptpVO.ptpstart}" pattern="MM/dd"/></h4>
                      <span>${ptpVO.ptpvacancy}</span>
                    </li>
                </c:when>
  				    </c:choose>
    				</c:forEach>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
         </c:when>
      </c:choose>
      </c:forEach>
    </div>
  </section>
</section>
<!--/ Property Single End /-->
  
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
