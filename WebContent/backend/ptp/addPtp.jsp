<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ptp.model.*"%>
<%@ page import="com.pac.model.*"%>

<%
String pacname = request.getParameter("pacname");
PacVO pacVO = (PacVO) request.getAttribute("pacVO");
String pacno = request.getParameter("pacno");
PtpVO ptpVO = (PtpVO) request.getAttribute("ptpVO");
request.setAttribute("ptpVO", ptpVO);
request.setAttribute("pacVO", pacVO);
%>
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>新增出團時間- addPtp.jsp</title>

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
<body class="app sidebar-mini rtl" >
	<jsp:include page="/backend/backbar.jsp" />

<main class="app-content">
<div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 新增出團時間</h1>
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

<div class="row justify-content-center">
        <div class="col-md-8">
          <div class="tile">
            <div class="tile-body">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" name="form1">
				  	<div class="form-group">
	                    <label class="col-form-label col-form-label-lg" for="inputLarge">套裝行程編號:</label>
	                    <input class="form-control form-control-lg" id="inputLarge" type="text" 
	                    name="pacno" size="30"   value="<%=pacno %>" />
                  	</div>
	
					<div class="form-group">
	                    <label class="col-form-label col-form-label-lg" for="inputLarge">套裝行程名稱:
	                    <label class="col-form-label col-form-label-lg" for="inputLarge"><%=pacname %></label>
   					</div>
     <% java.sql.Timestamp ptpstart = null;
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
  	
    			  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">出發時間:</label><br>
                    <input name="ptpstart" class="form-control form-control-lg f_date4" type="TEXT" value="<%= (ptpVO == null)? "" : ptpVO.getPtpstart()%>">
                  </div>
                    <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">回程時間:</label>
                    <input class="form-control form-control-lg f_date2" id="f_date2" name="ptpend"  type="text"
                    value="<%= (ptpVO == null)? "" : ptpVO.getPtpend()%>">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">報名截止時間:</label>
                    <input name="ptpsigndle" class="form-control form-control-lg f_date2" id="inputLarge" type="text"
                    value="<%= (ptpVO == null)? "" : ptpVO.getPtpsigndle()%>" >
                  </div>
                  <tr>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">更改公告</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpnotice" size="30"
					 value="<%= (ptpVO==null)? "" : ptpVO.getPtpnotice()%>">
                  </div>
                  
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">剩餘空位:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpvacancy" size="30"
					 value="<%= (ptpVO==null)? "" : ptpVO.getPtpvacancy()%>">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">最低出團人數:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpminmen" size="30"
						 value="<%= (ptpVO==null)? "" : ptpVO.getPtpminmen()%>">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">團體上限人數:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpmaxmen" size="30"
					 value="<%= (ptpVO==null)? "" : ptpVO.getPtpmaxmen()%>">
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
                  <%
						java.sql.Timestamp ptptimelog=null;
						try{
							ptptimelog =ptpVO.getPtptimelog();
						}catch (Exception e){
							ptptimelog=new java.sql.Timestamp(System.currentTimeMillis());
						}
				  %>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">上架時間:</label>
                    <input name="ptptimelog" class="form-control form-control-lg f_date4" id="inputLarge" type="text"
 						value="<%= (ptpVO == null)? ptptimelog : ptpVO.getPtptimelog()%>" >
                  </div>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</div>
</div>
</div>
</div>


</body>




<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
   		theme: '',              //theme: 'dark',
   		timepicker:true,       //timepicker:true,
   		step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
  		format:'Y-m-d H:i',         //format:'Y-m-d H:i:s',
   
   		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   		//startDate:	            '2017/07/10',  // 起始日
   		//minDate:               '-1970-01-01', // 去除今日(不含)之前
  		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

$('.f_date2').datetimepicker({
	   theme: '',              //theme: 'dark',
	   timepicker:false,       //timepicker:true,
	   step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	   format:'Y-m-d',      //format:'Y-m-d H:i:s',
	   
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