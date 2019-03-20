<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.acr.model.*"%>
<%
String memno="MEM000001";
pageContext.setAttribute("memno",memno);


if (request.getParameter("cardno") == null){
	response.sendRedirect(request.getContextPath()+"/frontend/acr/addOneAcr.jsp");
}else{
	String cardno = new String(request.getParameter("cardno"));
	pageContext.setAttribute("cardno",cardno);
}
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
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="#">首頁</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
             	   會員&nbsp;＞&nbsp;儲值
              </li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Agents Grid Star /-->
  <section class="agents-grid grid">
    <div class="container">
      <div class="row">
      	<div class="col-md-4">
          <div class="card-box-d">
          	  <FORM METHOD="post" ACTION="acr" name="form1">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="500">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;&nbsp;&nbsp;500">
              </FORM>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
			  <FORM METHOD="post" ACTION="acr" name="form2">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="1000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;&nbsp;1000">
              </FORM>          
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form3">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
 			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="3000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;&nbsp;3000">
              </FORM>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form4">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
  			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="5000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;&nbsp;5000">
              </FORM>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form5">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
  			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="7000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;&nbsp;7000">
              </FORM>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form6">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
  			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="9000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;&nbsp;9000">
              </FORM>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form7">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
 			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="10000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;10000">
              </FORM>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form8">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
  			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="15000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;15000">
              </FORM>
          </div>
        </div><div class="col-md-4">
          <div class="card-box-d">
              <FORM METHOD="post" ACTION="acr" name="form9">
          	  <input type="hidden" name="action" value="insert">
			  <input type="hidden" name="acrsource" value="1">
			  <input type="hidden" name="acrend" value="儲值">
  			  <input type="hidden" name="cardno" value="${cardno}">
			  <input type="hidden" name="memno" value="${memno}">
			  <input type="hidden" name="acrprice" value="20000">
              <input type="submit" class="btn btn-b" value="儲值 NT $&nbsp;&nbsp;20000">
              </FORM>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Agents Grid End /-->


  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">Home</a>
              </li>
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Property</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Blog</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
            </ul>
          </nav>
          <div class="socials-a">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-dribbble" aria-hidden="true"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; Copyright
              <span class="color-a">EstateAgency</span> All Rights Reserved.
            </p>
          </div>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
      </div>
    </div>
  </footer>
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