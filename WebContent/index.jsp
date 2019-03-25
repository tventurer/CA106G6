<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>旅遊浪潮 TVenturer</title>
</head>

<body>

<jsp:include page="frontend/navbar.jsp"/>

  <!--/ Carousel Star /-->
  <div class="intro intro-carousel">
    <div id="carousel" class="owl-carousel owl-theme">
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(style/f/img/tripPic.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                  <div class="intro-body">
                    <h5 class="intro-title mb-4">
                      <span class="color-b">說走就走 </span>
                      <br> 在異地譜出生活故事</h5>
                    <p class="intro-subtitle intro-price">
                      <a href="<%= request.getContextPath() %>/frontend/tri/tripIndex.jsp"><span class="price-a">start your journey</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(style/f/img/pah666.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">
                      <br></p>
                    <h1 class="intro-title mb-4">
                      <span class="color-b"> 最優質</span> 
                      <br> 機票加酒店票券</h1>
                    <p class="intro-subtitle intro-price">
                      <a href="<%=request.getContextPath()%>/pah/pahcontrol?action=listPahBySelect"><span class="price-a">特價中</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(style/f/img/purpic.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <h1 class="intro-title mb-4">
                      <span class="color-b">An apple </span>  a day
                      <br> keeps the doctor away</h1>
                    <p class="intro-subtitle intro-price">
                      <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp"><span class="price-a">tax free</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item-a intro-item bg-image" style="background-image: url(style/f/img/pacpic.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <h1 class="intro-title mb-4">
                      <span class="color-b">旅遊由我安排 </span> 
                      <br> 讓您無後顧之憂</h1>
                    <p class="intro-subtitle intro-price">
                      <a href="<%= request.getContextPath() %>/backend/ptp/pacHead.jsp"><span class="price-a">熱烈報名中</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--/ Carousel end /-->

  <!--/ Services Star /-->
  <section class="section-services section-t8">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-wrap d-flex justify-content-between">
            <div class="title-box">
              <h2 class="title-a">Our Services</h2>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico">
                <span class="fa fa-gamepad"></span>
              </div>
              <div class="card-title-c align-self-center">
                <h2 class="title-c">代購商品</h2>
              </div>
            </div>
            <div class="card-body-c">
              <p class="content-c">
                	若您在國外網站看到限量版貨品，但卻遲遲買不到， 我們的代購功能是您最好的選擇。您可以看看網站內由無正在販售的賣家，優良的服務讓你享受更大購物樂趣，讓您安心在家接收貨品  
              </p>
            </div>
            <div class="card-footer-c">
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico">
                <span class="fa fa-usd"></span>
              </div>
              <div class="card-title-c align-self-center">
                <h2 class="title-c">機加酒票券</h2>
              </div>
            </div>
            <div class="card-body-c">
              <p class="content-c">
              	  我們時常出國自由行和規劃旅遊，很多人會好奇要怎麼訂到便宜的機票？或是用超值的價格訂到豪華飯店？大家都知道要善用比價網站，除了找最便宜的價格外，喜愛質感旅行的我們，更注重的是「超值」，旅遊浪潮是您最好的朋友。​
              </p>
            </div>
            <div class="card-footer-c">
            </div>
          </div>
        </div>
       </div>
       <div class="row">
        <div class="col-md-6">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico">
                <span class="fa fa-home"></span>
              </div>
              <div class="card-title-c align-self-center">
                <h2 class="title-c">自由行</h2>
              </div>
            </div>
            <div class="card-body-c">
              <p class="content-c">
             	近幾年來自助旅行迅速成長、跟團也不再是出國的主流，怕被強迫購物又要存錢久久才能出去玩，玩的超沒FU~團體行就是一分錢一分貨 受夠了就得學著自己來  強力推薦自由行 
但很多人都會問，自由行的資訊哪裡來？怎麼樣才能好玩又便宜？旅遊浪潮的自由行蒐集了最優質的景點，最漂亮的價格，滿足所有有需要的人！
              </p>
            </div>
            <div class="card-footer-c">              
            </div>
          </div>
        </div>
         <div class="col-md-6">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico">
                <span class="fa fa-home"></span>
              </div>
              <div class="card-title-c align-self-center">
                <h2 class="title-c">套裝行程</h2>
              </div>
            </div>
            <div class="card-body-c">
              <p class="content-c">
               	保證不失望！最多元旅遊行程，超低價超優惠，手刀報名。 員工旅遊、套裝行程。此生必訪秘境之旅。優質旅遊規劃團隊，帶您日本看櫻花、遨遊柬埔寨吳哥窟，名額有限立即GO。 保證超好玩。
              </p>
            </div>
            <div class="card-footer-c">              
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Services End /-->


  <!--/ Agents Star /-->
  <section class="section-agents section-t8">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-wrap d-flex justify-content-between">
            <div class="title-box">
              <h2 class="title-a">Best Recommend</h2>
            </div>
            <div class="title-link">              
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="card-box-d">
            <div class="card-img-d">
              <img src="style/f/img/inin4.jpg" alt="" class="img-d img-fluid">
            </div>
            <div class="card-overlay card-overlay-hover">
              <div class="card-header-d">
                <div class="card-title-d align-self-center">
                  <h3 class="title-d">
                    <p class="link-two">套裝行程即將上架</p>
                  </h3>
                </div>
              </div>
              <div class="card-body-d"> 
                <p class="content-d color-text-a">
                  	詳情請洽套裝行程
                </p>
                <div class="info-agents color-a">
                </div>
              </div>
              <div class="card-footer-d">
                <div class="socials-footer d-flex justify-content-center">     
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
            <div class="card-img-d">
              <img src="style/f/img/inin1.jpg" alt="" class="img-d img-fluid">
            </div>
            <div class="card-overlay card-overlay-hover">
               <div class="card-header-d">
                <div class="card-title-d align-self-center">
                  <h3 class="title-d">
                    <p class="link-two">套裝行程即將上架</p>
                  </h3>
                </div>
              </div>
              <div class="card-body-d"> 
                <p class="content-d color-text-a">
                  	詳情請洽套裝行程
                </p>
                <div class="info-agents color-a">
                </div>
              </div>
              <div class="card-footer-d">
                <div class="socials-footer d-flex justify-content-center">     
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
            <div class="card-img-d">
              <img src="style/f/img/inin2.jpg" alt="" class="img-d img-fluid">
            </div>
            <div class="card-overlay card-overlay-hover">
              <div class="card-header-d">
                <div class="card-title-d align-self-center">
                  <h3 class="title-d">
                    <p class="link-two">套裝行程即將上架</p>
                  </h3>
                </div>
              </div>
              <div class="card-body-d"> 
                <p class="content-d color-text-a">
                  	詳情請洽套裝行程
                </p>
                <div class="info-agents color-a">
                </div>
              </div>
              <div class="card-footer-d">
                <div class="socials-footer d-flex justify-content-center">     
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Agents End /-->

  

  
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
              </li>
              <li class="list-inline-item">
                <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">代購商品</a>
              </li>
              <li class="list-inline-item">
                <a href="<%=request.getContextPath()%>/pah/pahcontrol?action=listPahBySelect">機加酒</a>
              </li>
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/frontend/tri/tripIndex.jsp">自由行</a>
              </li>
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/backend/ptp/pacHead.jsp">套裝行程</a>
              </li>
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/frontend/pos/AllPost.jsp">旅人文章</a>
              </li>
            </ul>
          </nav>
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; CA106G6_TVenturer<br><br>
              &copy; Copyright
              <span class="color-a">EstateAgency</span> All Rights Reserved.
            </p>
          </div>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
            Designed by <p>BootstrapMade</p>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="style/f/lib/jquery/jquery.min.js"></script>
  <script src="style/f/lib/jquery/jquery-migrate.min.js"></script>
  <script src="style/f/lib/popper/popper.min.js"></script>
  <script src="style/f/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="style/f/lib/easing/easing.min.js"></script>
  <script src="style/f/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="style/f/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="style/f/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="style/f/js/main.js"></script>

</body>
</html>
