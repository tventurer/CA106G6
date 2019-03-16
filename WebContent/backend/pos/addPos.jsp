<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pos.model.*"%>
<%
  PosVO posVO = (PosVO) request.getAttribute("posVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章資料新增 - addPos.jsp</title>

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
</style>

</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>文章資料新增 - addPos.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/backend/pos/select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pos/pos" name="form1">
<table>
	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="memno" size="45" 
			 value="<%= (posVO == null)? "MEM000001" : posVO.getMemno()%>" /></td>
	</tr>
	<tr>
		<td>文章標籤編號:</td>
		<td><input type="TEXT" name="tagno" size="45"
			 value="<%= (posVO == null)? "1" : posVO.getTagno()%>" /></td>
	</tr>
	<tr>
		<td>標題:</td>
		<td><input type="TEXT" name="postitle" size="45"
			 value="<%= (posVO == null)? "勸世寶貝喵喵" : posVO.getPostitle()%>" /></td>
	</tr>
	<tr>
		<td>內文:</td>
		<td><input type="TEXT" name="poscontent" size="45"
			 value="<%= (posVO == null)? "喵電感應" : posVO.getPoscontent()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>
</html>