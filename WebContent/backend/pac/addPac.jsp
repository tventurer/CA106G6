<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pac.model.*"%>

<%
  PacVO pacVO = (PacVO) request.getAttribute("pacVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程新增 - addPac.jsp</title>

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

<style type="text/css">
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
  form {
  	line-height:2em;
  }
  form>input,form>select{
  	padding:5px 10px;border:1px solid #888888;border-radius:5px;
  }
</style>
<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
</head>
<body  class="app sidebar-mini rtl">
<jsp:include page="/backend/backbar.jsp" />

<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 新增套裝行程</h1>
          
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


      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="tile">
            <div class="tile-body">
              <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" name="form1" enctype="multipart/form-data">
				<div class="form-group">
                  <label class="control-label">行程名稱:</label>
                  <input class="form-control form-control-lg" id="inputLarge" type="TEXT" name="pacname" 
			 		value="<%= (pacVO==null)? "" : pacVO.getPacname()%>" />
                </div>
                <div class="form-group">
                  <input class="form-control form-control-lg" id="inputLarge" type="hidden" name="empno" 
			 		value="<%= (pacVO==null)? "EMP000001" : pacVO.getEmpno()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">旅遊國家:</label>
                  <input type="TEXT" class="form-control form-control-lg" id="inputLarge" name="paccountry" 
						 value="<%= (pacVO==null)? "" : pacVO.getPaccountry()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">旅遊城市:</label>
                  <input type="TEXT" name="paccity" class="form-control form-control-lg" id="inputLarge"
						 value="<%= (pacVO==null)? "" : pacVO.getPaccity()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">旅遊天數:</label>
				  <input type="TEXT" name="pactotalday"  class="form-control form-control-lg" id="inputLarge"
			 			 value="<%= (pacVO==null)? "" : pacVO.getPactotalday()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">團費價格:</label>
				  <input type="TEXT" name="pacprice"  class="form-control form-control-lg" id="inputLarge"
			 			 value="<%= (pacVO==null)? "" : pacVO.getPacprice()%>" />
			   </div>
			   
			    <div class="form-group">
                  <label class="control-label">預繳訂金:</label>
				  <input type="TEXT" name="pacdeposit"  class="form-control form-control-lg" id="inputLarge"
			 			 value="<%= (pacVO==null)? "" : pacVO.getPacdeposit()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">特色標籤:</label>
				  <input type="TEXT" name="pacdiv" class="form-control form-control-lg" id="inputLarge"
			 			 value="<%= (pacVO==null)? "" : pacVO.getPacdiv()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">行程內容:</label>
                  <TEXTAREA name="paccontent" rows="10" cols="80">${param.paccontent}</textarea>
                  <script>
					CKEDITOR.replace( 'paccontent' );
				  </script>
                </div>
               
               
        
               <div class="form-group row">
                  <label class="control-label col-md-3">行程特色圖1</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar1" id="pactchar1" size="45"
			 value="<%= (pacVO==null)? "" : pacVO.getPactchar1()%>"/>
						 <img id="preview1" src="#"  alt="" width="100" height="auto" style="display:none">
                  </div>
               </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">行程特色圖2</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar2" id="pactchar2" size="45"
						 value="<%= (pacVO==null)?"請選擇圖片": pacVO.getPactchar2()%>"/>
						 <img id="preview2" src="#"  alt=""  width="100" height="auto" style="display:none">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label">注意事項:</label>
               <TEXTAREA name="pacremark" rows="10" cols="80"><%=(pacVO==null)?"": pacVO.getPacremark()%></textarea>
                <script>
					CKEDITOR.replace( 'pacremark' );
				  </script>
                </div>
                <div class="form-group">
                  <div class="form-check">
                    <label class="form-check-label">
                 	    行程狀況:<select name="pacstatus">
								<option value=0>可出團
								<option value=1>不再出團
					 		</select> 
                    </label>
                  </div>
                </div>
            <input type="hidden" name="action" value="insert">
            
			<input class="btn btn-primary" type="submit" value="送出新增"></FORM>
            </div>
    </main>
<script>

$("#pactchar1").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#preview1").attr('src', e.target.result);
       $("#preview1").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}


$("#pactchar2").change(function(){

	readURL2(this);

	});
	
function readURL2(input){
	
	  if(input.files && input.files[0]){

	    var reader = new FileReader();

	    reader.onload = function (e) {
	    	
	       $("#preview2").attr('src', e.target.result);
	       $("#preview2").removeAttr("style");
	    }

	    reader.readAsDataURL(input.files[0]);

	  }

	}



</script>
</body>
</html>