<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bpt.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>${posVO.postitle}</title>
  <jsp:include page="/frontend/navbar.jsp" />
  <jsp:useBean id="bptSvc" class="com.bpt.model.BptService" scope="page"/>
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
            <h1 class="title-single">發表新文章</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
      </div>
    </div>
 </section>
  <!--/ Intro Single End /-->
<section class="news-single nav-arrow-b">
    <div class="container">
          <div class="form-comments">
            <form action="<%=request.getContextPath()%>/backend/pos/pos" method="post">
              <div class="row">
              <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <input type="text" name="postitle" class="form-control form-control-lg form-control-a" placeholder="文章標題">
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <select size="1" name="tagno">
                        <c:forEach var="bptVO" items="${bptSvc.all}" > 
                          <option value="${bptVO.tagno}" ${param.tagno == bptVO.tagno? "selected" : ""}>${bptVO.tagcontent}
                        </c:forEach>   
                      </select>
                    </div>
                  </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
                    <textarea id="textMessage" class="form-control" name="poscontent" cols="45"
                      rows="8" required>請輸入文章內容</textarea>
                      <script>
						CKEDITOR.replace( 'poscontent' );
		              </script>
                  </div>
                </div>
                <div class="col-md-12">
                  <input type="hidden" name="memno" value="${memno}">
                  <input type="hidden" name="action" value="mem_newpost">
                  <button type="submit" class="btn btn-a">送出</button>
                </div>
              </div>
            </form>
          </div>
  </div>
</section>

 
</body>
</html>