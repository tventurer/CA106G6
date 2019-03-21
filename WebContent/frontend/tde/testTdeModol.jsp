<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>test</title>
</head>
<jsp:include page="/frontend/navbar.jsp"/>
<body>

<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">我的行程</h1>
          </div>
        </div>
      </div>
    </div>
</section>

	<div class="container-fluid">
		<div class="row justify-content-center">
		
		<div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          	<h3>第1天</h3>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">台北101</h4>

                  <div style="display:inline">起始時間:</div><div style="display:inline">終止時間:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
         <div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">國立故宮博物院</h4>

                  <div style="display:inline">起始時間:</div><div style="display:inline">終止時間:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
         <div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">士林夜市</h4>

                  <div>起始時間:終止時間:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
           <div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          	<h3>第2天</h3>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">台北101</h4>

                  <div>起始時間:終止時間:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
         <div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">國立故宮博物院</h4>

                  <div>起始時間:終止時間:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
         <div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">士林夜市</h4>

                  <div>起始時間:終止時間:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
         </div>
	</div>



</body>
</html>