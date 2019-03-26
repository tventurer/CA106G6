<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <!-- Sweetalert -->
  <script src='<%=request.getContextPath()%>/bootstrap/sweetAlert/sweetalert.min.js'></script>

</head>
<body <c:if test="${sessionScope.memno != null}">onload="connect();" onunload="disconnect();" </c:if> >

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <a class="navbar-brand text-brand" href="<%= request.getContextPath() %>/index.jsp">T<span class="color-b">-Venturer</span></a>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">代購商品</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=request.getContextPath()%>/pah/pahcontrol?action=listPahBySelect">機加酒</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath() %>/frontend/tri/tripIndex.jsp">自由行</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath() %>/backend/ptp/pacHead.jsp">套裝行程</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath() %>/frontend/pos/AllPost.jsp">旅人文章</a>
          </li>
          <c:if test="${memacc != null}">
          <li class="nav-item dropdown">          
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	會員
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%= request.getContextPath() %>/frontend/mem/MyPage.jsp?memno=${memno}">基本資料</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/pho/phocontrol?action=listMeOrder&memno=${memno}">我的機加酒</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/frontend/tri/listTriByMem.jsp">我的自由行</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/backend/pcd/memListAll.jsp?memno=${memno}">我的套裝行程</a>
              <a class="dropdown-item" href="<%= request.getContextPath() %>/frontend/pos/ListByMemno.jsp?memno=${memno}">文章管理</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/pur/listMemPur.jsp">代購商品管理</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/por/listSellPor.jsp">賣家訂單管理</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/por/listBuyPor.jsp">買家訂單管理</a>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/acr/listMemAcr.jsp">代幣管理</a>
            </div>
          </li>
          </c:if>
          <li class="nav-item">
<!--             <a class="nav-link" href="contact.html">Contact</a> -->
          </li>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <li class="nav-item">
          
            <button class="nav-link" id="btn_login" data-toggle="modal" data-target="#login" ${memno != null ? "style='display:none'" : '' } style="border: none; background-color:white;">登入</button>
            <c:if test="${memacc == null}">
            <li class="nav-item">
            	<a class="nav-link" id="register" href="<%=request.getContextPath()%>/frontend/mem/memsignup.jsp">註冊</a>
            </li>
            </c:if>
            <c:if test="${memacc != null}">
            
            <jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>

          	<li class="nav-item">
            	${memSvc.getOneMem(sessionScope.memno).memacc}你好<br>
<%--             	<%@ include file="/frontend/not/notification.file" %> --%>
          	</li>
            
            </c:if>
          <li>
          <c:if test="${memacc != null}">
            <button class="nav-link" id="btn_logout" data-toggle="modal" data-target="#logout" ${memno == null ? "style='display:none'" : '' } style="border: none; background-color:white;">登出</button>
<%--             <%@ include file="/frontend/not/notification.file" %> --%>
          </c:if>
          <c:if test="${memacc == null}">
            <button class="nav-link" id="btn_logout" data-toggle="modal" data-target="#logout" ${memno == null ? "style='display:none'" : '' } style="border: none; background-color:white;">登出</button>
          </c:if>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!--/ Nav End /-->

<!-- Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginLabel">登入</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
       </div>
      <div class="modal-body">
  	      <div class="form-group">
   		     <label for="login_text_mem_acc">信箱</label>
   		     <input type="text" name='mememail' class="form-control mememail" id="login_text_mememail" aria-describedby="ACCHelp" placeholder="輸入您的信箱">
   		     <small id="login_text_mem_acc_answer" class="form-text text-muted">請輸入您的信箱</small>
 		  </div>
	     <div class="form-group">
	         <label for="login_text_mem_pw">密碼</label>
	         <input type="password" name='mempwd' class="form-control password" id="login_text_mempwd" placeholder="輸入您的密碼">
	         <small id="login_text_mem_pw_answer" class="form-text text-muted">請輸入您的密碼</small>
	     </div>
	   <button type="button" class="btn btn-success login" >登入</button>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>


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
  
  <script>
  $(function(){
		
	    	$('.login').click(function(){
				 $.ajax({
					 type: "POST",
					 url: "<%=request.getContextPath()%>/MemLoginHandler",
					 data: {"mememail":$(".mememail").val(),
						    "password":$(".password").val(),
						    "action": "login"},
					 dataType: "json",
					 success: function(data){
						 if(data.access == 'true'){
							$('#login').modal('hide');
							swal({
								title: "登入成功!",
								text: data.memacc + "歡迎您登入旅遊浪潮",
								type:"success"}).then(function(){ 
							   		$('#btn_login').attr('style','display:none');
							   		$('#register').attr('style','display:none');
							   		$('#btn_logout').attr('style','display:""; border: none; background-color:white;');
							   		document.form.submit();
							   	}
							);
														
						}else{
							swal('你的帳號,密碼無效!','請您重新輸入帳號密碼','error');

						}
					 },
		             error: function(){
		             
		             }
		         });
			});
			
	    	$('#btn_logout').click(function(){
				 $.ajax({
					 type: "POST",
					 url: "<%=request.getContextPath()%>/MemLoginHandler",
					 data: {"action": "logout"},
					 dataType: "json",
					 success: function(data){
						swal({
							title: "成功登出",
							text: "即將回到首頁",
							type:"success"}).then(function(){ 
						   		location = "<%=request.getContextPath()%>/index.jsp";
						   	}
						);
					 },
		             error: function(){
		             
		             }
		         });
			});
	    	
		});
  
  function allowUser(){
		var memno = "${sessionScope.memno}";
		if( memno.length != 0)
			return true;
		else
			return false;
	}
  
  $("#login").on("hidden.bs.modal", function() {
	  	debugger
	  	$('.modal-backdrop').remove(); 
	  	});
  $("#login").on("hide.bs.modal", function() {
	  	debugger
	  	$('.modal-backdrop').remove(); 
	  	});
</script>
</body>
</html>
