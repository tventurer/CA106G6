<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>通過驗證</title>
  <jsp:include page="/frontend/navbar.jsp" />
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
</head>
<body>
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">${errorMsg}</h1>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
<jsp:include page="/frontend/footer.jsp" />
</body>
</html>