<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.acr.model.*"%>
<%@ page import="com.mem.model.*"%>
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
            <span class="color-text-a">商品類別：
            <%
            String[] pursort = { "生活居家", "生活休閒", "國際菸草", "各國酒類", "玩具遊戲", "毛小孩專屬", "經典品牌", "行家收藏", "運動用品", "美妝保養", "異國美食"};
        	Integer pursortno = purVO.getPursort();
        	out.println(pursort[pursortno]);           
            %></span>
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
                      <span>
						<%
						String memid = purVO.getMemno();
                        MemService memSvc = new MemService();
                        MemVO memVO =memSvc.getOneMem(memid);
                        out.println(memVO.getMemrealname());
					   %>
					  </span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品類別：</strong>
                      <span><%
			        	out.println(pursort[pursortno]);           
			            %></span>
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
                      <span><%
                      String[] Purreceipt = {"不提供","提供"};
					  Integer receiptno = purVO.getPurreceipt();
					  out.println(Purreceipt[receiptno]);
					  %></span>
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
              <h1>此商品未上架</h1>
         		<br>
                
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
  
<jsp:include page="/frontend/footer.jsp" />

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
