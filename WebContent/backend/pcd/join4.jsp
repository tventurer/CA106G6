<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>
<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService" />
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />
<jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService" />
<%
	PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");
	pageContext.setAttribute("pcdVO", pcdVO);
	String memno = (String) session.getAttribute("memno");
	String ptpno = request.getParameter("ptpno");
	PtpVO ptpVO = ptpSvc.getOnePtp(ptpno);
	String pacno = ptpVO.getPacno();
	PacVO pacVO = pacSvc.getOnePac(pacno);
	request.setAttribute("ptpVO", ptpVO);
	request.setAttribute("pacVO", pacVO);
	request.setAttribute("pcdVO", pcdVO);
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>會員報名訂單新增 - addPcd.jsp</title>

<style type="text/css">
h4 {
	color: blue;
	display: inline;
}

form>.ok {
	color: #008800;
}
</style>


</head>
<body bgcolor='white'>
	<jsp:include page="/frontend/navbar.jsp" />
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">${pacVO.pacname}</h1>
						<span class="color-text-a">${pacVO.pacno}</span>
					</div>
				</div>

				<span> <img src="images/bar2.png" alt="">
				</span><br>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" name="form1">
					<table>
						<tr>
							<td>*出團內容編號:</td>
							<td><%=pcdVO.getPtpno()%></td>
							<td><input type="hidden" name="ptpno" size="30"
								value="<%=pcdVO.getPtpno()%>" /></td>
						</tr>
						<tr>
							<td>出團行程名稱:</td>
							<td>${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}</td>
							<td><input type="hidden" name="pacname" size="30"
								value="${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}" /></td>
							<%-- 			 value="${pacSvc.getOnePac(ptpSvc.getOnePtp("PTP000003").pacno).pacname}" /></td> --%>
						</tr>
						<tr>
							<td>*會員編號:</td>
							<td><%=pcdVO.getMemno()%></td>
						</tr>
						<tr>
							<td>*參加人數:</td>
							<td>${pcdVO.pcdtripmen}</td>
							<td><input type="hidden" name="pcdtripmen" size="30"
								value="<%=(pcdVO.getPcdtripmen() == null) ? "" : pcdVO.getPcdtripmen()%>">
							</td>

						</tr>

						<%
							java.sql.Date pcdordday = new java.sql.Date(System.currentTimeMillis());
						%>

						<tr>
							<td>繳費日期:</td>
							<td><%=pcdordday%></td>
							<td><input name="pcdordday" type="hidden" class="f_date"
								value="<%=pcdordday%>"></td>
						</tr>

						<tr>
							<td>繳費金額:</td>
							<td>${pcdVO.pcdtripmen*pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacprice}</td>
							<td><input type="hidden" name="pcdmoney" size="30"
								value=${pcdVO.pcdtripmen*pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacprice } /></td>
						</tr>

						<tr>
							<td><input type="hidden" name="pcdstatus" size="30" value=0 />
							</td>
						</tr>
						<tr>
							<td>次要聯絡人手機:</td>
							<td><input type="TEXT" name="pcdsecphone" size="30"
								pattern="^09\d\d\d\d\d\d\d\d$"
								value="<%=(pcdVO.getPcdsecphone() == null) ? "" : pcdVO.getPcdsecphone()%>"
								required /></td>
						</tr>

						<tr>
							<td>參團人員資料:</td>
							<td><input type="TEXT" required name="pcdfamdata" size="30"
								value="<%=(pcdVO.getPcdfamdata() == null) ? "" : pcdVO.getPcdfamdata()%>">
							</td>
						</tr>
						<tr>
							<td>需求備註</td>
							<td><input type="TEXT" name="pcdmark" size="30"
								value="<%=(pcdVO.getPcdmark() == null) ? "" : pcdVO.getPcdmark()%>" /></td>
						</tr>
					</table>

						
					<br> <input type="hidden" name="action" value="insert">
					<input type="hidden" name="memno" value="<%=pcdVO.getMemno()%>">
					<input type="hidden" name="ptpno" value="<%=pcdVO.getPtpno()%>">
					<%-- <input type="hidden" name="memmail" value="${mememail}"> --%>
					<input type="submit" value="送出新增" id="button">
				</FORM>
<!-- <script> -->
<!-- // $("#button").click(){ -->
<!-- // 	    alert("報名成功，寄信給您"); -->
<!-- // } -->
<!-- <!-- </script> -->
			</div>
		</div>
	</section>
	
	
	<jsp:include page="/frontend/footer.jsp" />
</body>

</section>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
	$.datetimepicker.setLocale('zh');
	$('.f_date').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 60, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',

	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
</script>


</html>