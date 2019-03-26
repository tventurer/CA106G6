<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.acr.model.*"%>
<%
String memno=(String)session.getAttribute("memno");
pageContext.setAttribute("memno",memno);
%>

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />

<style>
.btn.btn-a, .btn.btn-b {
    padding: 1rem 3rem;
    letter-spacing: 0;
    }
 .btn{
     font-weight: 600;
     white-space: normal;
 }
</style>
<body>

  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">代幣儲值</h1>
            <span class="color-text-a">請先輸入信用卡號碼後，再選擇儲值金額</span>
          </div>
        </div>
<!--         <div class="col-md-12 col-lg-4"> -->
<!--           <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a href="#">首頁</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item active" aria-current="page"> -->
<!--              	   會員&nbsp;＞&nbsp;儲值 -->
<!--               </li> -->
<!--             </ol> -->
<!--           </nav> -->
<!--         </div> -->
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Agents Grid Star /-->
  <section class="agents-grid grid">
    <div class="container">
    <div class="row">
    
    <h4>請先輸入您的信用卡號：</h4>
        <form class="row needs-validation" novalidate="" method="POST" action="<%=request.getContextPath()%>/frontend/acr/goAcr.jsp">
        <div class="col-md-12">
            <input type="text" class="form-control" name="cardno" required="" pattern="[0-9]{16}" data-value-missing="請先輸入信用卡號" data-pattern-mismatch="卡號需為16碼數字">
            <div class="invalid-feedback"></div>
        </div>
        <div class="col-md-12">
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg" type="submit">確認</button> <br><br><br>
        </div>
       
    </form>
 </div>
 </div>
  </section>
  <!--/ Agents Grid End /-->


<jsp:include page="/frontend/footer.jsp" />
  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  
</body>
</html>

<script>
(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
	    var forms = document.getElementsByClassName('needs-validation');
	    // Loop over them and prevent submission
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	          var ele = form.getElementsByTagName("input")
	            for (var i = 0; i < ele.length; i++) {
	                var msg = "", reason = ele[i].validity;
	                if (reason.valueMissing) {
	                   msg = ele[i].getAttribute("data-value-missing");
	                }
	                else if (reason.patternMismatch) {
	                   msg = ele[i].getAttribute("data-pattern-mismatch");
	                }
	                else {
	                    // other reason...
	                }
	                ele[i].nextElementSibling.innerText=msg;
	            }
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	})();
</script>