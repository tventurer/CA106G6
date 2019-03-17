<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<%= request.getContextPath() %>/style/f/img/favicon.png" rel="icon">
  <link href="<%= request.getContextPath() %>/style/f/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="<%= request.getContextPath() %>/style/f/css/Google Fonts.css" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<%= request.getContextPath() %>/style/f/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<%= request.getContextPath() %>/style/f/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/style/f/lib/animate/animate.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/style/f/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/style/f/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<%= request.getContextPath() %>/style/f/css/style.css" rel="stylesheet">

</head>
<body>

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand text-brand" href="index.jsp">T<span class="color-b">-Venturer</span></a>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="contact.html">代購</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">機加酒</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">自由行</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">套裝行程</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">旅人文章</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	會員
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="agent-single.html">基本資料</a>
              <a class="dropdown-item" href="property-single.html">我的代購</a>
              <a class="dropdown-item" href="property-single.html">我的機加酒</a>
              <a class="dropdown-item" href="property-single.html">我的自由行</a>
              <a class="dropdown-item" href="property-single.html">我的套裝行程</a>
              <a class="dropdown-item" href="blog-single.html">文章管理</a>
              <a class="dropdown-item" href="agents-grid.html">代幣管理</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!--/ Nav End /-->

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
