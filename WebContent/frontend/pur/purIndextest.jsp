<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>

<%
    PurService purSvc = new PurService();
    List<PurVO> list = purSvc.getAll();
    pageContext.setAttribute("list",list);
    
    String purstatus[]={"未上架","上架中","已下架","檢舉下架"};
    request.setAttribute("purstatus", purstatus);
    
    String[] pursort = {"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
    request.setAttribute("pursort", pursort);
    
%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">
<style>
.img-fluid{
height:300px;
}
img{
height:200px;
}

.h2, h2{
margin-top:1.5rem!important;
}
</style>
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">TV Purchasing</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="purIndex.jsp">首頁
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">訂單</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">商品</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">交易紀錄</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

<FORM METHOD="post" ACTION="pur" >
<div class="container">
  <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h2 class="panel-title">
         <a data-toggle="collapse" href="#collapse1">商品類別</a>
        </h2>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <ul class="list-group">
        <c:forEach var="mypursort" items="${pursort}" varStatus="s">
          <input type="hidden" name="action" value="getOneSort_For_Display">
          <li class="list-group-item">
          <input class="btn btn-link" type="submit" value="${mypursort}"></li>
        </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>
</FORM>
      </div>
      <!-- /.col-lg-3 -->

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
<c:forEach var="purVO" items="${list}"  varStatus="s">
<c:choose>
		 <c:when test="${0 == s.index}">
		 <div class="carousel-item active">
              <img class="d-block img-fluid" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" width="900" alt="First slide">
            </div>
		 </c:when>
		 <c:when test="${1 == s.index}">
		 <div class="carousel-item">
              <img class="d-block img-fluid" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" width="900" alt="Second slide">
            </div>
		 </c:when>
		 <c:when test="${4 == s.index}">
		 <div class="carousel-item">
              <img class="d-block img-fluid" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" width="900" alt="Third slide">
            </div>
		 </c:when>
		 </c:choose>
</c:forEach>
          </div>
        
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>




        <div class="row">
<c:forEach var="purVO" items="${list}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${purVO.purname}</a>
                </h4>
                <h5>NT${purVO.purpricing}</h5>
                <p class="card-text">
                	購買國家：${purVO.purcountry}<br>
                	預計出貨時間：<fmt:formatDate value="${purVO.purtime}"  timeStyle="short" type="both"/>
                </p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
</c:forEach>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; TV Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
