<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pos.model.*" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.bpt.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.*"%>
<jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>
<jsp:useBean id="bptSvc" class="com.bpt.model.BptService" scope="page"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>${memSvc.getOneMem(memno).memacc}的所有貼文</title>
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
  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">${memSvc.getOneMem(memno).memacc}的所有貼文</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
            
              <c:if test="${memno != null}">
            
              <li class="breadcrumb-item" style="font-size: 30px;">
                <a href="<%=request.getContextPath()%>/frontend/pos/NewPost.jsp">發文</a>
              </li>
              
              </c:if>
              
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ News Grid Star /-->
  <section class="news-grid grid">
    <div class="container">
      <div class="row">
<%
  PosService posSvc = new PosService();
  String memno = request.getParameter("memno");
  request.setAttribute("memno", memno);
  List<PosVO> list = posSvc.getAll().stream()
		  .filter(vo -> vo.getMemno().equals(memno))
		  .collect(Collectors.toList());
  request.setAttribute("list", list);
  Map<PosVO, String> map = new HashMap<PosVO, String>();
  request.setAttribute("map", map);

  for (PosVO vo : list) {
	  String temp = vo.getPoscontent();
	  int startwith = temp.indexOf("data:image/");
	  int endwith = startwith >= 0 ? temp.indexOf('"', startwith + 1) : -1;
	  
	  if (startwith >= 0) {
		  String img = temp.substring(startwith, endwith);
		  map.put(vo, img);
	  }
  }
%>     
        <c:forEach var="posVO" items="${list}">
      
        <div class="col-md-4">
          <div class="card-box-b card-shadow news-box">
            <div class="img-box-b">
              <img src='${map.get(posVO) != null? map.get(posVO) : "img/post-1.jpg"}' alt="" class="img-b img-fluid">
            </div>
            <div class="card-overlay">
              <div class="card-header-b">
                <div class="card-category-b">
                  <a href="<%=request.getContextPath()%>/frontend/pos/ListByTag.jsp?tagno=${posVO.tagno}" class="category-b">${bptSvc.getOneBpt(posVO.tagno).tagcontent}</a>
                </div>
                <div class="card-title-b">
                  <h2 class="title-2">
                    <a href="<%=request.getContextPath()%>/frontend/pos/listOnePos.jsp?posno=${posVO.posno}">${posVO.postitle}</a>
                  </h2>
                </div>
                <div class="card-date">
                  <span class="date-b">${posVO.postime}</span>
                </div>
              </div>
            </div>
          </div>
            <form action="<%=request.getContextPath()%>/backend/pos/pos" method="post">
              <input type="hidden" name="posno" value="${posVO.posno}">
              <input type="hidden" name="url" value="<%=request.getRequestURL()%>?memno=${sessionScope.memno}">
              <input type="hidden" name="action" value="delete">
              <button type='submit' class="nav-link" >刪除文章</button>
            </form>
          
        </div>
        
        </c:forEach>
        
      </div>
    </div>
  </section>
  <jsp:include page="/frontend/navbar.jsp" />
  <!--/ News Grid End /-->
</body>
</html>