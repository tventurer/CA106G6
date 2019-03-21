<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*" %>
<!DOCTYPE html>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料修改 - update_mem_input.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
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
<body bgcolor='white'>
<table id="table-1">
	<tr><td>
		 <h3>會員資料修改 - update_mem_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/mem/select_page.jsp"><img src="<%=request.getContextPath()%>/frontend/mem/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem" name="form1">
<table>
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td>${memVO.memno}</td>
	</tr>
	<tr>
		<td>會員帳號:<font color=red><b>*</b></font></td>
		<td>${memVO.memacc}</td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="mempwd" size="45" value="${memVO.mempwd}" /></td><td>${errorMsgs.mempwd}</td>
	</tr>
	<tr>
		<td>電子信箱:</td>
		<td><input type="TEXT" name="mememail" size="45" value="${memVO.mememail}" /></td><td>${errorMsgs.mememail}</td>
	</tr>
	<tr>
		<td>信箱認證狀態:<font color=red><b>*</b></font></td>
		<td>${memVO.mememailvalid}</td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="memrealname" size="45" value="${memVO.memrealname}" /></td><td>${errorMsgs.memrealname}</td>
	</tr>
	<tr>
		<td>英文姓名:</td>
		<td><input type="TEXT" name="memengname" size="45" value="${memVO.memengname}" /></td><td>${errorMsgs.memengname}</td>
	</tr>
	<tr>
		<td>電話號碼:</td>
		<td><input type="TEXT" name="memphone" size="45" value="${memVO.memphone}" /></td><td>${errorMsgs.memphone}</td>
	</tr>
	<tr>
		<td>會員生日:</td>
		<td><input name="membirth" id="f_date1" type="TEXT" /></td>
	</tr>
	<tr>
		<td>地址:</td>
		<td><input type="TEXT" name="memaddr" size="45" value="${memVO.memaddr}" /></td><td>${errorMsgs.memaddr}</td>
	</tr>
	<tr>
		<td>身份證字號:</td>
		<td><input type="TEXT" name="memidno" size="45" value="${memVO.memidno}" /></td><td>${errorMsgs.memidno}</td>
	</tr>
	<tr>
		<td>銀行帳號:</td>
		<td><input type="TEXT" name="membankacc" size="45" value="${memVO.membankacc}" /></td><td>${errorMsgs.membankacc}</td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memno" value="${memVO.memno}">
<input type="hidden" name="memacc" value="${memVO.memacc}">
<input type="hidden" name="mememailvalid" value="${memVO.mememailvalid}">
<input type="hidden" name="requestURL" value="${param.requestURL}">
<input type="hidden" name="forwardURL" value="${forwardURL}">
<input type="hidden" name="whichPage" value="${param.whichPage}">
<input type="submit" value="送出修改"></FORM>
</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Date membirth = null;
  try {
	    membirth = memVO.getMembirth();
   } catch (Exception e) {
	    membirth = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/frontend/mem/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/frontend/mem/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/frontend/mem/datetimepicker/jquery.datetimepicker.full.js"></script>

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
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '${memVO.membirth}', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>