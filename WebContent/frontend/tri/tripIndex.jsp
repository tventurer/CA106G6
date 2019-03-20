<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>自由行規劃</title>
</head>

<body>
<jsp:include page="/frontend/navbar.jsp"/>


  <section class="section-services section-t8">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="foo">
            <div class="card-header-c d-flex">
              <div class="card-title-c align-self-center">
                <h5 class="title-c">依照您規劃的自由行程提供您相關優惠票券商品</h5>
                <br><h5 class="title-c">加值您的自由行之旅</h5>
              </div>
            </div>
            <div class="card-footer-c">
              <a href="build_trip2.jsp" class="link-c link-icon">開始規劃
                <span class="ion-ios-arrow-forward"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--/ News Single Star /-->
  <section class="section-t8 news-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="news-img-box">
            <img src="<%= request.getContextPath() %>/style/f/img/slide-3.jpg" alt="" class="img-fluid">
          </div>
        </div>
        <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-2">
          <div class="post-information">
            <ul class="list-inline text-center color-a">
              <li class="list-inline-item mr-2">
                <strong>Author: </strong>
                <span class="color-text-a">Morgan Jimenez</span>
              </li>
              <li class="list-inline-item mr-2">
                <strong>Category: </strong>
                <span class="color-text-a">Travel</span>
              </li>
              <li class="list-inline-item">
                <strong>Date: </strong>
                <span class="color-text-a">19 Apr. 2017</span>
              </li>
            </ul>
          </div>
          <div class="post-content color-text-a">
            <p class="post-intro">
              Sed porttitor lectus nibh. Lorem ipsum dolor sit amet, consectetur
              <strong>adipiscing</strong> elit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
              Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.
            </p>
            <p>
              Proin eget tortor risus. Donec sollicitudin molestie malesuada. Cras ultricies ligula sed magna dictum
              porta. Pellentesque
              in ipsum id orci porta dapibus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
              dui. Lorem ipsum dolor sit amet.
            </p>
            <p>
              Pellentesque in ipsum id orci porta dapibus. Curabitur non nulla sit amet nisl tempus convallis quis ac
              lectus. Curabitur
              non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus. Curabitur non
              nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada.
              Quisque velit nisi.
            </p>
            <blockquote class="blockquote">
              <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
              <footer class="blockquote-footer">
                <strong>Albert Vargas</strong>
                <cite title="Source Title">Author</cite>
              </footer>
            </blockquote>
            <p>
              Donec rutrum congue leo eget malesuada. Curabitur aliquet quam id dui posuere blandit. Vivamus suscipit
              tortor eget felis
              porttitor volutpat. Quisque velit nisi, pretium ut lacinia in, elementum id enim.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ News Single End /-->
  
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