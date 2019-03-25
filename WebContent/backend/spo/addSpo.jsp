<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64" %>
<!DOCTYPE html>
<html>
  <head>
<style>
b {
color: red;	
}
#img1{
align: right;
width: 200px;
height: 200px;
}
</style>
    <title>新增景點</title>
  </head>
  <body class="app sidebar-mini rtl">
    
    <jsp:include page="/backend/backbar.jsp"/>
    
<%
String[] listCity = {"台北市", "基隆市", "新北市", "連江縣", "宜蘭縣", "釣魚台", "新竹市", "新竹縣", "桃園市", "苗栗縣", "台中市", 
       	"彰化縣", "南投縣", "嘉義市", "嘉義縣", "雲林縣", "台南市", "高雄市", "南海島", "澎湖縣", "金門縣", "屏東縣", "台東縣", "花蓮縣"};

pageContext.setAttribute("listCity", listCity);
%>    

    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 新增景點</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="tile">
            <h3 class="tile-title">景點</h3>
            <div class="tile-body">
              <form id="form" method="post" name="form" action="spo" enctype="multipart/form-data">

				<c:if test="${not empty errorMsgs.error}">
					<font style="color:'red'">請修正以下錯誤:  ${errorMsgs.error}</font>
				</c:if>

                <div class="form-group">
                  <label class="control-label">景點名稱</label>
                  <input class="form-control" type="text" name="sponame" value="${param.sponame}" placeholder="Enter spot name"> <b>${errorMsgs.sponame}</b>
                </div>
                <jsp:useBean id="spoSvc" class="com.spo.model.SpoService"/>
                <div class="form-group">
                  <label for="exampleSelect">景點分類</label>
                    <select class="form-control" id="exampleSelect" name="spoclass">
                    	<c:forEach var="className" items="${spoSvc.className}">
								<option value="${className}" ${param.spoclass == className?"selected":""}>${className}</option>
						</c:forEach>
                    </select>
                </div>
                <div class="form-group">
                  <label class="control-label">地址</label>  <b>${errorMsgs.spocity}</b>
                
                <div class="form-row">
                	<div class="col-3">
                		<select class="form-control" id="twCityName" name="spocity">
				 			 <option >--請選擇縣市--</option>
				  		<c:forEach var="city" items="${listCity}">
				  			<option value="${city}" ${param.spocity == city?"selected":""}> ${city}</option>
				  		</c:forEach>
				 		</select>
				 	</div>
				 	<div class="col">
				 		<select class="form-control" id="CityAreaName" >
							<option >--請選擇區域--</option>
				 		</select>
				 	</div>
				 	<div class="col">
			     		<select class="form-control" id="AreaRoadName" >
					 		<option >--請選擇路名--</option>
				 		</select>
				 	</div>
				 </div>	    
                  <input class="form-control" id="addressTotal" type="text" name="spoaddr" value="${param.spoaddr}" placeholder="Enter spot address">  <b>${errorMsgs.spoaddr}</b>
                </div>
                <div class="form-group">
                    <label for="inputFile">圖片</label>
                    <input class="form-control-file" id="inputFile" type="file" aria-describedby="fileHelp" name="spopic" onchange="readURL(this)">
                    
                    <c:set var="spopic" value="${spoVO.spopic}"/>
				   		<%
				   		 	byte[] b = (byte[])pageContext.getAttribute("spopic");
				          	String encodeImg = null;
				          	if(b != null){
				          		encodeImg = Base64.encode(b);%>
				        <%}%>
							 
					<img id="img1"  src="data:image/jpg;base64,<%= encodeImg%>" ${spoVO.spopic == null?'style="display: none"':""}>
                </div>
                <div class="form-group">
                  <label class="control-label">簡介</label>
                  <input class="form-control" type="text" name="spocontent" value="${param.spocontent}" placeholder="Enter spot content">  <b>${errorMsgs.spocontent}</b>
                </div>
            </div>
            <div class="tile-footer">
              <input type="hidden" name="action" value="insert">
              <a class="btn btn-primary" href="javascript:document.form.submit()"><i class="fa fa-fw fa-lg fa-check-circle"></i>送出</a>
<!--               &nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="javascript:history.back(-1)"><i class="fa fa-fw fa-lg fa-times-circle"></i>取消</a> -->
            </form>
            </div>
          </div>
        </div>
       </div>
        
    </main>
    
  </body>
  
<!-- 圖片上傳javascript -->
<script type="text/javascript">
function readURL(input){
	var reader = new FileReader();
	reader.onload = function (e) {
		switch(input.name){
		case "spopic":
					$("#img1").attr('src', e.target.result).css("display","");
					break;
				}
			}
	reader.readAsDataURL(input.files[0]);
}
</script>

<!-- 地址連動Ajax -->
<script>

$(document).ready(function(){
	
	$("#twCityName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json2Read2",
			 data: {"action":"twCityName",
				 	"twCityName":$('#twCityName option:selected').val()},
			 dataType: "json",
			 success: function(result){
				 $("#CityAreaName").empty();
				
				 $("#CityAreaName").append("<option >--請選擇區域--</option>")
				 for(var i=0; i<result.length; i++){
				 	$("#CityAreaName").append('<option value="'+result[i]+'">'+result[i]+'</option>');
				 }
			 },
	         error: function(){
	        	 alert("AJAX-grade發生錯誤囉!")
	        	 }
	    });
	});
	
	$("#CityAreaName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json2Read2",
			 data: {"action":"CityAreaName",
				 	"twCityName":$('#twCityName option:selected').val(),
				 	"CityAreaName":$('#CityAreaName option:selected').val()},
			 dataType: "json",
			 success: function(result){
				 $("#AreaRoadName").empty();
				 $("#AreaRoadName").append("<option >--請選擇區域--</option>")
				 for(var i=0; i<result.length; i++){
				 	$("#AreaRoadName").append('<option value="'+result[i]+'">'+result[i]+'</option>');
				 }
			 },
	         error: function(){
	        	 alert("AJAX-grade發生錯誤囉!")
	        	 }
	    });
	});
	
	
	$("#AreaRoadName").change(function(){
		
		var twCityName = ($('#twCityName').get(0).selectedIndex)>0? $('#twCityName option:selected').val() :'';
		
		var CityAreaName = ($('#CityAreaName').get(0).selectedIndex)>0? $('#CityAreaName option:selected').val() :'';
		
		var AreaRoadName = ($('#AreaRoadName').get(0).selectedIndex)>0? $('#AreaRoadName option:selected').val() :'' ; 

		var locTotal = twCityName+CityAreaName+AreaRoadName;
		$("#addressTotal").attr("value",locTotal);
		
	});	
})


</script>
</html>