<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="java.util.*"%>

<%
	PhoVO phovo = (PhoVO)request.getAttribute("phovo");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />	
	
<meta charset="UTF-8">

<title>商品下訂</title>


</head>
<body>
<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />

<!------------------------------------------------ 標題列 -------------------------------------------->   
   <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">輸入訂單資料</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
<!----------------------------------------------- 標題列 -------------------------------------------->    
  


<!-----------------------------------/ 訂單開始 /----------------------------------->


  <section class="property-grid grid">
    <div class="container">
      <div class="row">      
        <div class="col-12">
			<font style="color:red">${errorMsg}</font>
			<form action="<%=request.getContextPath()%>/pho/phocontrol" method="post">
			
<!-- 					輸入姓名、手機 -->
				<div class="form-row">
					<div class="form-group col-7">
						聯絡人姓名<input type="text" class="form-control" name="phoowner" id="phoowner"
									value="<%=(phovo==null)?"":phovo.getPhoowner()%>">
    					<font style="color:red">${nameerrorMsgs}</font>
    				</div>
    				<div class="form-group col-7">
						聯絡手機<input type="tel" class="form-control" name="phophone" id="phophone"
									value="<%=(phovo==null)?"":phovo.getPhophone()%>">
    					<font style="color:red">${phoneerrorMsgs}</font>
    				</div>
   				</div>
<!-- 					輸入EMAIL -->
   				<div class="form-row">
					<div class="form-group col-7">
						E-mail<input type="email" class="form-control" name="phomail" id="phomail"
									value="<%=(phovo==null)?"":phovo.getPhomail()%>">
    					<font style="color:red">${emailerrorMsgs}</font>
    				</div>
   				</div>
   				
<!-- 					輸入信用卡號\ -->  
				信用卡號碼
   				<br>
				<div class="form-row" style="float:left;">  				
						<input style="width:70px" class="form-control" type="text" name="phovisa0" maxlength="4" size="4" onKeyUp="next(this)">-  
						<br><input style="width:70px" class="form-control" type="text" name="phovisa1" maxlength="4" size="4" onKeyUp="next(this)">- 
						<br><input style="width:70px" class="form-control" type="text" name="phovisa2" maxlength="4" size="4" onKeyUp="next(this)">-
						<br><input style="width:70px" class="form-control" type="text" name="phovisa3" maxlength="4" size="4" onKeyUp="next(this)">
   				</div>
   				
   				
   				<font style="color:red">${carderrorMsgs}</font>
   				<br><br><br>
				<input type="submit" class="btn btn-b" value="確認購買">
				<input type="hidden" name="action" value="insert">
			</form>
			<br>
			
			
				<input id="magic" type="submit" class="btn btn-b" value="神奇小按鈕">
			
			
 		</div>
      </div>	
    </div>
  </section>
  <!-----------------------------------/ 訂單結束 /----------------------------------->
	
			
			
			
</body>


<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>	
	
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


<!----------------- 神奇小按鈕 --------------------------->
<script>

$("#magic").click(function(){
	buildInfo();
})

function buildInfo(){
	$("#phoowner").val("香蕉");
	$("#phophone").val("0987878787");
	$("#phomail").val("bochen9368@gmail.com");
}

</script>

</html>