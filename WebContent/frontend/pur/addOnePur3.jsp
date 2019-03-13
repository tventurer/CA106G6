<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%@ page import="com.acr.model.*"%>
<%
	String purid = "PUR000001";
	pageContext.setAttribute("purid",purid);
	
	Integer porsum = 30;
	pageContext.setAttribute("porsum",porsum);
	
	PurService purSvc = new PurService();
	PurVO purVO = purSvc.getOnePur(purid);
	Integer purpricing = purVO.getPurpricing();
	pageContext.setAttribute("purpricing",purpricing);
    
	AcrService acrSvc = new AcrService();
	List<AcrVO> Acrlist = acrSvc.getMemAll("MEM000001");
	pageContext.setAttribute("Acrlist",Acrlist);
	
    String[] pursort = {"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
    request.setAttribute("pursort", pursort);
    
%>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
  <meta charset="utf-8">
  <title>填寫訂單資料</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/style/f/img/favicon.png" rel="icon">
  <link href="<%=request.getContextPath()%>/style/f/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<%=request.getContextPath()%>/style/f/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<%=request.getContextPath()%>/style/f/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/animate/animate.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<%=request.getContextPath()%>/style/f/css/style.css" rel="stylesheet">


  <style>
  .img-fluid{
  height:250px;
  }
</style>
  
</head>
 <body>

  <div class="click-closed"></div>
  <!--/ Form Search Star 搜尋欄位的多重搜尋/-->
  <div class="box-collapse">
    <div class="title-box-d">
      <h3 class="title-d">Search Property</h3>
    </div>
    <span class="close-box-collapse right-boxed ion-ios-close"></span>
    <div class="box-collapse-wrap form">
      <form class="form-a">
        <div class="row">
          <div class="col-md-12 mb-2">
            <div class="form-group">
              <label for="Type">Keyword</label>
              <input type="text" class="form-control form-control-lg form-control-a" placeholder="Keyword">
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="Type">Type</label>
              <select class="form-control form-control-lg form-control-a" id="Type">
                <option>All Type</option>
                <option>For Rent</option>
                <option>For Sale</option>
                <option>Open House</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="city">City</label>
              <select class="form-control form-control-lg form-control-a" id="city">
                <option>All City</option>
                <option>Alabama</option>
                <option>Arizona</option>
                <option>California</option>
                <option>Colorado</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="bedrooms">Bedrooms</label>
              <select class="form-control form-control-lg form-control-a" id="bedrooms">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="garages">Garages</label>
              <select class="form-control form-control-lg form-control-a" id="garages">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="bathrooms">Bathrooms</label>
              <select class="form-control form-control-lg form-control-a" id="bathrooms">
                <option>Any</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
              </select>
            </div>
          </div>
          <div class="col-md-6 mb-2">
            <div class="form-group">
              <label for="price">Min Price</label>
              <select class="form-control form-control-lg form-control-a" id="price">
                <option>Unlimite</option>
                <option>$50,000</option>
                <option>$100,000</option>
                <option>$150,000</option>
                <option>$200,000</option>
              </select>
            </div>
          </div>
          <div class="col-md-12">
            <button type="submit" class="btn btn-b">Search Property</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!--/ Form Search End /-->

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <!--/ 此處有用不能刪除 上面縮起來的三條橫線/-->
        <span></span>
        <span></span>
        <span></span>
        <!--/ 此處有用不能刪除/-->
      </button>
      <a class="navbar-brand text-brand" href="index.html">T-<span class="color-b">Venturer</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">首頁</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">關於</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="purIndex.jsp">代購商品</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	會員
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/acr/addOneAcr.jsp">儲值</a>
              <a class="dropdown-item" href="blog-single.html">訂單</a>
              <a class="dropdown-item active" href="agents-grid.html">新增代購商品</a>
              <a class="dropdown-item" href="agent-single.html">我的代購商品</a>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
        </ul>
      </div>
      <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    </div>
  </nav>
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">新增代購商品</h1>
            <span class="color-text-a">資料填妥，即可上架 ~ 祝您交易愉快 !</span>
          </div>
        </div>

        <!--/ 此處可放搜尋類別路徑 /-->
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="#">首頁</a>
              </li>
              <li class="breadcrumb-item" aria-current="page">
              <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">代購商品</a>
              </li>
              <li class="breadcrumb-item active">
                <a>新增代購商品</a>
              </li>
            </ol>
          </nav>
        </div>

      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
<form class="form-a" METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por">
  <section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-5">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                 <img width="400px" height="100%" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=<%=purVO.getPurid() %>" style="display:none" alt="">
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
                      <strong>商品圖片：</strong>
                      <span><input type="file" name="purpic" id="purpic" size="45"
			 value="<%= (purVO==null)? "" : purVO.getPurpic()%>" /></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>下架時間：</strong>
                      <span><input type="text" name="purobtained" id="f_date1" type="text"></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>預計出貨時間：</strong>
                      <span><input type="text" name="purextime" id="f_date2" type="text"></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>提供收據：</strong>
                      <strong><%String purreceipt[]={"不提供","提供"};
							for(int i = 0; i <purreceipt.length; i++){
									if(i==0){
										out.print("<input type='radio' name='purreceipt' value='" + i + "'checked>"+ purreceipt[i]);
								}else{
										out.print("<input type='radio' name='purreceipt' value='" + i + "'>"+ purreceipt[i]);
								}
							}%></strong>
                    </li><li class="d-flex justify-content-between">
                      <strong>評價限制：</strong>
                      <strong><select size="1" name="purlimit">
						<%
							for(int i = 1; i < 11; i++){
								out.print("<option value='" + i + "'>"+i+ "</option>");
								}
						%>
					</select></strong>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 section-md-t4">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">商品內容</h4>
                  </div>
                </div>
              </div>
              <div class="property-description">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="Type">代購商品名稱</label>
              <input name="pormemname" type="text" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="Type">商品描述</label>
              <input type="text" name="poraddress" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">商品類別</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">參考網址</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">購買國家</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">收貨國家</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">參考售價</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">此商品定價</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">商品數量</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="city">評價限制</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          
          <div class="col-md-12 ">
         <c:forEach var="myacr" items="${Acrlist}" varStatus="s">
		 <c:choose>
		 <c:when test="${s.last}">
		 <input type="hidden" name="acrtotal" value="${myacr.acrtotal}">
		 </c:when>
		 </c:choose>
		 </c:forEach> 
		 	<input type="hidden" name="purid" value="${purid}">
          	<input type="hidden" name="memno" value="MEM000001">
          	<input type="hidden" name="porsum" value="${porsum}">
          	<input type="hidden" name="porprice" value="${purpricing*porsum}">
			<input type="hidden" name="porstatus" value="0">
			<input type="hidden" name="porlogistics" value="0">
			<input type="hidden" name="action" value="insert">
            <button type="submit" class="btn btn-b">確認送出</button>
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
      </div>
    </div>
  </section>
  </form>
  <br>

<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->
      </div>
<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->


    </div>
  </section>
  <!--/ Property Grid End /-->

  <!--/ footer Star /-->
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
              <span class="color-a">T-Venturer</span> All Rights Reserved.
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
  <!-- JavaScript Libraries -->
  <script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/jquery/jquery-migrate.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/popper/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/easing/easing.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath()%>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="<%=request.getContextPath()%>/style/f/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%=request.getContextPath()%>/style/f/js/main.js"></script>

</body>
</html>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Timestamp purobtained = null;
  try {
	  purobtained = purVO.getPurobtained();
   } catch (Exception e) {
	   purobtained = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>

<% 
   java.sql.Timestamp purextime = null;
  try {
	   purextime = purVO.getPurextime();
   } catch (Exception e) {
	   purextime = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>


<script src="<%=request.getContextPath()%>/laydate/laydate.js"></script>
<script type="text/javascript">
lay('#version').html('-v'+ laydate.v);

//執行laydate的日期時間選擇器
laydate.render({
elem: '#f_date1' //指定該input的ID
,timepicker:true
,type: 'datetime'
,value: '<%=purobtained%>'

});
</script>
<script>

$("#purpic").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#purpicimg").attr('src', e.target.result);
       $("#purpicimg").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}

      
        
</script>
