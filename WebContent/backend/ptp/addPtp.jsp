<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ptp.model.*"%>

<%
  PtpVO ptpVO = (PtpVO) request.getAttribute("ptpVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程新增 - addPtp.jsp</title>

<style>
  table#table-1 {
	background-color: LIGHTBLUE;
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
<body class="app sidebar-mini rtl">

<jsp:include page="/backend/backbar.jsp"/>
<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>套裝行程出團內容新增 - addPtp.jsp</h3></td><td> -->
<!-- 		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4> -->
<!-- 	</td></tr> -->
<!-- </table> -->

<!-- <h3>資料新增:</h3> -->
<main class="app-content">
     <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>加入新的出團資訊</h1>
          <p>T-Venturer</p>
        </div>
	 </div>
	 	<div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="row">
			  <div class="col-lg-5"> 
			  	<c:if test="${not empty errorMsgs}">
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if> 					             


				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" name="form1">
				<table>
				
					
                 	
					<tr>
						<td>套裝行程編號:</td>
						<td><input type="TEXT" name="pacno" size="30" 
							 value="<%= (ptpVO==null)? "PAC000002" : ptpVO.getPacno()%>" /></td>
					</tr>
					<tr>
						<td>套裝行程名稱:</td>
						<td><input type="TEXT" name="pacname" size="30" 
							 value="秀出對應名稱" /></td>
					</tr>
					
					<% java.sql.Timestamp ptpstart;
						try{
							ptpstart =ptpVO.getPtpstart();
						}catch (Exception e){
							ptpstart = new java.sql.Timestamp(System.currentTimeMillis());
						}
					%>
					
				   <% 
				   	java.sql.Date ptpend = null;
				   		try {
				   			ptpend = ptpVO.getPtpend();
						} catch (Exception e) {
							ptpend = new java.sql.Date(System.currentTimeMillis());
						}
				  	java.sql.Date ptpsigndle = null;
				  		try {
				  			ptpsigndle = ptpVO.getPtpend();
				   		} catch (Exception e) {
				   			ptpsigndle = new java.sql.Date(System.currentTimeMillis());
				   		}
				  	%>
				
					<tr>
						<td>出發時間:</td>
						<td><input name="ptpstart" class="f_date1" size="50" type="TEXT" value="<%= (ptpVO == null)? ptpstart : ptpVO.getPtpstart()%>"></td>
					</tr>
					<tr>
						<td>回程時間:</td>
						<td><input name="ptpend" class="f_date2" type="TEXT" value="<%= (ptpVO == null)? ptpend : ptpVO.getPtpend()%>"></td>
					</tr>
					<tr>
						<td>報名截止時間:</td>
						<td><input name="ptpsigndle" class="f_date2" type="TEXT" value="<%= (ptpVO == null)? ptpsigndle : ptpVO.getPtpsigndle()%>"></td>
					</tr>
					<tr>
						<td>更改公告</td>
						<td><input type="TEXT" name="ptpnotice" size="30"
							 value="<%= (ptpVO==null)? "更改公告0" : ptpVO.getPtpnotice()%>" /></td>
					</tr>
					<tr>
						<td>剩餘空位:</td>
						<td><input type="TEXT" name="ptpvacancy" size="30"
							 value="<%= (ptpVO==null)? "1" : ptpVO.getPtpvacancy()%>" /></td>
					</tr>
					
					<tr>
						<td>最低出團人數:</td>
						<td><input type="TEXT" name="ptpminmen" size="30"
							 value="<%= (ptpVO==null)? "1" : ptpVO.getPtpminmen()%>" /></td>
					</tr>
					<tr>
						<td>團體上限人數:</td>
						<td><input type="TEXT" name="ptpmaxmen" size="30"
							 value="<%= (ptpVO==null)? "1" : ptpVO.getPtpmaxmen()%>" /></td>
					</tr>
					
					<tr>
						<td>出團狀態:</td>
						<td>
							<select name="ptpstatus">
								<option value=0>報名中
								<option value=1>額滿
								<option value=2>已成團
								<option value=3>保證出團
							</select> 
					</tr>
					<%
						java.sql.Timestamp ptptimelog=null;
						try{
							ptptimelog =ptpVO.getPtptimelog();
						}catch (Exception e){
							ptptimelog=new java.sql.Timestamp(System.currentTimeMillis());
						}
					%>
					<tr>
						<td>上架時間:</td>
						<td><input name="ptptimelog" class="f_date4" type="TEXT" value="<%= (ptpVO == null)? ptptimelog : ptpVO.getPtptimelog()%>"></td>
					</tr>
					
					
				
				
				</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>


  </div>            
	        </div>
	      </div>
	    </div>
	  </div>
	</main>




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
	
$('.f_date4').datetimepicker({
	   theme: '',              //theme: 'dark',
	   timepicker:true,       //timepicker:true,
	   step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	   format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	   
	   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	   //startDate:	            '2017/07/10',  // 起始日
	   //minDate:               '-1970-01-01', // 去除今日(不含)之前
	   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});



</script>

</html>