<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--拿到CONTROLER傳來的物件 --%>
<% 
	PahVO pahvo = (PahVO)request.getAttribute("pahvo"); 
	List<PahVO> buyList = (Vector<PahVO>)session.getAttribute("shoppingcart");
	
// 	顯示購買數量及剩餘數量
	int buynum = 0;
	if(buyList!=null){
		if(!buyList.isEmpty()){
			for(PahVO buy:buyList){
				if(pahvo.equals(buy)){
					buynum=buy.getPahnum();
				}
			}		
		}
	}
	
%>



<!DOCTYPE html>
<html>
<head>
	
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">



<meta charset="UTF-8">
<title>機加酒資料一筆</title>


</head>
<body>

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />

<!-------------------------------------- 內文開始(不可砍) --------------------------------------->
<!--/ 機加酒標題介紹 /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=pahvo.getPahname()%></h1>
            <span class="color-text-a"><%=pahvo.getPahintro()%></span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
        </div>
      </div>
    </div>
  </section>
<!--/ 機加酒標題介紹 /-->


<!--/ 機加酒內文 /-->
<section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property">
          
            <div class="carousel-item-b">
              <%
              	byte[] bt2 = pahvo.getPahpc2();
            	if(bt2!=null){
            		String pic2 = Base64.encode(bt2);	     
              %>
              	<img src="data:image/jpg;base64,<%=pic2%>" class="img-fluid">
              <%}%>
            </div>
             <div class="carousel-item-b">
              <%
              	byte[] bt3 = pahvo.getPahpc3();
            	if(bt3!=null){
            		String pic3 = Base64.encode(bt3);	     
              %>
              	<img src="data:image/jpg;base64,<%=pic3%>" class="img-fluid">
              <%}%>
            </div>
            
          </div>
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-4">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                  <div class="card-box-ico">
                    <span class="ion-money">$</span>
                  </div>
                  <div class="card-title-c align-self-center">
                    <h5 class="title-c"><%=pahvo.getPahprice()%></h5>
                  </div>
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">商品簡介</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>出發日期:</strong>
                      <span><%=pahvo.getPahstdate()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>回程日期:</strong>
                      <span><%=pahvo.getPahenddate()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>國家:</strong>
                      <span><%=pahvo.getPahcountry()%></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">當地特色</h3>
                  </div>
                </div>
              </div>
              <div class="property-description">
                <p class="description color-text-a">
                	<%=pahvo.getPahcontent()%>
                </p>
              </div>
        </div>
   	  </div>
	  <div class="row">
            <div class="col-6">
			<%
			 	byte[] bt4 = pahvo.getPahpc4();
			if(bt3!=null){
				String pic4 = Base64.encode(bt4);	     
			 %>
			<img src="data:image/jpg;base64,<%=pic4%>" class="img-fluid">
			<%}%>
         </div>
         <div class="col-6">
       		<%
			 	byte[] bt5 = pahvo.getPahpc5();
			if(bt3!=null){
				String pic5 = Base64.encode(bt5);	     
			%>
			  <img src="data:image/jpg;base64,<%=pic5%>" class="img-fluid">
			<%}%>
         </div>
   	   </div>
   	   <div class="row">
            <div class="col-3">
            </div>
            <div class="col-2">
            	<br>
	        	<input type="button" onclick="location.href='<%= request.getContextPath()%>/pah/pahcontrol?action=listPahBySelect';" value="繼續選購" class="btn btn-b"/>
            </div>
            <div class="col-4">
            	<br>
            	<form method="post" action="<%=request.getContextPath()%>/pah/shoppingcontrol">	
				    <input id="dec" type="button" value="-" class='qtyminus btn btn-outline-warning'>	
				    <input id="count" min="1" max="<%=pahvo.getPahnum()-buynum%>" type="number" value="1" size="1" style="text-align:center;" name="quantity">
					<input id="inc" type="button" value="+" class='qtyminus btn btn-outline-warning'>
					
					<input type="hidden" name="price" value="${pahvo.pahprice}">
					<input type="hidden" name="pahno" value="${pahvo.pahno}">
					<input type="hidden" name="action" value="add">
					<input type="submit" value="加入購物車" class="btn btn-b">
				</form>
				<br>
            	<h3>選購數量 / 剩餘數量 : <%=buynum%>/<%=pahvo.getPahnum()-buynum%></h3>
            </div>
            <div class="col-3">
            </div>
        </div>   	   
      </div>
    </div>
   </div>
 </section>


	


<!-------------------------------- 引入購物車 ------------------------------------->

<div id="service" style="position: fixed;top: 85%;left: 92%;">
	<form method="post" action="<%=request.getContextPath()%>/pah/shoppingcontrol">
		<input type="hidden" name="action" value="checkOut">
		<input type="hidden" name="pahno" value="${pahvo.pahno}">
		<input type="hidden" name="url" value="<%=request.getServletPath()%>">
		<input  type="image" id="mycart" src="<%=request.getContextPath()%>/frontend/pah/img/cart.png" style="width: 75px;height: 75px;">
	</form>
</div>
	<%@ include file="listbootcart" %>
	


<!-------------------------------- 引入尾巴 ------------------------------------->

<jsp:include page="/frontend/footer.jsp" />  



</body>

<script
	src="<%=request.getContextPath()%>/bootstrap/sweetAlert/sweetalert.min.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/sweetAlert/jquery-3.2.1.min.js"></script>

<script>

// 數量顯示器
window.onload = function() {
    var count = document.getElementById("count");
    var inc = document.getElementById("inc");
    var dec = document.getElementById("dec");
    inc.onclick = function() {
    	if(count.value<<%=pahvo.getPahnum()-buynum%>){
	        count.value = parseInt(count.value) + 1;		
    	}
    };
    dec.onclick = function() {
    	if(count.value>1){
	        count.value = parseInt(count.value) - 1;
    	}
    };
};

</script>


<script>

//SWEETALERT
<%if("sweetalert6".equals(request.getAttribute("sweetalert6"))){%>
	swal({
		  title: "已加入購物車!",
		  text: "可以再多買一點哦",
		  icon: "success",
		  button: "關閉",
		  timer: 1500,
		});
<%}%>
</script>

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


</html>