<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>
<%@ page import="com.pcd.model.*"%>

<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>
<jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService"/>

<%
String ptpno = request.getParameter("ptpno");
PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
String pacno = ptpVO.getPacno();
PacVO pacVO = pacSvc.getOnePac(pacno);
PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");
pageContext.setAttribute("ptpVO", ptpVO);
pageContext.setAttribute("pacVO", pacVO);
pageContext.setAttribute("pcdVO", pcdVO);

%>

<!DOCTYPE html>

<html>
<head>
  <title>旅遊浪潮-<%=pacVO.getPacname()%></title>
</head>
<body>
<jsp:include page="/frontend/navbar.jsp"/>

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
          <img src="images/bar1.png" alt="">
          </span><br>
  <table>         	
  		<tr>
  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd?ptpno=<%=ptpVO.getPtpno()%>" name="form1">
            <td class="group_Preferences_Content">
            	◎ 會員編號：<input type="TEXT" name="memno" size="30" 
			value="<%= (pcdVO == null)? "MEM000001" : pcdVO.getMemno()%>"><br>
               
			    ◎ 旅遊編號 ：<span style="color: #036eb7">
                       <%=ptpVO.getPtpno()%>
                       </span><br>
                     
                                        ◎ 出發日期：
                                        <%=ptpVO.getPtpstart()%>(<font color='red'>日</font>)
                                        -
                                        <%=ptpVO.getPtpend()%>(四)<br />
           	     ◎ 團體費用：    <span><b><%=pacVO.getPacprice()%></b>  </span><br />
                                        ◎ 每人訂金：<span style="color: #F00;">&nbsp;&nbsp;<%=pacVO.getPacdeposit()%></span><br />
            </td>
            </tr>
             <br><br><HR color="#00FF00" size="25" width="85%"  align="left">
                                    <td class="group_Preferences_Content">
                                        1. 輸入旅客人數時，請先參考可售團位；報名人數：大人＋小孩最多為9人。<br />
                                        2. 團體以經濟艙報價，如果本團提供其他艙等選擇，請注意其他艙等之加價金額。<br />
                                        3. 報名後團位如經確認，請於3天內繳付訂金，如果逾期未繳，您的團位將會被自動取消！<br />
                                    </td>
     </table>                         
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
                                    <td height="20px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="894px" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <span class="group_travelcontract_01"><h3><b>報名須知 ：</b></h3> </span>
                                                    <br />
                                                    <span class="group_travelcontract_02">１. 所有行程皆需隨團進出，參團最低人數依您訂購的行程而有所不同。<br />
                                                        ２. 一旦報名之後，本公司將有業務專員與您聯繫並洽談相關事宜及收取訂金。報名刷卡繳交訂金或團費後，國外/國內 旅！遊定型化契約書即 產生效力，若變更或取消行程，依契約書內容辦理。<br />
                                                        ３. 若因匯率調整或因成本調漲，本公司於收到訂金或團費前保留調整團費之權益。<br />
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20px" style="border-bottom: 1px dotted #888888;">
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20px">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="group_travelcontract_03" align="center">
                                    <input id="C_Note1_CheckBox1" type="checkbox" ><b>我接受--我已閱讀過完整的合約條款，並接受所有規定事項</b>                                    </td>
                                </tr>
                              
                                                          
           </table>
            <br> <br> <br> <br>
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
		<input type="hidden" name="action" value="join4">
		<input type="submit" value="送出新增">
		</FORM>
		
		
	
     </table>
       
</body>
</html>