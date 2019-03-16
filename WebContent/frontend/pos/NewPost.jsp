<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bpt.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Post</title>
<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
</head>
<body>

	<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='orange' align='center' valign='middle' height='20'>
			 <td>   
			       <h3> 發表新文章 </h3> 
				     <h3> 歡迎:<font color=red> ${memacc} </font>您好</h3>
			 </td>
		</tr>
	</table>
	<b> <br>
	<br>
	</b>
	
	<div>
	<form name ='form' action = '<%=request.getContextPath()%>/backend/pos/pos' method='post'>
	<table>
	  <tr>
	    <td>標題:</td>
	    <td><input type="TEXT" name="postitle" size="45" value="${param.postitle}"></td><td>${errorMsgs.postitle}</td>
	  </tr>
	  <jsp:useBean id="bptSvc" scope="page" class="com.bpt.model.BptService"/>
	  <tr>
	    <td>分類</td>
	    <td>
	      <select size="1" name="tagno">
           <c:forEach var="bptVO" items="${bptSvc.all}" > 
            <option value="${bptVO.tagno}" ${param.tagno == bptVO.tagno? "selected" : ""}>${bptVO.tagcontent}
           </c:forEach>   
         </select>
       </td>
	  </tr>
	</table>
	
			<h1>${errorMsgs.poscontent}</h1>
			<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
            <textarea name="poscontent" rows="10" cols="80">${param.poscontent}</textarea>
            <script>
				CKEDITOR.replace( 'poscontent' );
			</script>
			<input type="hidden" name="action" value="mem_newpost">
            <input type ="submit" value = "送出">
    </form>
	</div>
	
</body>
</html>