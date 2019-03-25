<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>自由行規劃</title>
<style>
.spoclass{
margin-left: 40px;
}
b{
color: red;
}
#orderDemo{
height: 200px;
width: 400px;
}
#tripIndex{
height: 400px;
width: 600px;
}
</style>
</head>

<body>
<jsp:include page="/frontend/navbar.jsp"/>


  <section class="section-services section-t8">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6">
        
        <div class="title-box-d">
            <h3><br><br></h3>
        </div>
        
          <div class="foo">
            <div class="card-header-c d-flex">
              <div class="card-title-c align-self-center">
                <h5 class="title-c">一站輕鬆搞定您的自由行之旅!</h5>
              </div>
            </div>
          </div>
        </div>
        
      </div>
      
      <div class="row justify-content-center">
      	<div class="col-md-7">
        	<div class="foo">
        		<img id="tripIndex" src="image/tripIndex.jpg">
        	</div>
        </div>
      </div>
      
      
      <div class="row justify-content-center">
        <div class="col-md-6.5">
        
        <div class="title-box-d">
            <h3><br><br></h3>
        </div>
        
          <div class="foo">
            <div class="card-header-c d-flex">
              <div class="card-title-c">
                <h5 class="title-c">五大分類快速找到您欲前往的景點</h5>
              </div>
            </div>
            <div class="row justify-content-center">
              <center>
				<img src="image/place.png">
				<img class="spoclass" src="image/ice-cream.png">
				<img class="spoclass" src="image/museum.png">
				<img class="spoclass" src="image/beer.png">
				<img class="spoclass" src="image/hotel.png">
		 	  </center>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row justify-content-center">
        <div class="col-md-5">
        
        <div class="title-box-d">
            <h3><br><br></h3>
        </div>
        
          <div class="foo">
            <div class="card-header-c d-flex">
              <div class="card-title-c align-self-center">
                <h5 class="title-c">依照您規劃的行程提供您<br><center><b>最優惠的報價</b></center><center>加值您的自由行之旅!</center></h5>
              </div>
            </div>
          </div>
        </div>
        
        </div>
        <br><br><br>
        <div class="row justify-content-center">
            	<a href="build_trip2.jsp" class="btn btn-b">馬上體驗</a>
        </div>
        <br>
        <br>
        
    </div>
  </section>

<jsp:include page="/frontend/footer.jsp"/>
  
  <!-- JavaScript Libraries -->
  <script src="<%= request.getContextPath() %>/style/f/lib/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/jquery/jquery-migrate.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/popper/popper.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/easing/easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="<%= request.getContextPath() %>/style/f/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%= request.getContextPath() %>/style/f/js/main.js"></script>
  
</body>  
</html>