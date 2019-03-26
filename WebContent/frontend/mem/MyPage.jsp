<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*" %>
<%
  MemService memSvc = new MemService();
  MemVO memVO = memSvc.getOneMem(request.getParameter("memno"));
  request.setAttribute("memVO", memVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<style>
.info-agents{
  font-size: 18px;
}
</style>  

<title>${memVO.memacc}的首頁</title>
</head>
<body>
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">${memVO.memacc}的基本資料</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--/ Agent Single Star /-->
  <section class="agent-single">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="row">
            
            <div class="col-sm-12 section-md-t3">
              <div class="agent-info-box">
                  <div class="info-agents color-a">
	                <p>
                      <strong>我的信箱</strong>
                      <br><span class="color-text-a">${memVO.mememail}</span>
                    </p>
                    <p>
                      <strong>信箱驗證狀態</strong>
                      <br><span class="color-text-a">${memVO.mememailvalid == 1 ? "email驗證通過" : "尚未通過email驗證"}</span>
                    </p>
                    <p>
                      <strong>我的姓名</strong>
                      <br><span class="color-text-a">${memVO.memrealname}</span>
                    </p>
                    <p>
                      <strong>我的英文姓名</strong>
                      <br><span class="color-text-a">${memVO.memengname}</span>
                    </p>
                    <p>
                      <strong>我的電話</strong>
                      <br><span class="color-text-a">${memVO.memphone}</span>
                    </p>
                    <p>
                      <strong>我的生日</strong>
                      <br><span class="color-text-a">${memVO.membirth}</span>
                    </p>
                    <p>
                      <strong>我的聯絡地址</strong>
                      <br><span class="color-text-a">${memVO.memaddr}</span>
                    </p>
					<button type="button" class="btn btn-a" onclick="javascript:location.href='<%=request.getContextPath()%>/frontend/mem/memupdate.jsp?memno=${memno}'">修改資料</button>
                </div>  
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </section>
  
  <jsp:include page="/frontend/navbar.jsp" />
  <!--/ Agent Single End /-->

</body>
</html>