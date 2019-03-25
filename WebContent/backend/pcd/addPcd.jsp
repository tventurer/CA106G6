<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>

<%
  PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程新增 - addPcd.jsp</title>

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
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<main class="app-content">
<div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 新增報名訂單</h1>
          
        </div>
      </div>
<div class="row">
        <div class="col-md-6">
          <div class="tile">
            <div class="tile-body">



<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" name="form1">
				  
				  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">出團內容編號:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="ptpno" size="30" 
						 value="<%= (pcdVO==null)? "PTP000002" : pcdVO.getPtpno()%>">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">會員編號:</label>
                    <input class="form-control form-control-lg" name="memno" id="inputLarge" type="text"
                    	value="<%= (pcdVO == null)? "MEM000001" : pcdVO.getMemno()%>" >
                  </div>
	<%
  	java.sql.Date pcdordday = null;
  		try {
  			pcdordday = pcdVO.getPcdordday();
   		} catch (Exception e) {
   			pcdordday = new java.sql.Date(System.currentTimeMillis());
   			
   		}
  	%>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">參加人數:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdtripmen" 
						value="<%= (pcdVO == null)? 2 : pcdVO.getPcdtripmen()%>">
                  </div>
	
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">繳費金額:</label>
                    <input class="form-control form-control-lg" id="inputLarge" name="pcdmoney" size="30" 
						value="<%= (pcdVO == null)? 8888 : pcdVO.getPcdmoney()%>"  type="text">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">繳費日期:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdordday" 
						value="<%= (pcdVO == null)? "" : pcdVO.getPcdordday()%>">
                  </div>
                  <div class="form-group">
                    <label for="exampleSelect1">繳費狀態:</label>
                    <select class="form-control" name="pcdstatus" id="exampleSelect1">
                      <option value=0>未繳費</option>
                      <option value=1>繳清</option>
                      <option value=2>已繳訂金</option>
                      <option value=3>取消訂單</option>
                    </select>
                  </div>
                  
                  </div><div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">次要聯絡人手機:</label>
                    <input class="form-control form-control-lg" required  name="pcdsecphone" id="inputLarge" pattern="^09\d\d\d\d\d\d\d\d$"
                    type="text" value="<%= (pcdVO==null)? "0980888888" : pcdVO.getPcdsecphone()%>" >
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">參團人員資料:</label>
                    <input class="form-control form-control-lg" name="pcdfamdata" id="inputLarge" type="text"
                    	value="<%= (pcdVO==null)? "阿哩布達的資料" : pcdVO.getPcdfamdata()%>" >
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">需求備註</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdmark"
                    	value="<%= (pcdVO==null)? "" : pcdVO.getPcdmark()%>" >
                  </div>
<input type="hidden" name="action" value="insertX">
<input type="submit" value="送出新增"></FORM>
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
$('.f_date').datetimepicker({
   		theme: '',              //theme: 'dark',
   		timepicker:false,       //timepicker:true,
   		step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
  		format:'Y-m-d',         //format:'Y-m-d H:i:s',
   
   		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   		//startDate:	            '2017/07/10',  // 起始日
   		//minDate:               '-1970-01-01', // 去除今日(不含)之前
  		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

</script>

</html>