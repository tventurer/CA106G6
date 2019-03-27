<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tod.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>商品下訂</title>
</head>
<body>
<jsp:include page="/frontend/navbar.jsp"/>
  
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">輸入訂單資料</h1>
            <span class="color-text-a">T-Venturer</span>
          </div>
        </div>
      </div>
    </div>
  </section>
   
  <section class="property-grid grid">
    <div class="container">
      <div class="row">      
        <div class="col-12">
			<font style="color:red">${errorMsgs.error}</font>
			<form method="post" action="tod">

				<div class="form-row">
					<div class="form-group col-7">
						聯絡人姓名<input type="text" class="form-control" id="todowner" name="todowner" 
									value="${param.todowner}">
    					<font style="color:red">${errorMsgs.todowner}</font>
    				</div>
    				<div class="form-group col-7">
						聯絡手機<input type="tel" class="form-control" id="todphone" name="todphone"
									value="${param.todphone}">
    					<font style="color:red">${errorMsgs.todphone}</font>
    				</div>
   				</div>

   				<div class="form-row">
					<div class="form-group col-7">
						E-mail<input type="email" class="form-control" id="todmail" name="todmail"
									value="${param.todmail}">
    					<font style="color:red">${errorMsgs.todmail}</font>
    				</div>
   				</div>
   				

				信用卡號碼
   				<br>
				<div class="form-row" style="float:left;">  				
						<input style="width:70px" class="form-control" type="text" name="todvisa0" maxlength="4" size="4" onKeyUp="next(this)">-  
						<br><input style="width:70px" class="form-control" type="text" name="todvisa1" maxlength="4" size="4" onKeyUp="next(this)">- 
						<br><input style="width:70px" class="form-control" type="text" name="todvisa2" maxlength="4" size="4" onKeyUp="next(this)">-
						<br><input style="width:70px" class="form-control" type="text" name="todvisa3" maxlength="4" size="4" onKeyUp="next(this)">
   				</div>
   				
   				
   				<font style="color:red">${errorMsgs.todvisa}</font>
   				<br><br><br>
   				<input type="hidden" name="todpurchase" value="${todpurchase}">
   				<input type="hidden" name="todno" value="${todno}">
				<input type="hidden" name="action" value="todPay">
				<input type="submit" class="btn btn-b" value="確認購買">
			</form>
			<br>
				
				<input id="magic" type="submit" class="btn btn-b" value="神奇小按鈕">
			
 		</div>
      </div>	
    </div>
  </section>

<br>
<br> 
<br>
<jsp:include page="/frontend/footer.jsp"/>
			
</body>

<script>  
	function next(obj) {  
	    if (obj.value.length == obj.maxLength) {  
	        do {  
	            obj = obj.nextSibling;  
	        } while (obj.nodeName != "INPUT");  
	        obj.focus();  
	    }         
	}  
	document.forms[0].N1.focus();  
</script>

<script>

$("#magic").click(function(){
	$("#todowner").val("香蕉");
	$("#todphone").val("0911123123");
	$("#todmail").val("bochen9368@gmail.com");
});

</script>
 
</html>