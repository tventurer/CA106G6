<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>規劃完成</title>
</head>
<jsp:include page="/frontend/navbar.jsp"/>
<body>
<section class="section-property section-t8">
	<div class="container-fluid">
		<div class="row justify-content-center">
		
		<div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
            <h3><br></h3>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/like.png">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">已收到您規劃的行程!</h4>
                  <p class="comment-description">
                    	我們會盡快為您提供行程的加值商品,您可以在<a class="link-c link-icon" href="<%= request.getContextPath() %>/frontend/tri/listTriByMem.jsp">&nbsp;我的行程&nbsp;</a>查看最新的訂單狀態。
                  </p>
                </div>
              </li>
             </ul>
            </div>
           </div>
           
         </div>
	</div>
</section>

</body>

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
</html>