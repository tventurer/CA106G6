<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>

<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>

<%
PtpVO ptpVO = ptpSvc.getOnePtp("PTP000009");
String pacno = ptpVO.getPacno();
PacVO pacVO = pacSvc.getOnePac(pacno);
List<PacVO> listpac = pacSvc.getAll();
pageContext.setAttribute("list",listpac);
List<PtpVO> listptp = ptpSvc.getAll();
pageContext.setAttribute("listptp", listptp);
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=pacVO.getPacname()%></title>
  <style>
  carousel-item-b img{
      max-width:600px;
      height:700px; 
      
  }
</style>
</head>

<body>

<jsp:include page="/frontend/navbar.jsp"/>
      
      
      


<!--         <div class="col-md-12"> -->
<!--           <div class="row section-t3"> -->
<!--             <div class="col-sm-12"> -->
<!--               <div class="title-box-d"> -->
<!--                 <h3 class="title-d">頂空格</h3>   -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

 <section class="section-property section-t8">
    <section class="section-property section-t8">
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
