<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@ page import="com.pah.model.*"%>

<%
  PahVO pahvo = (PahVO)request.getAttribute("pahvo");
%>


<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<style>
		
		.limit img { 
				max-width:400px; 
				myimg:expression(onload=function(){ 
				this.style.width=(this.offsetWidth > 400)?"400px":"auto"});
			} 
	</style>
	
	<meta charset="UTF-8">
	<title>修改機加酒商品</title>
	
</head>
<body class="app sidebar-mini rtl">

<!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>

	
	
	
	<main class="app-content">
     <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>修改機加酒票券</h1>
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
			  
			               
				<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol" enctype="multipart/form-data">
					
					<div class="form-group">
                    	<label for="exampleInputEmail1">機加酒編號</label>
                    	<label for="exampleInputEmail1">${pahvo.pahno}</label>
                    </div>			
					
					<div class="form-group">
                    	<label for="exampleInputEmail1">機加酒標題</label>
                   		<input value="${pahvo.pahname}" name="pahname" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">機加酒簡介</label>
                   		<input value="${pahvo.pahintro}" name="pahintro" type="text" class="form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleTextarea">機加酒內容</label>
                  	 	<textarea name="pahcontent" class="form-control" id="exampleTextarea" rows="5">${pahvo.pahcontent}</textarea>
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">價格</label>
                   		<input value="${pahvo.pahprice}" name="pahprice" type="text" class="form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">國家</label>
                   		<input value="${pahvo.pahcountry}" name="pahcountry" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">數量</label>
                   		<input value="${pahvo.pahnum}" name="pahnum" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">出發日期</label>
                   		<input value="${pahvo.pahstdate}" name="pahstdate" type="text" class="f_date1 form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">回程日期</label>
                   		<input value="${pahvo.pahenddate}" name="pahenddate" type="text" class="f_date1 form-control" id="exampleInputEmail1">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">下架日期</label>
                   		<input value="${pahvo.pahdown}" name="pahdown" type="text" class="f_date2 form-control" id="exampleInputEmail1">
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
                		<input class="form-control" type="file" name="pahpc1" id="showpc1">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc2" id="showpc2">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc3" id="showpc3"> 
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc4" id="showpc4">
               		</div>
               		
               		<div class="form-group">
              		    <label class="control-label">照片</label>
                		<input class="form-control" type="file" name="pahpc5" id="showpc5">
               		</div>
               		
               		<div class="form-group">
                    	<label for="exampleInputEmail1">管理員編號</label>
                   		<input value="${pahvo.empno}" name="empno" type="text" class="form-control" id="exampleInputEmail1" >
                 	</div>
                 	
					<div class="tile-footer">
						<input type="hidden" name="action" value="update">
						<input type="hidden" name="pahno" value="${pahvo.pahno}">
						<input type="submit" value="送出修改" class="btn btn-primary">
            		</div>
				</form>
			</div>
			<div class="col-lg-7">  
				
			    <table class="limit table table-bordered">             
	              <tbody>
	                <tr>
	                  <td>首頁圖片</td>
	                </tr>
	                <tr>
	                	<%
	                		byte pc1[] = pahvo.getPahpc1();
	                		String show1 = Base64.encode(pc1);
	                	%>
	                  <td><img id="mypc1" src="data:image/jpg;base64,<%=show1%>"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片1</td>
	                </tr>
	                <tr>
	               		<%
	                		byte pc2[] = pahvo.getPahpc2();
	                		String show2 = Base64.encode(pc2);
	                	%>
	                  <td><img id="mypc2" src="data:image/jpg;base64,<%=show2%>"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片2</td>
	                </tr>
	                <tr>
	                	<%
	                		byte pc3[] = pahvo.getPahpc3();
	                		String show3 = Base64.encode(pc3);
	                	%>
	                  <td><img id="mypc3" src="data:image/jpg;base64,<%=show3%>"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片4</td>
	                </tr>
	                <tr>
	                	<%
	                		byte pc4[] = pahvo.getPahpc4();
	                		String show4 = Base64.encode(pc4);
	                	%>
	                  <td><img id="mypc4" src="data:image/jpg;base64,<%=show4%>"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片5</td>
	                </tr>
	                <tr>
	                	<%
	                		byte pc5[] = pahvo.getPahpc5();
	                		String show5 = Base64.encode(pc5);
	                	%>
	                  <td><img id="mypc5" src="data:image/jpg;base64,<%=show5%>"/></td>
	                </tr>
	              </tbody>
           		</table> 
           		       
			  </div>            
	        </div>
	      </div>
	    </div>
	  </div>
	</main>

</body>



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

<!-- 顯示日曆 -->
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

<!-- 展示上傳圖片 -->
<script>


// 第一張圖
$("#showpc1").change(function(){
	  readURL1(this);
	});
function readURL1(input){
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
       $("#mypc1").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }}
 
//第二張圖
$("#showpc2").change(function(){
	  readURL2(this);
	});
function readURL2(input){
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
       $("#mypc2").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }}

//第三張圖
$("#showpc3").change(function(){
	  readURL3(this);
	});
function readURL3(input){
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
       $("#mypc3").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }}
//第四張圖
$("#showpc4").change(function(){
	  readURL4(this);
	});
function readURL4(input){
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
       $("#mypc4").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }}
//第五張圖
$("#showpc5").change(function(){
	  readURL5(this);
	});
function readURL5(input){
  if(input.files && input.files[0]){
    var reader = new FileReader();
    reader.onload = function (e) {
       $("#mypc5").attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }}
  

</script>
</html>