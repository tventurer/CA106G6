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
%>
<html>
<head>
  <meta charset="utf-8">
  <title>旅遊浪潮-<%=pacVO.getPacname()%></title>
</head>
<body bgcolor='white'>
<jsp:include page="/frontend/navbar.jsp"/>
<section class="section-property section-t8">

<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
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
  
  
  
    <div class="container">
     <div class="row">
     <div class="col-md-12 col-lg-12">
          <div class="title-single-box">
          <span>
          <img src="images/bar2.png" alt="">
          </span><br>
           	<tr>
            <td class="group_Preferences_Content">
            	◎ 會員編號：MEM0000001<br>
               
                                        ◎ 商品名稱：<%=pacVO.getPacname()%>
                                        <span style="color: #036eb7">
                                            <%=pacVO.getPacno()%></span><br />
                                        ◎ 出發日期：
                                        <%=ptpVO.getPtpstart()%>(<font color='red'>日</font>)
                                        -
                                        <%=ptpVO.getPtpend()%>(四)<br />
                            </td>
            </tr>
            <br>
             <!--03 旅遊契約-->
        
	
    <div class="group_PreferencesTitle">
        
        <div><h3><b> <span style="color: blue;">訂位聯絡人資訊  </b></h3></div>
    </div>
     <table width="970px" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="12px" style="background: url(images/gr_leftbk.png);" valign="top">
            </td>
            <td valign="top">
                <table width="946px" height="20px" border="0" cellpadding="0" cellspacing="0" style="border-right: 1px solid #dbdcdc;
                    border-left: 1px solid #dbdcdc;">
                    <tr>
                          <td valign="top">
                            <table width="894px" border="0" cellpadding="0" cellspacing="0">
                               
                                </tr>
                                <tr>
                                    <td class="group_Preferences_Content">
                                        <table width="894px" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <table width="894px" border="0" cellpadding="0" cellspacing="0" style="border: 1px solid #888888;">
                                                        <!--01-->
                                                        <tr>
                                                            <td>
                                                                <table width="894px" height="36px" border="0" cellpadding="0" cellspacing="0" style="border-bottom: 1px solid #888888;">
                                                                    <tr>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td style="border-right: 1px solid #888888;" class="group_Preferences_Content" width="94px">
                                                                            <img src="http://www.lifetour.com.tw/Common/images/fly_ticon_2.png" width="18" height="12" />
                                                                            姓名
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td class="group_Preferences_Content" width="370px">
                                                                            <input name="D_Oversea_FillinContact1$PAX_CNM" type="text" id="D_Oversea_FillinContact1_PAX_CNM" style="border-color:Silver;border-width:1px;border-style:Solid;width:100px;" />
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td width="100px">
                                                                            <input id="D_Oversea_FillinContact1_Check_Member" type="checkbox" name="D_Oversea_FillinContact1$Check_Member" onclick="Contact();" /><label for="D_Oversea_FillinContact1_Check_Member">同會員本人</label>
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <!--02-->
                                                        <tr>
                                                            <td>
                                                                <table width="894px" height="36px" border="0" cellpadding="0" cellspacing="0" style="border-bottom: 1px solid #888888;">
                                                                    <tr>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td style="border-right: 1px solid #888888;" class="group_Preferences_Content" width="94px">
                                                                            <img src="http://www.lifetour.com.tw/Common/images/fly_ticon_2.png" width="18" height="12" />
                                                                            連絡電話
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td class="group_Preferences_Content" width="183px">
                                                                            <input name="D_Oversea_FillinContact1$TEL_ZIP" type="text" id="D_Oversea_FillinContact1_TEL_ZIP" style="border-color:Silver;border-width:1px;border-style:Solid;width:40px;" />-<input name="D_Oversea_FillinContact1$TEL_NO" type="text" id="D_Oversea_FillinContact1_TEL_NO" style="border-color:Silver;border-width:1px;border-style:Solid;width:100px;" />
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td style="border-right: 1px solid #888888; border-left: 1px solid #888888; text-align: center"
                                                                            class="group_Preferences_Content" width="104px">
                                                                            <img src="http://www.lifetour.com.tw/Common/images/fly_ticon_2.png" width="18" height="12" />
                                                                            手機
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td class="group_Preferences_Content" width="181px">
                                                                            <input name="D_Oversea_FillinContact1$MOBILE" type="text" id="D_Oversea_FillinContact1_MOBILE" style="border-color:Silver;border-width:1px;border-style:Solid;width:100px;" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <!--03-->
                                                        <tr>
                                                            <td>
                                                                <table width="894px" height="36px" border="0" cellpadding="0" cellspacing="0" style="border-bottom: 1px solid #888888;">
                                                                    <tr>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td style="border-right: 1px solid #888888;" class="group_Preferences_Content" width="94px">
                                                                            <img src="http://www.lifetour.com.tw/Common/images/fly_ticon_2.png" width="18" height="12" />
                                                                            E-Mail
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                        <td class="group_Preferences_Content" width="480px">
                                                                            <input name="D_Oversea_FillinContact1$EMAIL" type="text" id="D_Oversea_FillinContact1_EMAIL" style="border-color:Silver;border-width:1px;border-style:Solid;width:240px;" />
                                                                        </td>
                                                                        <td width="10px">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

     
     
     
     </div>
     </div>  
    </div> 
          <br> <br> <br> <br>
          
       
</body>
</html>