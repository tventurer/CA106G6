<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>

<%
  PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO"); //EmpServlet.java (Concroller) 存入req的pcdVO物件 (包括幫忙取出的pcdVO, 也包括輸入資料錯誤時的pcdVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>訂單修改 - update_pcd_input.jsp</title>

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
          <h1><i class="fa fa-edit"></i> 修改訂單</h1>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" name="form1">
 				  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">套裝訂單編號:<td><font color=red><b>*</b></font></label>
                    <label><%=pcdVO.getPcdno()%></label>
                  </div> 
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">出團內容編號:</label>
                    <input class="form-control form-control-lg" name="ptpno" id="inputLarge" type="text" value="<%= pcdVO.getPtpno()%>">
                  </div> 
                  <jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>
				  <jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService"/>
				  <jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">出團行程名稱:</label>
                    <label><font color=blue>${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}</font></label>
                  </div> 
                  
                 
				  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">會員編號:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="memno"
					 	value="<%= pcdVO.getMemno()%>">
                  </div>
                   <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">參加人數:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdtripmen"
					 	value="<%= pcdVO.getPcdtripmen()%>">
                  </div>
	
	 <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">繳費日期:</label>
                    <input class="form-control form-control-lg f_date1" id="inputLarge" type="text" name="pcdordday"
					 	 value="<%= pcdVO.getPcdordday()%>" />
                  </div>
	
	 <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">繳費金額:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdmoney"
					 	value="<%= pcdVO.getPcdmoney()%>">
                  </div>
	
	     
                  <div class="form-group">
                    <label for="exampleSelect1">繳費狀態:</label>
                    <select class="form-control" name="pcdstatus" id="exampleSelect1">
                    <%
                    String[] pcdstatus ={"未繳費","繳清","已繳訂單","取消訂單"};
                    for(int i = 0; i<pcdstatus.length;i++){
                    	if(pcdVO.getPcdstatus()==i){
                    		out.println("<option value="+i+" selected='selected'>"+pcdstatus[i]+"</option>");
                    	}else{
                    		out.println("<option value="+i+">"+pcdstatus[i]+"</option>");
                    	}
                    }
                    %>
                    </select>
                  </div>
                  
	<div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">次要聯絡人手機:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdsecphone"
					 	pattern="^09\d\d\d\d\d\d\d\d$"  value="<%= pcdVO.getPcdsecphone()%>" />
                  </div>
      <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">參團人員資料:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdfamdata"
					 	value="<%= pcdVO.getPcdfamdata()%>" />
                  </div>            
	
	<div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">需求備註:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdmark"
					 	 value="<%= (pcdVO.getPcdmark()==null) ? "無" : pcdVO.getPcdmark()%>" />
                  </div>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="pcdno" value="<%=pcdVO.getPcdno()%>">
<input type="submit" value="送出修改"></FORM>
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
   		theme: 'pink',              //theme: 'dark',
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