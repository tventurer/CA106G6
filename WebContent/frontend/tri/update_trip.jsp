<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/datetimepicker/jquery.datetimepicker.css" />
<style>
b {
color: red;	
}
.xdsoft_datetimepicker .xdsoft_datepicker {
width:  300px;
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
height: 151px;
}
</style>
<title>修改行程</title>
</head>
<jsp:include page="/frontend/navbar.jsp"/>
<body>
<section class="section-property section-t8">
  <div class="container">
	<form class="form-a" method="post" action="tri">
        <div class="row justify-content-center">
          <div class="col-md-4 mb-2">
            <div class="form-group">
              <label for="Type">行程名稱</label>
              <input type="text" class="form-control form-control-lg form-control-a" placeholder="type your trip name" name="triname" value="${triVO.triname}"> <b>${errorMsgs.triname}</b>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-4 mb-2">
            <div class="form-group">
              <label for="Type">開始日期</label>
              <input type="text" class="form-control form-control-lg form-control-a" id="start_date" placeholder="choose your trip begin date" name="tribegdate" value="${triVO.tribegdate}"> <b>${errorMsgs.tribegdate}</b>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-4 mb-2">
            <div class="form-group">
              <label for="Type">結束日期</label>
              <input type="text" class="form-control form-control-lg form-control-a" id="end_date" placeholder="choose your trip finish date" name="trienddate" value="${triVO.trienddate}"> <b>${errorMsgs.trienddate}</b>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-4 mb-2">
            <div class="form-group">
              <label for="Type">人數</label>
              <input type="text" class="form-control form-control-lg form-control-a" placeholder="type how many people in the trip" name="tripeonum" value="${triVO.tripeonum}"> <b>${errorMsgs.tripeonum}</b>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
        	<input type="hidden" name="action" value="update">
        	<input type="hidden" name="come" value="frontend">
			<input type="hidden" name="trino" value="${triVO.trino}">
        	<div class="col-md-2">
            	<button type="submit" class="btn btn-b">送出</button>
        	</div>
        </div>
      	</div>
     </form>
  </div>
</section>

</body>
<script src="<%= request.getContextPath() %>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#start_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
		minDate:'-1970-01-01',
	    maxDate:$('#end_date').val()?$('#end_date').val():false
	   })
	  },
	  timepicker:false
	 });
	 
	 $('#end_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#start_date').val()?$('#start_date').val():false
	   })
	  },
	  timepicker:false
	 });
});
</script>
</html>