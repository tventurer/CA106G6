<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pah.model.*"%>

<%
  PahVO pahvo = (PahVO)request.getAttribute("pahvo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>加入機加酒</title>
</head>
<body class="app sidebar-mini rtl">


<!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>


<main class="app-content">
     <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>加入新的機加酒票券</h1>
          <p>T-Venturer</p>
        </div>
	 </div>
	 	<div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="row">
              <div class="col-lg-3">
				<c:if test="${not empty errorMsgs}">
				<font style="color:red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
				</c:forEach>
				</ul>
				</c:if>              
			  </div>
			  <div class="col-lg-6">              
				<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol" enctype="multipart/form-data">
					
					<div class="form-group">
                    	<label for="exampleInputEmail1">機加酒標題</label>
                   		<input name="pahname" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">機加酒簡介</label>
                   		<input name="pahintro" type="text" class="form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleTextarea">機加酒內容</label>
                  	 	<textarea name="pahcontent" class="form-control" id="exampleTextarea" rows="5"></textarea>
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">價格</label>
                   		<input name="pahprice" type="text" class="form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">國家</label>
                   		<input name="pahcountry" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">數量</label>
                   		<input name="pahnum" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">出發日期</label>
                   		<input name="pahstdate" type="text" class="f_date1 form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">回程日期</label>
                   		<input name="pahenddate" type="text" class="f_date1 form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">下架日期</label>
                   		<input name="pahdown" type="text" class="f_date2 form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
	                    <label for="exampleSelect1">商品狀態</label>
	                    <select class="form-control" id="exampleSelect1" name="pahstatus">
	                    	<option value="0" >上架中
							<option value="1" >下架中
	                    </select>
                 	</div>
                 	
					<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc1">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc2">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc3">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc4">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc5">
               		</div>
               		
               		<div class="form-group">
                    	<label for="exampleInputEmail1">管理員編號</label>
                   		<input name="empno" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
					<div class="tile-footer">
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="送出新增" lass="btn btn-primary">
            		</div>
				</form>
			</div>
			<div class="col-lg-3">              
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
           timepicker:false,       //timepicker:true,
 	       step: 10,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '', // value:   new Date(),
        });
        
        $.datetimepicker.setLocale('zh');
        $('.f_date2').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 10,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '', // value:   new Date(),
        });      
         
</script>
</html>