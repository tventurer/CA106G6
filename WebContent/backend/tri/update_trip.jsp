<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
width:  300px;
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
height: 151px;
}
b {
color: red;	
}
</style>
    <title>修改自由行行程</title>
  </head>
  <body class="app sidebar-mini rtl">
    
    <jsp:include page="/backend/backbar.jsp"/>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 修改自由行行程</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="tile">
            <h3 class="tile-title">自由行行程</h3>
            <div class="tile-body">
              <form id="form" method="post" name="form" action="tri">

				<c:if test="${not empty errorMsgs.error}">
					<font style="color:'red'">請修正以下錯誤:  ${errorMsgs.error}</font>
				</c:if>

                <div class="form-group">
                  <label class="control-label">行程名稱</label>
                  <input class="form-control" type="text" name="triname" value="${triVO.triname}" placeholder="Enter trip name"> <b>${errorMsgs.triname}</b>
                </div>
                <div class="form-group">
                  <label class="control-label">開始日期</label>
                  <input class="form-control" type="text" id="start_date" name="tribegdate" value="${triVO.tribegdate}" placeholder="Enter trip begin date">  <b>${errorMsgs.tribegdate}</b>
                </div>
                <div class="form-group">
                  <label class="control-label">結束日期</label>
                  <input class="form-control" type="text" id="end_date" name="trienddate" value="${triVO.trienddate}" placeholder="Enter trip finish date">  <b>${errorMsgs.trienddate}</b>
                </div>
                <div class="form-group">
                  <label class="control-label">人數</label>
                  <input class="form-control" type="number" name="tripeonum" value="${triVO.tripeonum}" placeholder="Enter how many people in the trip">  <b>${errorMsgs.tripeonum}</b>
                </div>
            </div>
            <div class="tile-footer">
              <input type="hidden" name="reqURL" value="${(reqURL == null) ?param.reqURL:reqURL}">
              <input type="hidden" name="whichPage" value="${(whichPage == null) ?param.whichPage:whichPage}">
              <input type="hidden" name="come" value="backend">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="trino" value="${triVO.trino}">
              <a class="btn btn-primary" href="javascript:document.form.submit()"><i class="fa fa-fw fa-lg fa-check-circle"></i>送出</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="javascript:history.back(-1)"><i class="fa fa-fw fa-lg fa-times-circle"></i>取消</a>
            </form>
            </div>
          </div>
        </div>
       </div>
        
    </main>
    
<script src="<%= request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#start_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
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
  </body>
</html>