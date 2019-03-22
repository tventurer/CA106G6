<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Private Message</title>
<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
</head>
<body>

	<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='orange' align='center' valign='middle' height='20'>
			 <td>   
			       <h3> 傳訊息給${memSvc.getOneMem(param.receiver).memacc} </h3> 
				     <h3> 歡迎:<font color=red> ${memacc} </font>您好</h3>
			 </td>
		</tr>
	</table>
	<b> <br>
	<br>
	</b>
	
	<div>
	<form name ='form' action = '<%=request.getContextPath()%>/backend/mpm/mpm' method='post'>
	<table>
	  <tr>
	    <td>私訊標題:</td>
	    <td><input type="TEXT" name="mpmtitle" size="45" value="${param.mpmtitle}"></td><td>${errorMsgs.mpmtitle}</td>
	  </tr>
	  
	  
	</table>
	
			<h1>${errorMsgs.mpmcontent}</h1>
			<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
            <textarea name="mpmcontent" rows="10" cols="80">${param.mpmcontent}</textarea>
            <script>
				CKEDITOR.replace( 'mpmcontent' );
			</script>
			<input type="hidden" name="action" value="send_pm">
			<input type="hidden" name="receiver" value="${param.receiver}">
            <input type ="submit" value = "送出">
    </form>
	</div>
	
</body>
</html>