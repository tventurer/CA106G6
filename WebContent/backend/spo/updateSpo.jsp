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
    <title>修改景點</title>
  </head>
  <body class="app sidebar-mini rtl">
    
    <jsp:include page="/backend/backbar.jsp"/>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 修改景點</h1>
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
                  <input class="form-control" type="text" name="sponame" value="${spoVO.sponame}" placeholder="Enter spot name"> <b>${errorMsgs.sponame}</b>
                </div>
                <jsp:useBean id="spoSvc" class="com.spo.model.SpoService"/>
                <div class="form-group">
                  <label for="exampleSelect">景點分類</label>
                    <select class="form-control" id="exampleSelect" name="spoclass">
                    	<c:forEach var="className" items="${spoSvc.className}">
								<option value="${className}" ${spoVO.spoclass == className?"selected":""}>${className}</option>
						</c:forEach>
                    </select>
                </div>
                <div class="form-group">
                  <label class="control-label">城市名稱</label>
                  <input class="form-control" type="text" name="spocity" value="${spoVO.spocity}" placeholder="Enter spot clty">  <b>${errorMsgs.spocity}</b>
                </div>
                <div class="form-group">
                  <label class="control-label">地址</label>
                  <input class="form-control" type="text" name="spoaddr" value="${spoVO.spoaddr}" placeholder="Enter spot address">  <b>${errorMsgs.spoaddr}</b>
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
                  <input class="form-control" type="text" name="spocontent" value="${spoVO.spocontent}" placeholder="Enter spot content">  <b>${errorMsgs.spocontent}</b>
                </div>
            </div>
            <div class="tile-footer">
              <input type="hidden" name="whichPage" value="${whichPage}">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="spono" value="${spoVO.spono}">
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
</html>