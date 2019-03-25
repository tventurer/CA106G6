<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tod.model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>自由行規劃</title>
</head>

<body>
<jsp:include page="/frontend/navbar.jsp"/>

<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-9 col-lg-7">
          <div class="title-single-box">
            <h1 class="title-single">我的行程訂單</h1>
          </div>
        </div>
        <div class="col-md-3">
            <h5 class="title-single">報價有效日期:${todVO.todddl}</h5>
        </div>
      </div>
    </div>
</section>
<c:if test="${not empty errorMsgs}">
	<center><font style="color:red">請修正以下錯誤:  ${errorMsgs.error}${errorMsgs.todpurchase}</font></center>
</c:if>

<%
	TodVO todVO = (TodVO)request.getAttribute("todVO");
	if(todVO != null){   //沒寫NullpointerException
		String todremark = todVO.getTodremark();  //name=故宮門票price=200name=台北101門票price=500name=悠遊卡3日車票price=300
		System.out.println("todremark:" + todremark);
		Map<String,String> pdt = new LinkedHashMap<String,String>();
		if(todremark != null){
			String[] strs = todremark.split("name");
			for(int i = 0; i < strs.length; i++){
				if(i != 0){
					String[] strs2 = strs[i].split("price");
					pdt.put(strs2[0].substring(1, strs2[0].length()), strs2[1].substring(1, strs2[1].length()));
					System.out.println(pdt);
				}
			}
		}
	pageContext.setAttribute("pdt", pdt);
	}
%>

 <section class="section-about">
  <form method="post" action="tod">
    <div class="container">
      <div class="row">
      
      <c:forEach var="keys" items="${pdt.keySet()}" varStatus="s">
      
        <div class="col-md-4">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico">
                <span class="fa fa-home"></span>
              </div>
              <div class="card-title-c align-self-center">
                <h2 class="title-c">${keys}</h2>
              </div>
            </div>
            <div class="card-body-c justify-content-center">
              <h4 class="content-c">
              $${pdt.get(keys)}</h4>
              <input type="checkbox" class="form-check-input check" id="Check${s.index}" name="todpurchase" value="name=${keys}price=${pdt.get(keys)}">
    		  <label class="form-check-label" for="Check${s.index}">選取</label>
            </div>
          </div>
        </div>
        
        <c:if test="${s.index == 2}">
        </div>
        <br><br><br><br>
        <div class="row">
        </c:if>
        
     </c:forEach>
      
      </div>
    </div>
    <hr>
    <div class="row justify-content-end">
    	<div class="col-3">
    		<h3><b>total:$<span id="dollar">0</span></b></h3>
    	</div>
    </div>
    <br><br><br>
    <div class="row justify-content-center">
        	<input type="hidden" name="action" value="purchasing">
        	<input type="hidden" name="todno" value="${todVO.todno}">
        	<div class="col-md-2">
            	<button type="submit" class="btn btn-b">下一步</button>
        	</div>
    </div>
  </form>
  </section>
  
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
  
</body>

<script>
$(".check").on("change",function(e){
	var a = e.target.previousElementSibling.innerText;
	debugger
	if(e.target.checked == true){
		var money = parseInt(e.target.previousElementSibling.innerText.substring(1,e.target.previousElementSibling.innerText.length));
		debugger
		$("#dollar").text(parseInt($("#dollar").text()) + money);
	} else{
		var money = parseInt(e.target.previousElementSibling.innerText.substring(1,e.target.previousElementSibling.innerText.length));
		debugger
		$("#dollar").text(parseInt($("#dollar").text()) - money);
	}
	
});

</script>  
</html>