<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>test</title>
<style>
.greenArrow{
width: 100px;
height: 100px;
}
</style>
</head>
<jsp:include page="/frontend/navbar.jsp"/>
<body>

<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">�ڪ���{</h1>
          </div>
        </div>
      </div>
    </div>
</section>

	<div class="container-fluid">
		<div class="row justify-content-center">
		
		<div class="col-md-4 offset-md-1 col-lg-4 offset-lg-1">
          <div class="title-box-d">
          	<h3>��1��</h3>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">�x�_101</h4>

                  <div style="display:inline">�_�l�ɶ�:</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div style="display:inline">�פ�ɶ�:</div>

                </div>
              </li>
             </ul>
            </div>
           <center><img class="greenArrow" src="<%= request.getContextPath() %>/frontend/tri/image/arrow_down.png"></center>
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
                  <h4 class="comment-author">��߬G�c�ժ��|</h4>

                  <div style="display:inline">�_�l�ɶ�:</div><div style="display:inline">�פ�ɶ�:</div>

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
                  <h4 class="comment-author">�h�L�]��</h4>

                  <div>�_�l�ɶ�:�פ�ɶ�:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
           <div class="col-md-7 offset-md-1 col-lg-7 offset-lg-1">
          <div class="title-box-d">
          	<h3>��2��</h3>
          </div>
          <div class="box-comments">
            <ul class="list-comments">
              <li>
                <div class="comment-avatar">
                  <img src="<%= request.getContextPath() %>/style/f/img/author-2.jpg" alt="">
                </div>
                <div class="comment-details">
                  <h4 class="comment-author">�x�_101</h4>

                  <div>�_�l�ɶ�:�פ�ɶ�:</div>

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
                  <h4 class="comment-author">��߬G�c�ժ��|</h4>

                  <div>�_�l�ɶ�:�פ�ɶ�:</div>

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
                  <h4 class="comment-author">�h�L�]��</h4>

                  <div>�_�l�ɶ�:�פ�ɶ�:</div>

                </div>
              </li>
             </ul>
            </div>
           </div>
           
         </div>
	</div>



</body>
</html>