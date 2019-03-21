<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.acr.model.*"%>
<% 
	String purid = new String(request.getParameter("purid")); 
	pageContext.setAttribute("purid",purid);

	PurService purSvc = new PurService();
	PurVO purVO = purSvc.getOnePur(purid);
	
    Integer purstock = purVO.getPurstock();
	  
	PorService porSvc = new PorService(); 
	
	String sellmem = purVO.getMemno();
	pageContext.setAttribute("sellmem",sellmem);
	
	//有登入才會跑這裡顯示目前擁有的代幣
	Object check = session.getAttribute("memno");
	if(check != null){
		String memno=(String)session.getAttribute("memno");
		AcrService acrSvc = new AcrService();
		pageContext.setAttribute("memno",memno);
		List<AcrVO> Acrlist = acrSvc.getMemAll(memno);
		pageContext.setAttribute("Acrlist",Acrlist);
	}

	
%>
<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />


<style>
.owl-carousel .owl-item img{
	width: auto;
    margin: auto;
}
</style>
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=purVO.getPurname() %></h1>
            <span class="color-text-a">商品類別：<%=purVO.getPursort() %></span>
          </div>
        </div>
<!--         <div class="col-md-12 col-lg-4"> -->
<!--           <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a href="index.html">首頁</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a href="purIndex.jsp">代購商品</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item active" aria-current="page"> -->
<%--                 <%=purVO.getPurname() %> --%>
<!--               </li> -->
<!--             </ol> -->
<!--           </nav> -->
<!--         </div> -->
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Property Single Star /-->
    <section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<c:forEach var="message" items="${errorMsgs}">
    		<script type="text/javascript">
    		window.addEventListener("load", function(event) {
    		var check="${message}";
    		if(check=="請登入會員"){
    			var r = confirm("請登入會員，前往登入~!");
				if(r == true){
					window.location = '<%=request.getContextPath()%>/memlogin.jsp';
				}else{
					window.history.go(-1); 
				}
    		}else if(check=="檢舉原因不得為空白"){
    			alert("檢舉原因不得為空白");
    		}
    		});
    		</script>
    		</c:forEach>
</c:if>

          <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property">
            <div class="carousel-item-b">
              <img height="500px" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=<%=purVO.getPurid() %>" alt="">
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
                    <h5 class="title-c"><%=purVO.getPurpricing() %></h5>
                  </div>
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">商品詳情</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>賣家會員：</strong>
                      <span><%=purVO.getMemno() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品類別：</strong>
                      <span><%=purVO.getPursort() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>參考網址：</strong>
                      <span><a href=<%=purVO.getPururl()%>>連結於此處</a></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>購買國家：</strong>
                      <span><%=purVO.getPurcountry() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>收貨國家：</strong>
                      <span><%=purVO.getPurdelivery() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品當地原價：</strong>
                      <span><%=purVO.getPurreprice() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>提供收據：</strong>
                      <span><%=purVO.getPurreceipt() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品總數量：</strong>
                      <span><%=purVO.getPurstock() %></span>
                    </li>
                    
                    <li class="d-flex justify-content-between">
                      <strong>已賣出的商品數：</strong>
                      <span><%=purVO.getPursell() %></span>
                    </li>
                  </ul>
                </div>
              </div>
              <form class="form-a" METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/addOnePor.jsp">
              <div class="row">
              <div class="col-md-12">
              <div class="form-group">
              <label for="Type">購買數量</label>
              <select name="porsum" id="porsum" class="form-control form-control-lg form-control-a" id="Type">
				<%for(int i = 1; i<=(purVO.getPurstock()-purVO.getPursell()); i++){
					out.println("<option>"+i+"</option>");
				} %>
                
              </select>
            </div>
            </div>
         <c:if test="${not empty memno}">
         <c:forEach var="myacr" items="${Acrlist}" varStatus="s">
		 <c:choose>
		 <c:when test="${s.last}">
		 <div class="col-md-12"><h6>您的代幣數量為：${myacr.acrtotal}<br></h6></div>
		 <input type="hidden" name="acrtotal" value="${myacr.acrtotal}">
		 </c:when>
		 </c:choose>
		 </c:forEach>
		 </c:if>
		 
		  <c:if test="${not empty memno}">
			 <c:if test="${sellmem != memno}">
			 <div class="col-md-12">
	   		 <input type="hidden" name="action" value="insert">
	   		 <input type="hidden" name="memno" value="${memno}">
	   		 <input type="hidden" name="purid" value="${purid}">
	         <button type="submit" class="btn btn-a">購買</button>
	         </div>
			 </c:if>
		  </c:if>
		  
		   <c:if test="${empty memno}">
		   	 <div class="col-md-12">
	         <input type="button" class="btn btn-a" onclick="location.href='<%=request.getContextPath()%>/memlogin.jsp' " value="購買" >
	         </div>
		   </c:if>
		 
		 
		 
           </div>
           <br>
         </form>
            </div>
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">商品描述</h4>
                  </div>
                </div>
              </div>
              <div class="property-description">
                <p class="description color-text-a">
                 <%=purVO.getPurcontent() %>
                </p>
              </div>
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">下單截止時間</h4>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <p><i class="fa fa-calendar-times-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="<%=purVO.getPurobtained() %>" timeStyle="short" type="both"/></p>
                </ul>
              </div>
              
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">預計出貨時間</h4>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <p><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="<%=purVO.getPurextime() %>" timeStyle="short" type="both"/></p>
                </ul>
              </div>
              
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">購買評價限制</h4>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <p><i class="fa fa-user-times" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;購買者的購物評價<%=purVO.getPurlimit() %>以下不得購買</p>
                </ul>
              </div>
              <div class="amenities-list color-text-a">
                <button type="button" data-toggle="modal" data-target="#qab" class="btn btn-a">檢舉此商品</button>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pre/pre" style="margin-bottom: 0px;">
				<div class="modal fade" id="qab" role="dialog">
				<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">檢舉此商品</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				檢舉類別：<br>
				<select size="1" name="prelabel">
				<%
				String[] prelabel = {"賣場描述或圖片中含有不當內容","詐騙","賣場販售仿冒品","導向此平台已外交易","其他"};
				for(int i = 0; i<prelabel.length; i++){
					out.print("<option value='" + i + "'>"+ prelabel[i]+ "</option>");
				}
				%>
				</select>
				<br><br>
				檢舉原因原因：<br>
				<textarea class="form-control rounded-0" name="precause" rows="4" ></textarea>
				<input type="hidden" name="purid"  value="${purid}">
				<input type="hidden" name="action"	value="insert">
				<input type="hidden" name="memno"	value="${memno}">
				<input type="hidden" name="empno"	value="EMP000001">
				</div>
				<div class="modal-footer"> 
				<input type="submit" class="btn btn-default" value="送出">
				</div>
				</div>
				</div>
				</div>
				</FORM>
              </div>
              
            </div>
          </div>
          
        </div>


                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Property Single End /-->
  
  <!--/ footer Star /-->
<!--   <footer> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <nav class="nav-footer"> -->
<!--             <ul class="list-inline"> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Home</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">About</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Property</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Blog</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Contact</a> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </nav> -->
<!--           <div class="socials-a"> -->
<!--             <ul class="list-inline"> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-facebook" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-twitter" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-instagram" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-pinterest-p" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-dribbble" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </div> -->
<!--           <div class="copyright-footer"> -->
<!--             <p class="copyright color-text-a"> -->
<!--               &copy; Copyright -->
<!--               <span class="color-a">T-Venturer</span> All Rights Reserved. -->
<!--             </p> -->
<!--           </div> -->
<!--           <div class="credits"> -->
<!--            
<!--               All the links in the footer should remain intact. -->
<!--               You can delete the links only if you purchased the pro version. -->
<!--               Licensing information: https://bootstrapmade.com/license/ -->
<!--               Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency -->
<!--             --> -->
<!--             Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </footer> -->
  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>






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
</html>
