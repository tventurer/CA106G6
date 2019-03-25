<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pac.model.*"%>

<%
  PacVO pacVO = (PacVO) request.getAttribute("pacVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
  String requestURL = request.getParameter("requestURL");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>套裝行程修改 - update_pac_input.jsp</title>
<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
<style>
  table#table-1 {
	background-color: Yellow;
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
  
  form>input,form>select{
  	padding:5px 10px;border:1px solid #888888;border-radius:5px;
  }
</style>

</head>
<body  class="app sidebar-mini rtl">
<jsp:include page="/backend/backbar.jsp" />
<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 修改行程</h1>
          
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
      <div class="row">
        <div class="col-md-6">
          <div class="tile">
            <div class="tile-body">
              <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" name="form1" enctype="multipart/form-data">
				<div class="form-group">
                  <label class="control-label">行程名稱:</label>
                  <input type="TEXT" name="pacname" size="45" 
			 		value="<%= (pacVO==null)? "  好多名字" : pacVO.getPacname()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">管理員編號:   <%= pacVO.getEmpno()%></label>
                 
                  <input type="hidden" name="empno" size="45"
					 value="<%= pacVO.getEmpno()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">旅遊國家:</label>
                  <input type="TEXT" name="paccountry" size="45"
						 value="<%= (pacVO==null)? "國家" : pacVO.getPaccountry()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">旅遊城市:</label>
                  <input type="TEXT" name="paccity" size="45"
						 value="<%= (pacVO==null)?"城市" : pacVO.getPaccity()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">旅遊天數:</label>
				  <input type="TEXT" name="pactotalday" size="45"
			 			 value="<%= (pacVO==null)? "6" : pacVO.getPactotalday()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">團費價格:</label>
				  <input type="TEXT" name="pacprice" size="45"
			 			 value="<%= (pacVO==null)? "88000" : pacVO.getPacprice()%>" />
			   </div>
			   
			    <div class="form-group">
                  <label class="control-label">預繳訂金:</label>
				  <input type="TEXT" name="pacdeposit" size="45"
			 			 value="<%= (pacVO==null)? "6666" : pacVO.getPacdeposit()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">特色標籤:</label>
				  <input type="TEXT" name="pacdiv" size="45"
			 			 value="<%= (pacVO==null)? "特色標籤" : pacVO.getPacdiv()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">行程內容:</label>
                  <TEXTAREA name="paccontent" rows="10" cols="80">${pacVO.paccontent}</textarea>
                  <script>
					CKEDITOR.replace( 'paccontent' );
				  </script>
                </div>
               <div class="form-group row">
                  <label class="control-label col-md-3">行程特色圖1</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar1" size="45"
						 value="<%= (pacVO==null)?"請選擇圖片": pacVO.getPactchar1()%>" id="photo"/>
						 <img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacVO.getPactchar1()"  width="100" height="100">
                  </div>
               </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">行程特色圖2</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar2" size="45"
						 value="<%= (pacVO==null)?"請選擇圖片": pacVO.getPactchar2()%>" id="photo"/>
						 <img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacVO.getPactchar2()"  width="100" height="100">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label">注意事項:</label>
                  <textarea name="pacremark" class="form-control" rows="4" placeholder="ckEdit"><%=(pacVO==null)?"注意事項": pacVO.getPacremark()%></textarea>
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
     </table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="pacno" value="<%=pacVO.getPacno()%>">
<input type="hidden" name="empno" value="<%=pacVO.getEmpno()%>">
<input type="submit" value="送出修改"></FORM>

<!-- <input type="hidden" name="action" value="updateX"> -->
<%-- <input type="hidden" name="pacno" value="<%=pacVO.getPacno()%>"> --%>
<%-- <input type="hidden" name="empno" value="<%=pacVO.getEmpno()%>"> --%>
<%-- <input type="hidden" name="requestURL" value="<%=requestURL%>"> --%>
<!-- <input type="submit" value="改版送出修改"></FORM> -->
  </main>
</body>

</html>