<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    	<label for="exampleInputEmail1">機加酒標題</label>
                   		<input value="${pahvo.pahname}" name="pahname" id="pahname" type="text" class="form-control">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">機加酒簡介</label>
                   		<input value="${pahvo.pahintro}" name="pahintro" id="pahintro" type="text" class="form-control" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleTextarea">機加酒內容</label>
                  	 	<textarea name="pahcontent" id="pahcontent" class="form-control" rows="5">${pahvo.pahcontent}</textarea>
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">價格</label>
                   		<input value="${pahvo.pahprice}" name="pahprice" id="pahprice" type="text" class="form-control">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">國家</label>
                   		<input value="${pahvo.pahcountry}" name="pahcountry" id="pahcountry" type="text" class="form-control">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">數量</label>
                   		<input value="${pahvo.pahnum}" name="pahnum" id="pahnum" type="text" class="form-control" >
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">出發日期</label>
                   		<input value="${pahvo.pahstdate}" name="pahstdate" id="pahstdate" type="text" class="f_date1 form-control">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">回程日期</label>
                   		<input value="${pahvo.pahenddate}" name="pahenddate" id="pahenddate" type="text" class="f_date1 form-control">
                 	</div>
                 	
                 	<div class="form-group">
                    	<label for="exampleInputEmail1">下架日期</label>
                   		<input value="${pahvo.pahdown}" name="pahdown" id="pahdown" type="text" class="f_date2 form-control" >
                 	</div>
                 	
                 	<div class="form-group">
	                    <label for="exampleSelect1">商品狀態</label>
	                    <select class="form-control" id="pahstatus" name="pahstatus">
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
                   		<input value="${empno}" name="empno" id="empno" type="text" class="form-control" >
                 	</div>
                 	
					<div class="tile-footer">
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="送出新增" class="btn btn-primary">
            		</div>
            		
            		<br>
            		<input type="button" id="magic" class="btn btn-secondary" value="神奇小按鈕">
				</form>
			</div>
			<div class="col-lg-7">  
				
			    <table class="limit table table-bordered">             
	              <tbody>
	                <tr>
	                  <td>首頁圖片</td>
	                </tr>
	                <tr>
	                  <td><img id="mypc1"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片1</td>
	                </tr>
	                <tr>
	                  <td><img id="mypc2"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片2</td>
	                </tr>
	                <tr>
	                  <td><img id="mypc3"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片4</td>
	                </tr>
	                <tr>
	                  <td><img id="mypc4"/></td>
	                </tr>
	                <tr>
	                  <td>內容圖片5</td>
	                </tr>
	                <tr>
	                  <td><img id="mypc5"/></td>
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

<!-- 展示日曆 -->
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

<!----------------- 神奇小按鈕 --------------------------->
<script>

$("#magic").click(function(){
	buildInfo();
})

function buildInfo(){
	$("#pahname").val("CA106少林寺半年遊");
	$("#pahintro").val("Code打到飛");
	$("#pahcontent").val("飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛飛");
	$("#pahprice").val("120000");
	$("#pahcountry").val("日本");
	$("#pahnum").val("5");
	$("#pahstdate").val("2018-10-08");
	$("#pahenddate").val("2019-03-29");
	$("#pahdown").val("2018-10-01 17:22:37");
}

</script>

</html>