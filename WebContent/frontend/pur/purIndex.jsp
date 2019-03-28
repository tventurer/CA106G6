<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%
    PurService purSvc = new PurService();
    List<PurVO> list = purSvc.getPurOneAll();
    pageContext.setAttribute("list",list);
    
    String purstatus[]={"未上架","上架中","已下架","檢舉下架"};
    request.setAttribute("purstatus", purstatus);
    
    String[] pursort = {"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
    request.setAttribute("pursort", pursort);
     
%>

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />
 <title>代購商品</title>
  <style>
  .img-fluid{
  height:280px;
  margin:auto;
  }
  </style>
</head>

<body>

 
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">Purchasing</h1>
            <span class="color-text-a">來自世界各地的商品</span>
          </div>
        </div>

        <!--/ 此處可放搜尋類別路徑 /-->
<!--         <div class="col-md-12 col-lg-4"> -->
<!--           <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a href="#">首頁</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item active" aria-current="page"> -->
<!--               	  代購商品 -->
<!--               </li> -->
<!--             </ol> -->
<!--           </nav> -->
<!--         </div> -->

      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Property Grid Star /-->
  <section class="property-grid grid">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">

          <!--/ 此處可讓使用者用類別搜尋 /-->
<!--           <div class="grid-option"> -->
<!--             <form> -->
<!--               <select class="custom-select"> -->
<!--                 <option selected>All</option> -->
<!--                 <option value="1">New to Old</option> -->
<!--                 <option value="2">For Rent</option> -->
<!--                 <option value="3">For Sale</option> -->
<!--               </select> -->
<!--             </form> -->
<!--           </div> -->

        </div>
        
        <!--/ 商品陳列卡片顯示 /-->
<%@ include file="page1.file" %>
<c:forEach var="purVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
        <div class="col-md-4">
          <div class="card-box-a card-shadow">
            <div class="img-box-a">
            <div class="row">
            <img src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" alt="" class="img-a img-fluid">
            </div>
            </div>
            <div class="card-overlay">
              <div class="card-overlay-a-content">
                <div class="card-header-a">
                  <h2 class="card-title-a">
                    <a href="purListOne.jsp?purid=${purVO.purid}">${purVO.purname}</a>
                  </h2>
                </div>
                <div class="card-body-a">
                  <div class="price-box d-flex">
                    <span class="price-a">NT | $ ${purVO.purpricing}</span>
                  </div>
                  <a href="purListOne.jsp?purid=${purVO.purid}" class="link-a">商品詳情
                    <span class="ion-ios-arrow-forward"></span>
                  </a>
                </div>

                <div class="card-footer-a">
                  <ul class="card-info d-flex justify-content-around">
                    <li>
                      <h4 class="card-info-title">截止日期</h4>
                      <span><fmt:formatDate value="${purVO.purobtained}"  timeStyle="short" type="both"/>
                      </span>
                    </li>
                    <li>
                      <h4 class="card-info-title">預計出貨</h4>
                      <span><fmt:formatDate value="${purVO.purtime}"  timeStyle="short" type="both"/>
                      </span>
                    </li>
                  </ul>
                </div>

              </div>
            </div>
          </div>
        </div>
</c:forEach>
        <!--/ 商品陳列卡片顯示 /-->
        
<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->
      </div>
<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->

      <!--頁碼-->
    <%@ include file="page2.file" %>
       <!--頁碼-->

    </div>
  </section>
<jsp:include page="/frontend/footer.jsp" />
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>
 
</body>
</html>
