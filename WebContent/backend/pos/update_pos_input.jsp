<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pos.model.*" %>
<!DOCTYPE html>

<%
  PosVO posVO = (PosVO) request.getAttribute("posVO");
%>
<html>
<head>
<meta charset="UTF-8">
<title>文章資料修改 - update_pos_input.jsp</title>

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
		 <h3>員工資料修改 - update_emp_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/pos/select_page.jsp"><img src="<%=request.getContextPath()%>/backend/pos/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

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
		<td>文章編號:<font color=red><b>*</b></font></td>
		<td><%=posVO.getPosno()%></td>
	</tr>
	<tr>
		<td>文章標籤:</td>
		<td><input type="TEXT" name="tagno" size="45" value="<%=posVO.getTagno()%>" /></td>
	</tr>
	<tr>
		<td>文章標題:</td>
		<td><input type="TEXT" name="postitle" size="45" value="<%=posVO.getPostitle()%>" /></td>
	</tr>
	<tr>
		<td>文章內容:</td>
		<td><input type="TEXT" name="poscontent" size="45" value="<%=posVO.getPoscontent()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="posno" value="<%=posVO.getPosno()%>">
<input type="hidden" name="memno" value="<%=posVO.getMemno()%>">
<input type="hidden" name="postime" value="<%=posVO.getPostime()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>