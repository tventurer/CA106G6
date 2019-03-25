<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pos.model.*" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.bpt.model.*" %>
<%@ page import="com.bpc.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
  PosService posSvc = new PosService();
  PosVO posVO = posSvc.getOnePos(request.getParameter("posno"));
  request.setAttribute("posVO", posVO);
 
  BpcService bpcSvc = new BpcService();
  List<BpcVO> bpclist = bpcSvc.getListByPosno(posVO.getPosno());
  request.setAttribute("bpclist", bpclist);
%>
<jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>
<jsp:useBean id="bptSvc" class="com.bpt.model.BptService" scope="page"/>
<html>
<head>
  <meta charset="utf-8">
  <title>${posVO.postitle}</title>
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
            <h1 class="title-single">${posVO.postitle}</h1>
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

  <!--/ News Single Star /-->
  <section class="news-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="news-img-box">
            <img src="<%=request.getContextPath()%>/style/f/img/slide-3.jpg" alt="" class="img-fluid">
          </div>
        </div>
        <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-2">
          <div class="post-information">
            <ul class="list-inline text-center color-a">
              <li class="list-inline-item mr-2">
                <strong>作者: </strong>
                <span class="color-text-a">${memSvc.getOneMem(posVO.memno).memacc}</span>
              </li>
              <li class="list-inline-item mr-2">
                <strong>分類: </strong>
                <span class="color-text-a">${bptSvc.getOneBpt(posVO.tagno).tagcontent}</span>
              </li>
              <li class="list-inline-item">
                <strong>日期: </strong>
                <span class="color-text-a">${posVO.postime}</span>
              </li>
            </ul>
          </div>
          <div class="post-content color-text-a">
          <p class="post-intro">
            ${posVO.poscontent}
          </p>
          </div>
          
          
        <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1">
          <div class="title-box-d">
            <h3 class="title-d">留言 (${bpclist.size()})</h3>
          </div>
          <div class="box-comments">
          
            <c:forEach var="bpcVO" items="${bpclist}">
          
            <ul class="list-comments">
              <li>
                <div class="comment-details">
                  <h4 class="comment-author">${memSvc.getOneMem(bpcVO.memno).memacc}</h4>
                  <span>${bpcVO.bpctime}</span>
                  <p class="comment-description">
                    ${bpcVO.bpccontent}
                  </p>
                </div>
              </li>
            </ul>
            
            </c:forEach>
            
          </div>
          <div class="form-comments">
            <div class="title-box-d">
              <h3 class="title-d">文章留言</h3>
            </div>
            <form action="<%=request.getContextPath()%>/frontend/bpc/bpc" method="post">
              <div class="row">
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="textMessage">你的留言</label>
                    <script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
                    <textarea id="textMessage" class="form-control" placeholder="說點什麼吧" name="bpccontent" cols="45"
                      rows="8" required></textarea>
                      <script>
						CKEDITOR.replace( 'bpccontent' );
		              </script>
                  </div>
                </div>
                <div class="col-md-12">
                  <input type="hidden" name="posno" value="${posVO.posno}">
                  <input type="hidden" name="memno" value="${memno}">
                  <input type="hidden" name="action" value="insert">
                  <button type="submit" class="btn btn-a">送出</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>
  <!--/ News Single End /-->
</body>
</html>