<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>

<%
PtpService ptpSvc =new PtpService();
PtpVO ptpVO = ptpSvc.getOnePtp("PTP000002");
String pacno = ptpVO.getPacno();

PacService pacSvc = new PacService();
PacVO pacVO = pacSvc.getOnePac(pacno);

List<PacVO> list = pacSvc.getAll();
pageContext.setAttribute("list",list);

List<PtpVO> listptp = ptpSvc.getAll();
pageContext.setAttribute("listptp", listptp);
%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
  <meta charset="utf-8">
  <title><%=pacVO.getPacname()%></title>
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
  .carousel-item-b img{
      max-width:600px;
      height:700px; 
      
  }
</style>
  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>

  <div class="click-closed"></div>
  <!--/ Form Search Star /-->
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
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a class="navbar-brand text-brand" href="index.html">旅遊浪潮<span class="color-b">TravelWave</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="property-grid.html">Property</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="blog-grid.html">Blog</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              Pages
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item active" href="property-single.html">Property Single</a>
              <a class="dropdown-item" href="blog-single.html">Blog Single</a>
              <a class="dropdown-item" href="agents-grid.html">Agents Grid</a>
              <a class="dropdown-item" href="agent-single.html">Agent Single</a>
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
            <h1 class="title-single"><%=pacVO.getPacname()%></h1>
            <span class="color-text-a"><%=pacVO.getPacno() %></span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="index.html">Home</a>
              </li>
              <li class="breadcrumb-item">
                <a href="property-grid.html">Properties</a>
              </li>
            </ol>
          </nav>
           <a href="join.jsp" class="link-a">
                    <span class="ion-ios-arrow-forward">
                      <img src="images/join.jpg" alt="">
                    </span>
                  </a>
        </div>
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
            <div class="carousel-item-c">
              <img src="<%=request.getContextPath()%>/DBGifReader?pacno=<%=pacVO.getPacno()%>&photo=1" alt="" class="img-fluid">
            </div>
            <div class="carousel-item-c">
              <img src="<%=request.getContextPath()%>/DBGifReader?pacno=<%=pacVO.getPacno()%>&photo=2" alt="" class="img-fluid">
            </div>
          </div>
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-4">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                  <div class="card-box-ico">
                    <span class="ion-money">NT</span>
                  </div>
                  <div class="card-title-c align-self-center">
                    <h2 class="title-c"><%=pacVO.getPacprice()%></h2>
                  </div>
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">出發資訊</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>出發日期:</strong>
                      <span><fmt:formatDate value="<%=ptpVO.getPtpstart() %>" pattern="yyyy-MM-dd HH:mm"/></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>抵達日期:</strong>
                      <span><%=ptpVO.getPtpend() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>旅遊國家:</strong>
                      <span><%=pacVO.getPaccountry()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>旅遊城市:</strong>
                      <span><%=pacVO.getPaccity()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>最少成行:</strong>
                      <span><%=ptpVO.getPtpminmen()%> 人
                      </span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>可報名人數:</strong>
                      <span><%=ptpVO.getPtpvacancy()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>訂金:</strong>
                      <span><%=pacVO.getPacdeposit()%></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>備註:</strong>
                      <span>   </span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">每日行程</h3>
                  </div>
                </div>
              </div>
              
<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" style="text-align:center; id="headingOne" >
      <h2 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <h4>
            <img src="images/day1.png" alt="">&nbsp;&nbsp;&nbsp;
          </h4>
          <b>
            高雄小港機場/成田機場－成田AEON購物商城(或唐吉訶德購物商場成田店)<br>
            －成田(或高雄小港機場/成田機場－飯店周邊商場散策－東京(或千葉、橫濱)<br>
          </b> 
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        
                <span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">今日搭乘豪華客機飛往日本第一大都市～東京成田空港。<span lang="EN-US"><br>
</span></span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:mediumblue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【東京】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">東京這座國際大都市，近來成為亞洲流行文化的發源地。在很多亞洲年輕人的眼裡，東京是一座充滿活力和時代感的城市，它總是走在流行的最前線。沿著不同路線來看東京，你會發現它的許多不同風貌，街頭不斷創新造型的年輕人、一棟接一棟蓋起來的<span lang="EN-US">shopping mall</span>、一家又一家風格各異的店，會讓你讚嘆不已。熱鬧之餘，東京也有文藝的、美麗的、古樸的各種風貌，想看遍各種東京還真不容易呢！</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-TW;
mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:mediumblue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【成田<span lang="EN-US">AEON
MALL JUSCO</span>購物廣場】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">超大型綜合購物娛樂商城，各種吃喝玩樂設施與商電應有盡有。包括大型<span lang="EN-US">JUSCO</span>超市、日本品牌服飾店、鞋店、日用品雜貨店、唱片行、書店，台灣人熟悉的無印良品、松本清藥妝店，各式餐廳、咖啡、點心店…等這裡皆有，在此可輕鬆舒適的享受<span lang="EN-US">SHOPPING</span>樂趣。</span><b><span style="font-size:10.5pt;
font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;color:mediumblue;
mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-TW;
mso-bidi-language:AR-SA">或【唐吉訶德購物商場】</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">在日本全國擁有<span lang="EN-US">150</span>家以上的店鋪，每家店鋪裏彙聚了食品、酒類、禮品、家具、名牌、電器等<span lang="EN-US">4</span>萬餘種商品，可充分享受購物的樂趣。</span>

<div>
<table style="border:8px #FFD382 groove;" cellpadding="10" border='0'>
<tr><td><img src="img/Package/s001.png" alt=""></td><td>千葉CANDEO、千葉 SUNROUTE、幕張APA、幕張NEW OTANI、橫濱ROSE、橫濱佐木町華盛頓、新橫濱王子、太陽城王子或同級</td></tr>
<tr><td rowspan="2"><img src="img/Package/s002.png" alt=""></td><td>午餐 :  機上精緻餐食</td></tr>
<tr><td>晚餐 : 自助餐或日式涮涮鍋或日式燒烤自助餐</td></tr>
</table>
</div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" style="text-align:center; id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <h4><img src="images/day2.png" alt="">&nbsp;&nbsp;&nbsp;<span class="badge badge-secondary">日本櫻花盛開</span></h4>
          <b>
            小田原城跡公園(賞櫻百選3月下旬~4月上旬，江戶歷史名城上天守閣)<br>
            －箱根大涌谷(火山地區特有地熱奇景,贈送黑蛋/人)～蘆之湖海盜船(桃源台）<br>
            －箱根神社(箱根守護神)→御殿場(或山中湖溫泉.石和.甲府)
          </b>
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
       <b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【小田原城跡公園】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">最早的小田原城修建於<span lang="EN-US">1416</span>年，並於<span lang="EN-US">1960</span>年重新修復其中的天手閣，作為歷史資料的陳列館對外開放。登上最高層，可俯瞰市內的全景風貌，以及周圍地區的美麗景色。小田原是以<span lang="EN-US">15</span>世紀治理這塊地方的武將北條氏居住的城堡基點發展起來，在<span lang="EN-US"> 17 </span>世紀到<span lang="EN-US"> 19</span>世紀的德川時代，作當時連接江戶（現在的東京）和京都的大動脈─東海道上的驛站，進一步發展擴大。園內遍值梅花樹及櫻花樹，是賞梅及賞櫻的名勝景點，公園內<span lang="EN-US">350</span>棵的染井吉櫻盛開時所營造出的優雅美景，使此公園被挑選為櫻花名所百選。<span lang="EN-US">11</span>月的菊展亦是小田原城址公園的重頭戲，由大批菊花愛好者精心栽培出又美又大又多色彩的菊花，聯合集結於此展出相當有看頭。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-TW;
mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【箱根大涌谷】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">大地獄的古老火山口『大涌谷』，峽谷及地面裂縫有濃厚而熱的硫磺蒸氣冒出，煙霧裊裊的噴氣，陣陣的硫磺味，為火山地區特有景觀</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:firebrick;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA">。<span lang="EN-US">(</span>※若遇大涌谷店家休館無法購得黑蛋則取消，敬請見諒<span lang="EN-US">!)</span></span><span lang="EN-US" style="font-size:10.5pt;font-family:
&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【箱根蘆之湖海盜船】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">面積<span lang="EN-US">6.9</span>平方公里，湖深<span lang="EN-US">40</span>公尺，環湖長度為<span lang="EN-US">17.5</span>公里，標高<span lang="EN-US">723.5</span>公尺，是於四千多年前因火山活動而形成的火山湖，春天湖畔有櫻花盛開，秋天滿山遍野楓紅片片，可由南岸的杉木街道眺望富士山，湖光山色有如風景畫，搭乘仿十七世紀歐洲戰艦造型的海盜船從桃源台到箱根町約<span lang="EN-US">30</span>分鐘。馳航於風光明媚的蘆之湖湖上，湖光山色盡收眼簾。在甲板上可以看到蘆之湖邊風光旖旎、人跡未至的森林和點綴於岸邊的箱根神社入口處巨大的紅色牌坊<span lang="EN-US">(</span>鳥居<span lang="EN-US">)</span>。蘆之湖四周群山環抱，山上林木蓊翠，湖畔綠草如茵，湖水碧澄清澈，湖面輕煙瀰濛，這座名湖以反映富士山及箱根神社之倒影而聞名，配以湖畔的樹林，相得益彰。<span lang="EN-US"><br>
</span></span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【箱根神社】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">建於西元八世紀的神社，曾是著名的武士宗教信仰中心，在蘆之湖畔、神社口的路旁，遍植高聳的杉木。自古及被尊崇為關東總鎮守，為神德相當高的開運神明亦被信仰為祈求交通安全、成就心願、開運解厄之大社，位於元箱根站西北部，從觀光船上就可以看到湖邊密林的紅木正殿。據說，在<span lang="EN-US">757</span>年萬券商人把箱根山裡的三個神社合併起來創建了現在的箱根神社。神社內寶物殿收藏有萬券商人之木雕等重要文化財產。</span>
<div>
<table style="border:8px #FFD382 groove;" cellpadding="10" border='0'>
<tr><td><img src="img/Package/s001.png" alt=""></td><td>洞爺觀光、湖畔亭、華美、太陽宮殿、萬世閣或同級</td></tr>
<tr><td rowspan="2"><img src="img/Package/s002.png" alt=""></td><td>午餐 :  箱根風味料理或日式和食料理</td></tr>
<tr><td>晚餐 :溫泉會席料理</td></tr>
</table>
</div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" style="text-align:center; id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <h4><img src="images/day3.png" alt="">&nbsp;&nbsp;&nbsp;<span class="badge badge-secondary">日本經典水族館</span></h4>
          <b>國營昭和記念公園(櫻花百選，賞櫻期約3月下旬～4月中旬)<br>
            －上野公園(櫻花百選，賞櫻期約3月下旬～4月上旬)－免稅店<br>
            －台場DiverCity Tokyo Plaza購物廣場
          </b>
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
      <p class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
line-height:15.0pt;mso-pagination:widow-orphan"><b><span style="font-size:10.5pt;
font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:
0pt">【國營昭和紀念公園】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">為了紀念昭和天皇在位<span lang="EN-US">50</span>年所建造，占地面積<span lang="EN-US">180</span>公頃（約相當於<span lang="EN-US">39</span>個<span lang="EN-US">Tokyo Dome</span>）。可<span lang="EN-US">360</span>度欣賞四季的各種花卉，每年都會舉行花卉博覽會等各種各樣的活動，是首都圈規模最大的休閒場所。櫻花期染井吉野櫻、大島櫻、山櫻等<span lang="EN-US">31</span>品種 約<span lang="EN-US">1500</span>棵櫻花樹。秋天<span lang="EN-US">11</span>月中旬<span lang="EN-US">~12</span>月上旬可以欣賞銀杏和紅葉。</span><span lang="EN-US" style="font-size:
10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;mso-font-kerning:
0pt"><o:p></o:p></span></p>

<b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:blue;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA">【上野公園】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">首開花見風氣之先的上野公園，花見盛宴教人也瘋狂。漫步於櫻花隧道，自江戶時代開始即是賞花景點為日本最大的都市花園，據說是為了建造寬永寺護佑江戶城，而由開祖天海僧所種，自西元<span lang="EN-US">1624</span>年以來，園內從西鄉隆盛像至噴水庭園為著名的『櫻花隧道』，以染井吉野櫻為主的櫻樹多達<span lang="EN-US">1000</span>株，已成為日本賞櫻名所代表</span><span lang="EN-US" style="font-size:
10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;mso-font-kerning:
0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">【台場<span lang="EN-US">DiverCity
Tokyo Plaza</span>購物廣場】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">以「劇場型都市空間」的設計理念，為國內外顧客提供購物、休閒遊玩及舒適的空間，讓顧客感受驚奇和感動。<span lang="EN-US">2012</span>年<span lang="EN-US">4</span>月<span lang="EN-US">19</span>日全新開幕營業，位在台場著名地標富士電視台正後方，商場除了集結各種世界知名品牌、國內外的休閒品牌和充滿個性‧獨創性品牌等，各種對時裝潮流敏感的品牌以外，在購物之餘還能夠體驗各種大規模的娛樂設施、東京名店聚集的美食廣場，及盡享餐廳樓層的美食等，是富有多樣性和話題性的商業設施。<b><span lang="EN-US">(</span>※部分展覽館需要自費門票才能前往，詳情請上官方網站查詢<span lang="EN-US">)(</span>商場營業時間<span lang="EN-US">10:00~21:00</span>，餐廳<span lang="EN-US">11:00~23:00)</span></b></span>
<div>
<table style="border:8px #FFD382 groove;" cellpadding="10" border='0'>
<tr><td><img src="img/Package/s001.png" alt=""></td><td>池袋太陽城王子(標間) 、幕張 SPRINGS、千葉 京成MIRAMARE、橫濱ROSE HOTEL、橫濱佐木町華盛頓 或同級</td></tr>
<tr><td rowspan="2"><img src="img/Package/s002.png" alt=""></td><td>午餐 :日式風味料理或日式燒烤自助餐</td></tr>
<tr><td>晚餐 :為方便逛街敬請自理</td></tr>
</table>
</div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" style="text-align:center; id="headingFour">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
         <h4><img src="images/day4.png" alt="">&nbsp;&nbsp;&nbsp;<span class="badge badge-secondary">東京迪士尼35周年慶</span></h4>
         <b> 全日東京．迪士尼樂園(洋溢夢想與魔法的王國)<br>或迪士尼海洋(充滿冒險與神秘的七大主題海港)<br>體驗日本捷運，安排搭乘電車來回，不怕塞車單程只需40分鐘）</b>
        </button>
      </h2>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
      <div class="card-body">
        <p class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
line-height:15.0pt;mso-pagination:widow-orphan"><span style="font-size:10.5pt;
font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;color:fuchsia;
mso-font-kerning:0pt">（Ａ或Ｂ二選一，導遊原則上帶領人數較多的一邊；較少的那邊請需自行入園遊玩，有不便之處，敬請見諒！另外方便遊玩，本日午餐、晚餐敬請自理。）</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:#FF00CC;mso-font-kerning:0pt">※請於最晚出發前<span lang="EN-US">5</span>天前確認是否參加及確認要玩<span lang="EN-US">"</span>海洋<span lang="EN-US">"</span>或<span lang="EN-US">"</span>陸地<span lang="EN-US">"</span>，若未在時間內告知視同自動放棄不退費，敬請見諒！</span></b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:blue;mso-font-kerning:0pt">【東京</span></b><b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:fuchsia;mso-font-kerning:0pt"><a href="http://www.tokyodisneyresort.co.jp/tc/" target="_blank"><span lang="EN-US" style="color: blue; text-decoration-line: none;"><span lang="EN-US">迪士尼樂園</span></span></a></span></b><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:blue;mso-font-kerning:0pt">】：</span></b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">佔地<span lang="EN-US">25</span>萬坪的迪士尼樂園為大人與小孩夢幻中的天堂，在此您可與白雪公主、米老鼠、唐老鴨一同遨遊童話世界、明日世界、魅惑世界、宇宙世界等。有灰姑娘的城堡、海盜船及非洲叢林探險、巨雷山、鬼屋、小小世界、太空山、魔法師的王國等老少咸宜的娛樂設施。午後時分，華麗的花車以及各個耳熟能詳的卡通人物展開街頭大匯演，置身其中，讓您重拾童年的歡樂並帶給您甜美的回憶。晚上可觀賞迪士尼夜間千變萬化的魅力：遊行或煙火雷射表演。到迪士尼如果不停留到夜間，將無法感受到迪士尼千變萬化的另一種魅力！</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:fuchsia;mso-font-kerning:0pt"><br>
</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:blue;mso-font-kerning:0pt">◎怪獸電力公司之迷藏巡遊車：</span><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">迪士尼與皮克斯聯合推出的動畫電影怪獸電力公司的場景及卡通人物，即將加入東京迪士尼樂園！以續集方式延續～毛怪蘇利文和大眼仔麥克為了博得阿布的歡笑，決定和她一起玩捉迷藏。不料，意外聽到這項計劃的怪獸藍道繼而設下各種陷阱，快來搭乘嶄新的遊樂設施《迷藏巡遊車》一同尋找藏在怪獸城市裡的居民吧<span lang="EN-US">!&nbsp;</span></span><span lang="EN-US" style="font-size:10.5pt;
font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;mso-font-kerning:0pt"><br>
</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:blue;mso-font-kerning:0pt">◎巴斯光年星際歷險：</span><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">以玩具總動員的巴斯光年為主角，拿起雷射槍加入太空騎警一起打敗萬惡的札克大王吧！</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt"><br>
</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:blue;mso-font-kerning:0pt">◎加勒比海盜體驗記：</span><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">遊客搭乘上木船，穿越時空進入<span lang="EN-US">16~18</span>世紀的加勒比海中，滿是海盜猖厥的世界。航向充滿驚奇的海洋，傑克船長和一群充滿個性的海盜正等著您來探險。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt"><br>
</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:blue;mso-font-kerning:0pt">◎太空山體驗記：</span><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">從開園以來人氣就一直居高不下的雲宵飛車，遊客搭上充滿藍色金屬光澤的最新型太空梭，一口氣衝出大氣層朝著太空旅行出發。太空梭以高達<span lang="EN-US">50 KM</span>的時速不斷穿梭於充滿流星與慧星的暗黑宇宙。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt"><br>
</span><b><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">【東京迪士尼樂園特別說明】</span></b><span lang="EN-US" style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;"><br>
</span><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">★夜間煙火秀：晚間<span lang="EN-US">20:30</span>施放。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:fuchsia;mso-font-kerning:0pt"><br>
</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:red;mso-font-kerning:0pt">1</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:red;mso-font-kerning:0pt">：每年的<span lang="EN-US">7.8</span>月及<span lang="EN-US">1.2</span>月為固定不施放夜間煙火的期間。</span><span lang="EN-US" style="font-size:
10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;color:fuchsia;
mso-font-kerning:0pt"><br>
</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:red;mso-font-kerning:0pt">2</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:red;mso-font-kerning:0pt">：若當日風速太強或下雨等因素，也有可能取消當日之夜間煙火活動。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:fuchsia;mso-font-kerning:0pt"><br>
</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:red;mso-font-kerning:0pt">3</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:red;mso-font-kerning:0pt">：遊行表演仍可能會受風雨大小的影響而取消演出，需以園區當日之公告為準。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:fuchsia;mso-font-kerning:0pt"><br>
</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:red;mso-font-kerning:0pt">4</span><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:red;mso-font-kerning:0pt">：每月的行事曆或許會有異動，並不是每天都會舉行。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:fuchsia;mso-font-kerning:0pt"><br>
</span><span style="font-size: 10.5pt; font-family: 微軟正黑體, sans-serif;">★迪士尼樂園與迪士尼海洋樂園，每天開園、關園的時間不一定，需以迪士尼官網上之行事曆公告為準。<span lang="EN-US"><br>
</span>★園區營運時間、娛樂表演內容、特別活動的舉辦日期，均可能有所調整變更，需以迪士尼官網上之行事曆公告為準。</span><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>

<b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA">特別注意：</span></b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA"><br>
<b>1.</b></span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">迪士尼規定一日券與兩日券，當天不能跨越相通參觀兩個樂園，如果一天內想遊玩兩個樂園敬請各位貴賓自費購買另一個樂園的門票。</span></b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA"><br>
<b>2.</b></span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">今日交通視情況專車前往或搭乘地鐵前往。</span></b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA"><br>
<b>3.</b></span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">本日若不前往迪士尼，每人可退費<span lang="EN-US">NT$1000(</span>大人<span lang="EN-US">) 700(</span>小孩<span lang="EN-US">)</span>，並請於出團前<span lang="EN-US">7</span>日不含假日告知，未滿<span lang="EN-US">4</span>歲之小孩免票不另外退費。</span></b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">※請於出發前<span lang="EN-US">3</span>個工作天<span lang="EN-US">(</span>不含例假日及周未<span lang="EN-US">)</span>告知是否前住<span lang="EN-US">,</span>及選擇海洋或陸地</span></b><span lang="EN-US" style="font-size:10.5pt;
font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:新細明體;color:purple;
mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:ZH-TW;
mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">如不前往退費由團体出發前團費中扣除<span lang="EN-US">,</span>當地不予退費<span lang="EN-US">(</span>敬請見諒<span lang="EN-US">)</span></span></b><span lang="EN-US" style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;mso-bidi-font-family:
新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:EN-US;mso-fareast-language:
ZH-TW;mso-bidi-language:AR-SA"><br>
</span><b><span style="font-size:10.5pt;font-family:&quot;微軟正黑體&quot;,sans-serif;
mso-bidi-font-family:新細明體;color:purple;mso-font-kerning:0pt;mso-ansi-language:
EN-US;mso-fareast-language:ZH-TW;mso-bidi-language:AR-SA">如欲前往請確認要海洋或陸地<span lang="EN-US">,</span>如遇當地變更改票差額請自行付費敬請見諒！</span></b>
<div>
<table style="border:8px #FFD382 groove;" cellpadding="10" border='0'>
<tr><td><img src="img/Package/s001.png" alt=""></td><td>湯之川觀光祥苑、湯之濱、函館北斗、函館市區或同級</td></tr>
<tr><td rowspan="2"><img src="img/Package/s002.png" alt=""></td><td>午餐 :  1000元餐券</td></tr>
<tr><td>晚餐 :為方便遊玩，敬請自理</td></tr>
</table>
</div>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header"  style="text-align:center; id="headingFive">
      <h2 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" 
        data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
          <h4><img src="images/day5.png" alt="">&nbsp;&nbsp;&nbsp;<span class="badge badge-secondary">歷史懷舊</span></h4>
          <b>飯店－成田機場－高雄小港機場 (若遇晚班機白天自由活動、中餐自理)</b>
        </button>
      </h2>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
      <div class="card-body">
        由專車前往機場，在導遊安排辦理登機手續後，帶著依依不捨的心情，返回溫暖的家，為這次美好的旅程，畫下休止符！！
<div>
<table style="border:8px #FFD382 groove;" cellpadding="10" border='0'>
<tr><td><img src="img/Package/s001.png" alt=""></td><td>可愛的家</td></tr>
<tr><td rowspan="2"><img src="img/Package/s002.png" alt=""></td><td>午餐 :  自理或機上精緻餐食</td></tr>
<tr><td>晚餐 :自理或機上精緻餐食 </td></tr>
</table>
</div>


      </div>
    </div>
  </div>
</div>



              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">行程注意事項</h3>
                  </div>
                </div>
              </div>
              <div class="amenities-list color-text-a">
              <%=pacVO.getPacremark()%>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-10 offset-md-1">
          <ul class="nav nav-pills-a nav-pills mb-3 section-t3" id="pills-tab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" id="pills-video-tab" data-toggle="pill" href="#pills-video" role="tab"
                aria-controls="pills-video" aria-selected="true">返回首頁</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="pills-plans-tab" data-toggle="pill" href="#pills-plans" role="tab" aria-controls="pills-plans"
                aria-selected="false">DiG! JAPAN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="pills-map-tab" data-toggle="pill" href="#map003" role="tab" aria-controls="pills-map"
                aria-selected="false">地理位置</a>
            </li>
          </ul>
          <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-video" role="tabpanel" aria-labelledby="pills-video-tab">  
<!--               <video autoplay loop controls> -->
<!--               <source src="Disney.mp4" type="video/mp4"> -->
<!--               </video> -->
				 <a href="http://www.google.com" class="link-a">
                    <img src="images/bg003.jpg" alt="">
                 </a>
            </div>
            <div class="tab-pane fade" id="pills-plans" role="tabpanel" aria-labelledby="pills-plans-tab">
              <a href="https://digjapan.travel/zh_TW/" class="link-a">
                    <img src="images/s10.JPG" alt="">
                 </a>
            </div>
            <div class="tab-pane fade" id="map003" role="tabpanel" aria-labelledby="pills-map-tab">
             <img src="images/s08.jpg" alt=""> 
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="row section-t3">
            <div class="col-sm-12">
              <div class="title-box-d">
                <h3 class="title-d">猜你喜歡</h3>  
              </div>
            </div>
          </div>
   <section class="section-property section-t8">
   <c:forEach var="pacVO" items="${list}">
   <c:choose>
   <c:when test="${pacVO.pacstatus == 0}">
      <div id="property-carousel" class="owl-carousel owl-theme">
        <div class="carousel-item-b">
          <div class="card-box-a card-shadow">
            <div class="img-box-a">
              <img src="<%=request.getContextPath()%>/backend/pac/pac?pacno=${pacVO.pacno}" alt="" class="img-a img-fluid">
            </div>
            </div>
            <div class="card-overlay">
              <div class="card-overlay-a-content">
                <div class="card-header-a">
                  <h2 class="card-title-a">
                    <a href="#">${pacVO.pacname}
                    </a> 
                  </h2>
                </div>
                <div class="card-body-a">
                  <div class="price-box d-flex">
                    <span class="price-a">$NT| ${pacVO.pacprice}起</span>
                  </div>
                  <a href="#listOnePac.jsp?pacno=${pacVO.pacno}" class="link-a">觀看詳情
                    <span class="ion-ios-arrow-forward"></span>
                  </a>
                </div>
                <div class="card-footer-a">
                  <ul class="card-info d-flex justify-content-around">
                    <li>
                      <h4 class="card-info-title">出發日期</h4>
                      <span>剩餘空位
                      </span>
                    </li>
                    <c:forEach var="ptpVO" items="${listptp}">
                    <li>
                      <h4 class="card-info-title">${ptpVO.ptpstart}</h4>
                      <span>${ptpVO.ptpvacancy}</span>
                    </li>
                    <li>
                      <h4 class="card-info-title">${ptpVO.ptpstart}</h4>
                      <span>${ptpVO.ptpvacancy}</span>
                    </li>
                    <li>
                      <h4 class="card-info-title">${ptpVO.ptpstart}</h4>
                      <span>${ptpVO.ptpvacancy}</span>
                    </li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
  </c:when>
  </c:choose>
  </c:forEach>
   
  </section>
  <!--/ Property Single End /-->

  <!--/ footer Star /-->
  <section class="section-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-4">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">旅遊浪潮</h3>
            </div>
            <div class="w-body-a">
              <p class="w-text-a color-text-a">
                Enim minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip exea commodo consequat duis
                sed aute irure.
              </p>
            </div>
            <div class="w-footer-a">
              <ul class="list-unstyled">
                <li class="color-a">
                  <span class="color-text-a">Phone .</span> contact@example.com</li>
                <li class="color-a">
                  <span class="color-text-a">Email .</span> +54 356 945234</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-4 section-md-t3">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">The Company</h3>
            </div>
            <div class="w-body-a">
              <div class="w-body-a">
                <ul class="list-unstyled">
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Site Map</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Legal</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Agent Admin</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Careers</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Affiliate</a>
                  </li>
                  <li class="item-list-a">
                    <i class="fa fa-angle-right"></i> <a href="#">Privacy Policy</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-4 section-md-t3">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">International sites</h3>
            </div>
            <div class="w-body-a">
              <ul class="list-unstyled">
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Venezuela</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">China</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Hong Kong</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Argentina</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Singapore</a>
                </li>
                <li class="item-list-a">
                  <i class="fa fa-angle-right"></i> <a href="#">Philippines</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
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
              <span class="color-a">TravelWave</span> All Rights Reserved.
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
