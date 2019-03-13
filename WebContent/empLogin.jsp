<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*" %>
<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/b/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login - T-Venturer Admin</title>
    
    <%-- 錯誤表列 --%>

    
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <!--<img src="logo.png" height="90" width="250">-->
        <h1>T-Venturer</h1>
      </div>
      <div class="login-box">
        <form class="login-form" action="<%=request.getContextPath()%>/backend/emp/emp" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
          
       
          
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input class="form-control" id="email" type="text" name="email" placeholder="Email" autofocus value="<%= (empVO==null)? "": empVO.getEmpmail()%>"/>
            <div class="form-control-feedback" id="emailmessage" style="color:red;"></div>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label>
            <input class="form-control" id="password" type="password" name="password" placeholder="Password">
          	<div class="form-control-feedback" id="pwdmessage" style="color:red;"></div>
          </div>
          <!--
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text">Stay Signed in</span>
                </label>
              </div>
              <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>
            </div>
          </div>
          -->
          <input type="hidden" name="action" value="account">
          <div class="form-group btn-container">
            <button type="submit"  class="btn btn-primary btn-block">
            <i class="fa fa-sign-in fa-lg fa-fw">
            </i>SIGN IN</button>
          </div>
        </form>
        <!-- 
        <form class="forget-form" action="index.html">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
          <div class="form-group">
            <label class="control-label">EMAIL</label>
            <input id="forgetpwd" class="form-control" type="text" placeholder="請輸入註冊Email">
          	<div class="form-control-feedback" id="forgetpwdmessage" style="color:red;"></div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
          </div>
          <div class="form-group mt-3">
            <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
          </div>
        </form>
         -->
      </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/style/b/js/jquery-3.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/style/b/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/style/b/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/style/b/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=request.getContextPath()%>/style/b/js/plugins/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>
  </body>
</html>
    <c:if test="${not empty errorMsgs}">
    		<c:forEach var="message" items="${errorMsgs}">
    		<script type="text/javascript">
    		var check="${message}";
    		if(check=="errorpwd"){
      			document.getElementById("password").className='form-control is-invalid';
    			document.getElementById("pwdmessage").innerHTML='密碼錯誤，請重新輸入';
    		}else if(check=="noemail"){
      			document.getElementById("email").className='form-control is-invalid';
      			document.getElementById("emailmessage").innerHTML='帳號錯誤，請重新輸入';
    		}
    		</script>
    		</c:forEach>
    </c:if>
 <script>
	document.onkeydown = function(e) {//键盘按键控制
		e = e || window.event;
		if ((e.ctrlKey && e.keyCode == 82) || e.keyCode == 116) { //ctrl+R和F5刷新
			window.location.replace("<%=request.getContextPath()%>/empLogin.jsp");
		   return false;
		}
	}
</script>