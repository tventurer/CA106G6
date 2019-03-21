<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.acr.model.*"%>
<%
AcrService acrSvc = new AcrService();
List<AcrVO> list = acrSvc.getAll();
pageContext.setAttribute("list",list);

%>

<!DOCTYPE html>
<html  lang="zh-TW">
  <head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />

 <style type="text/css">
  .app-header__logo{
  background-color:#009688;
  width:200px;
  }
  </style>
  </head>
  <body class="app sidebar-mini rtl">
  <!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>
    <!-- 管理頁面主要顯示的部分 -->
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-credit-card" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;會員儲值紀錄</h1>
          <p>此處可搜尋前台會員的所有交易紀錄</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">會員儲值紀錄</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">

          <div class="tile">	
            <div class="tile-body">
        <div class="col-sm-12 ">
        <div id="sampleTable_filter" class="dataTables_filter">
        <label>
        <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/acr/acr" style="margin-bottom: 0px;">
              <h3>搜尋會員儲值紀錄：</h3><br><span><input type="search" name="mememail" class="form-control form-control-sm" placeholder="請輸入會員帳號" aria-controls="sampleTable"></span><br>
     		   時間區間：<span><input name="atime" id="f_date1" type="text"></span>&nbsp;&nbsp;~&nbsp;&nbsp;<span><input type="text" name="btime" id="f_date2" type="text"></span>
        <input type="hidden" name="action" value="search">
		<input type="submit" class="btn btn-default" value="搜尋">
		</FORM>
		<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
        </label>
        </div>
        <br>

			<%if(request.getAttribute("acrVO") !=null){%>
			<jsp:include page="listEmpSearchAcr.jsp" />
			<%}%>
		
        	</div>

            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
  <!-- =========================================以下為 datetimepicker 之相關設定========================================== -->



<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>


<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>

$("#purpic").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#purpicimg").attr('src', e.target.result);
       $("#purpicimg").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({//下架時間
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '' 
		   // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
        $('#f_date2').datetimepicker({//預計出貨時間
 	       theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 	       value: ''  
 	       // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
            //startDate:	            '2017/07/10',  // 起始日
            //minDate:               '-1970-01-01', // 去除今日(不含)之前
            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
         });
        
        
        
</script>
</html>