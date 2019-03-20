<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>
<%@ page import="com.pcd.model.*"%>

<%
PtpService ptpSvc =new PtpService();
PtpVO ptpVO = ptpSvc.getOnePtp("PTP000001");
String pacno = ptpVO.getPacno();

PacService pacSvc = new PacService();
PacVO pacVO = pacSvc.getOnePac(pacno);
PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");

pageContext.setAttribute("pacVO", pacVO);
pageContext.setAttribute("ptpVO", ptpVO);
pageContext.setAttribute("pcdVO", pcdVO);
%>

<!DOCTYPE html>

<html lang="zh-TW">
<head>
  <meta charset="utf-8">
  <title>旅遊浪潮-<%=pacVO.getPacname()%></title>
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
  
  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>
<body>
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
        </div>
      </div>
    </div>
  </section>
  
  
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" name="form1"> 
    <div class="container">
     <div class="row">
     <div class="col-md-12 col-lg-12">
          <div class="title-single-box">
          <span>
          <img src="images/bar1.png" alt="">
          </span><br>
           	<tr>
            <td class="group_Preferences_Content">
            	◎ 會員編號：<input type="TEXT" name="memno" size="30" 
			value="<%= (pcdVO == null)? "MEM000001" : pcdVO.getMemno()%>"><br>
               
                                        ◎ 旅遊名稱：<%=pacVO.getPacname()%><br>
                                        
			    ◎ 旅遊編號 ：<span style="color: #036eb7">
                       <input type="TEXT" name="ptpno" size="30" value="<%= (pcdVO==null)? "PTP000002" : pcdVO.getPtpno()%>" />
                       </span><br>
                                        ◎ 出發日期：
                                        <%=ptpVO.getPtpstart()%>(<font color='red'>日</font>)
                                        -
                                        <%=ptpVO.getPtpend()%>(四)<br />
                                        ◎ 每人訂金：<span style="color: #F00;"><%=pacVO.getPacdeposit()%></span><br />
            </td>
            </tr>
             <br><br><HR color="#00FF00" size="25" width="85%"  align="left">
                                    <td class="group_Preferences_Content">
                                        1. 輸入旅客人數時，請先參考可售團位；報名人數：大人＋小孩最多為9人。<br />
                                        2. 團體以經濟艙報價，如果本團提供其他艙等選擇，請注意其他艙等之加價金額。<br />
                                        3. 報名後團位如經確認，請於3天內繳付訂金，如果逾期未繳，您的團位將會被自動取消！<br />
                                    </td>
                                </tr>
                                </div> 
    							</div>
    							</div> 
            <br>
            
             <!--03 旅遊契約-->
        
	
    <div class="group_PreferencesTitle">
        
        <div><h3><b> 旅遊契約  </b></h3><span style="color: #666;">請詳閱</span></div>
    </div>
    <!--內容-->
    <table width="1100px" border="0" cellpadding="0" cellspacing="0">
        <tr>
           
            <td valign="top">
                <table width="946px" height="20px" border="0" cellpadding="0" cellspacing="0" style="border-right: 1px solid #dbdcdc;
                    border-left: 1px solid #dbdcdc;">
                    <tr>
                        
                        <td valign="top">
                            <table width="894px" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="10px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="group_Preferences_Content" style="border: 1px solid #888888; height: 400px;">
                                        <iframe src="http://www.lifetour.com.tw/oversea/Contract.html" scrolling="yes" height="400px" width="880px" frameborder="0">
                                        </iframe>
                                        
                                        </div>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td><br>
                                        <table width="894px" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <span class="group_travelcontract_01"><h3><b>報名須知 ：</b></h3> </span>
                                                    <span class="group_travelcontract_02">
                                                   	 １. 所有行程皆需隨團進出，參團最低人數依您訂購的行程而有所不同。<br />
                                                       	 ２. 一旦報名之後，本公司將有業務專員與您聯繫並洽談相關事宜及收取訂金。報名刷卡繳交訂金或團費後，國外/國內 旅！遊定型化契約書即 產生效力，若變更或取消行程，依契約書內容辦理。<br />
                                                        	３. 若因匯率調整或因成本調漲，本公司於收到訂金或團費前保留調整團費之權益。<br />
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20px" style="border-bottom: 1px dotted #666666;">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="group_travelcontract_03" align="center">
                                    <input id="C_Note1_CheckBox1" type="checkbox" }"><b>我接受--我已閱讀過完整的合約條款，並接受所有規定事項</b>                                    </td>
                                </tr>
                              <br> <br> <br> <br>
         
		 
                                                          
           </table>
     </table>
      <span class="group_travelcontract_01"><h3><b>報名人數 ：</b></h3> </span>
			<select name="pcdtripmen">
　			<option value=1>1人</option>
　			<option value=2>2人</option>
　			<option value=3>3人</option>
　			<option value=4>4人</option>
			<option value=5>5人</option>
			<option value=6>6人</option>
			<option value=7>7人</option>
			<option value=8>8人</option>
			<option value=9>9人</option>
		    </select><br><br>
		    <input type="submit" value="下一步填寫資料">
       <input type="hidden" name="action" value="join4.jsp"> </FORM>
    
          
       
</body>
</html>