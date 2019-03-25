<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ptp.model.*"%>
<%-- <%@ import java.sql.timestamp; %> --%>

<%
  PtpVO ptpVO = (PtpVO) request.getAttribute("ptpVO"); //EmpServlet.java (Concroller) 存入req的ptpVO物件 (包括幫忙取出的ptpVO, 也包括輸入資料錯誤時的ptpVO物件)
  String requestURL = request.getParameter("requestURL");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程修改 - update_ptp_input.jsp</title>

<style>
  table#table-1 {
	background-color: Yellow;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body  class="app sidebar-mini rtl">
<jsp:include page="/backend/backbar.jsp" />

<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 修改出團細節</h1>
          
        </div>
      </div>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
 <div class="row">
        <div class="col-md-6">
          <div class="tile">
            <div class="tile-body">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" name="form1">
<table>
	 <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge"><font color=red><b>*</b></font>套裝出團內容編號:</label>
                    <label class="col-form-label col-form-label-lg" for="inputLarge"><%=ptpVO.getPtpno()%></label>
                    <input class="form-control form-control-lg" id="inputLarge" type="hidden" name="ptpno" 
                    						 value="<%= (ptpVO==null)? "PTP000002" : ptpVO.getPtpno()%>">
                  </div> 
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">套裝行程編號:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pacno"
                    						 value="<%= ptpVO.getPacno()%>">
                  </div> 
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">出發時間:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpstart"
						 value="<%= ptpVO.getPtpstart()%>" >
                  </div> 
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">回程時間:</label>
                    <input class="form-control form-control-lg f_date2" id="inputLarge" type="text" name="ptpend"  
						 value="<%= (ptpVO==null)? "PTP000002" : ptpVO.getPtpend()%>">
                  </div> 
                  
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">報名截止時間:</label>
                    <input class="form-control form-control-lg f_date2" id="inputLarge" type="text" name="ptpsigndle" 
                    	 value="<%= ptpVO.getPtpsigndle()%>">
                    	 
                  </div> <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">行程異動公告:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpnotice" size="30" 
						 value="<%= ptpVO.getPtpnotice()%>">
						 
                  </div> <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">剩餘空位:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpvacancy" 
						 value="<%= ptpVO.getPtpvacancy()%>">
                  </div> <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">最少出團人數:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpminmen" 
                    						 value="<%= ptpVO.getPtpminmen()%>" />
                 
                  </div> <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">團體人數上限:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpmaxmen"
						 value="<%= ptpVO.getPtpmaxmen()%>">
                  </div> 
                   <div class="form-group">
                    <label for="exampleSelect1">出團狀態:</label>
                    <select class="form-control" name="ptpstatus" id="exampleSelect1">
                      <option value=0>報名中</option>
                      <option value=1>額滿</option>
                      <option value=2>已成團</option>
                      <option value=3>保證出團</option>
                    </select>
                  </div>
                  
                  
                  
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">上架時間:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptptimelog" 
						 value="<%= ptpVO.getPtptimelog()%>">
                  </div> 
	
<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.pac.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="updateY">
<input type="hidden" name="ptpno" value="<%=ptpVO.getPtpno()%>">
<input type="hidden" name="requestURL" value="<%=requestURL%>">
<input type="submit" value="修改"></FORM>
</body>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh');
$('.f_date1').datetimepicker({
   		theme: '',              //theme: 'dark',
   		timepicker:true,       //timepicker:true,
   		step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
  		format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
   
   		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   		//startDate:	            '2017/07/10',  // 起始日
   		//minDate:               '-1970-01-01', // 去除今日(不含)之前
  		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

$('.f_date2').datetimepicker({
	   theme: '',              //theme: 'dark',
	   timepicker:false,       //timepicker:true,
	   step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	   format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   
	   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	   //startDate:	            '2017/07/10',  // 起始日
	   //minDate:               '-1970-01-01', // 去除今日(不含)之前
	   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});



</script>

</html>