<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>
<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService" />
<jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService" />
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />
<%
PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");
pageContext.setAttribute("pcdVO", pcdVO);
String memno=(String)session.getAttribute("memno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>訂單完成</title>
<style type="text/css">
.head{
	background-color:#5cadad;color:white;font-weight:bold;font-size:30px;
	text-align:center;padding:10px
}
.middle1{ 
 	text-align:center;padding:10px 
 } 
.bar3{
	text-align:center;padding:10px
}
.middle2{
	background-color:#5cadad;color:white;font-weight:bold;font-size:30px;
	text-align:center;padding:10px
}
table{

margin-left:auto; 
margin-right:auto;
}
</style>


</head>
<body>
<jsp:include page="/frontend/navbar.jsp"/>
<br>
<br>
<section class="section-property section-t8">
   <td width="273" style="width:161.25pt;padding:0cm 0cm 0cm 0cm;height:69.0pt">
  <p class="MsoNormal" align="center" style="text-align:center;line-height:13.5pt;
  mso-pagination:widow-orphan"><span lang="EN-US" style="mso-bidi-font-size:12.0pt;
  font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:purple;
  mso-font-kerning:0pt;mso-no-proof:yes"><img width="273" height="166" src="images/5555.jpg" v:shapes="_x0000_i1025"><!--[endif]--></span><span lang="EN-US" style="mso-bidi-font-size:
  12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;
  mso-font-kerning:0pt"><o:p></o:p></span><div class="bar3"><img src="images/bar3.png"></div></p>
  </td>
  <div class="head">掌握頂尖流行情報  嚴選多元新穎商品  創造個人專屬的獨特品味生活</div>
  </td>
 </tr>
</tbody></table>
<div class="middle1">
<h4>親愛的<font color='blue'>${memrealname}</font></h4>您好：<span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
新細明體;mso-font-kerning:0pt">&nbsp;</span><span lang="EN-US" style="font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#333333;
mso-font-kerning:0pt">&nbsp;<br>
</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#333333;
mso-font-kerning:0pt">　　感謝您對旅遊浪潮的支持。報名了<font style="color:blue">${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}</font>套裝行程</span><span style="font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#333333;
mso-font-kerning:0pt"> </span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;
mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:
Arial;color:#333333;mso-font-kerning:0pt">在您刷卡購買旅遊行程後，您的電子郵件信箱將會收到一封由系統自動發出的「訂單確認信函」，</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:Arial;
mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#0066CC;
mso-font-kerning:0pt">如果您未能收到，請您主動與我們聯繫</span><br><span style="font-size:10.0pt;
font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:Arial;mso-hansi-font-family:
Arial;mso-bidi-font-family:Arial;color:#333333;mso-font-kerning:0pt">，依您所報名的行程傳真至國內旅遊或國外旅遊專案組，將有專人與您聯絡。</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;
mso-fareast-font-family:新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p></div>

<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="0" style="width:470.25pt;mso-cellspacing:0cm;background:white;mso-yfti-tbllook:
 1184;mso-padding-alt:0cm 0cm 0cm 0cm">
 <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes">
<div class="middle2"><b>報名確認單與報名作業程序</b></div>
 </tr>
 <tr style="mso-yfti-irow:1;mso-yfti-lastrow:yes;height:14.25pt">
  <td width="633" style="width:464.25pt;padding:3.0pt 3.0pt 3.0pt 3.0pt;
  height:14.25pt">
  <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:Arial;
  mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#333333;
  mso-font-kerning:0pt">國內旅遊或國外旅遊套裝行程內容說明：</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Cambria Math&quot;,serif;mso-fareast-font-family:
  新細明體;mso-bidi-font-family:&quot;Cambria Math&quot;;color:#0066CC;mso-font-kerning:0pt">◎</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:Arial;
  mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#0066CC;
  mso-font-kerning:0pt">為確保您的權益，請務必詳閱以下說明</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
  新細明體;color:#333333;mso-font-kerning:0pt"><br>
  </span><span lang="EN-US" style="mso-bidi-font-size:
  12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:新細明體;
  mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-left:18.0pt;text-indent:-18.0pt;line-height:
  13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;
  font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;mso-font-kerning:
  0pt">1.</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;
  mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:
  Arial;color:#333333;mso-font-kerning:0pt">請填妥參加人員資料，以傳真方式提供給國內旅遊或國外旅遊專案組，專案人員收到您的報名資料</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;
  mso-fareast-font-family:新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-left:18.0pt;text-indent:-18.0pt;line-height:
  13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;
  font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#333333;
  mso-font-kerning:0pt">&nbsp;&nbsp;&nbsp;</span><span style="font-size:10.0pt;
  font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:Arial;mso-hansi-font-family:
  Arial;mso-bidi-font-family:Arial;color:#333333;mso-font-kerning:0pt">後將與您聯絡，以確認完成所有報名程序。</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
  新細明體;color:#333333;mso-font-kerning:0pt">(</span><span style="font-size:10.0pt;
  font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:Arial;mso-hansi-font-family:
  Arial;mso-bidi-font-family:Arial;color:#333333;mso-font-kerning:0pt">註：表格不符使用時，請自行影印</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
  新細明體;color:#333333;mso-font-kerning:0pt">)</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;
  mso-fareast-font-family:新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-left:18.0pt;text-indent:-18.0pt;line-height:
  13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;
  font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;mso-font-kerning:
  0pt">2.</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;
  mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:
  Arial;color:#333333;mso-font-kerning:0pt">本券限一次使用完畢，若遺失或遭冒用本公司概不負責，敬請妥善保管。</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;
  mso-fareast-font-family:新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-left:18.0pt;text-indent:-18.0pt;line-height:
  13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;
  font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;mso-font-kerning:
  0pt">3.</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;
  mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:
  Arial;color:#333333;mso-font-kerning:0pt">本公司保留接受本訂單與否的權利。</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;
  mso-fareast-font-family:新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <p class="MsoNormal" style="margin-left:18.0pt;text-indent:-18.0pt;line-height:
  13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;
  font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;mso-font-kerning:
  0pt">4.</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;
  mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:
  Arial;color:#333333;mso-font-kerning:0pt">旅遊浪潮聯絡資如下：</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;
  mso-fareast-font-family:新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
  <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="0" style="width:468.0pt;border-collapse:collapse;mso-yfti-tbllook:1184;
   mso-padding-alt:0cm 0cm 0cm 0cm">
   <tbody><tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes">
    <td width="50%" style="width:50.0%;border:inset #111111 1.0pt;padding:0cm 0cm 0cm 0cm">
    <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
    mso-fareast-font-family:新細明體;color:#0066CC;mso-font-kerning:0pt">&nbsp;</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
    Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#0066CC;
    mso-font-kerning:0pt">國內旅遊：旅遊浪潮國內旅遊專案組</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;新細明體&quot;,serif;mso-bidi-font-family:
    新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
    <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
    mso-fareast-font-family:新細明體;color:#0066CC;mso-font-kerning:0pt">&nbsp;</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
    Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#0066CC;
    mso-font-kerning:0pt">傳真專線：</span><span lang="EN-US" style="font-size:10.0pt;
    font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#0066CC;
    mso-font-kerning:0pt">02-2523-4506</span><span lang="EN-US" style="mso-bidi-font-size:
    12.0pt;font-family:&quot;新細明體&quot;,serif;mso-bidi-font-family:新細明體;mso-font-kerning:
    0pt"><o:p></o:p></span></p>
    <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
    mso-fareast-font-family:新細明體;color:#0066CC;mso-font-kerning:0pt">&nbsp;</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
    Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#0066CC;
    mso-font-kerning:0pt">服務專線：</span><span lang="EN-US" style="font-size:10.0pt;
    font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#0066CC;
    mso-font-kerning:0pt">02-2523-2977</span><span lang="EN-US" style="mso-bidi-font-size:
    12.0pt;font-family:&quot;新細明體&quot;,serif;mso-bidi-font-family:新細明體;mso-font-kerning:
    0pt"><o:p></o:p></span></p>
    </td>
    <td width="312" style="width:233.25pt;border:inset #111111 1.0pt;border-left:
    none;padding:0cm 0cm 0cm 0cm">
    <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
    mso-fareast-font-family:新細明體;color:#CC3399;mso-font-kerning:0pt">&nbsp;</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
    Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#CC3399;
    mso-font-kerning:0pt">國外旅遊：旅遊浪潮國外旅遊專案組</span><span lang="EN-US" style="mso-bidi-font-size:12.0pt;font-family:&quot;新細明體&quot;,serif;mso-bidi-font-family:
    新細明體;mso-font-kerning:0pt"><o:p></o:p></span></p>
    <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
    mso-fareast-font-family:新細明體;color:#CC3399;mso-font-kerning:0pt">&nbsp;</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
    Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#CC3399;
    mso-font-kerning:0pt">傳真專線：</span><span lang="EN-US" style="font-size:10.0pt;
    font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#CC3399;
    mso-font-kerning:0pt">02-2506-1917</span><span lang="EN-US" style="mso-bidi-font-size:
    12.0pt;font-family:&quot;新細明體&quot;,serif;mso-bidi-font-family:新細明體;mso-font-kerning:
    0pt"><o:p></o:p></span></p>
    <p class="MsoNormal" style="line-height:13.5pt;mso-pagination:widow-orphan"><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
    mso-fareast-font-family:新細明體;color:#CC3399;mso-font-kerning:0pt">&nbsp;</span><span style="font-size:10.0pt;font-family:&quot;新細明體&quot;,serif;mso-ascii-font-family:
    Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:Arial;color:#CC3399;
    mso-font-kerning:0pt">服務專線：</span><span lang="EN-US" style="font-size:10.0pt;
    font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:新細明體;color:#CC3399;
    mso-font-kerning:0pt">02-2509-8577</span><span lang="EN-US" style="mso-bidi-font-size:
    12.0pt;font-family:&quot;新細明體&quot;,serif;mso-bidi-font-family:新細明體;mso-font-kerning:
    0pt"><o:p></o:p></span></p>
    </td>
   </tr>
  </tbody></table>
  </td>
 </tr>
</section>

</tbody>
</table>
</section>


<br>
<jsp:include page="/frontend/footer.jsp" />
</body>
</html>