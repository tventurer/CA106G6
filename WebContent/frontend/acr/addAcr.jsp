<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.acr.model.*"%>

<%
  AcrVO acrVO = (AcrVO) request.getAttribute("acrVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>交易紀錄新增 - addAcr.jsp</title>

<style>
  table#table-1 {
	background-color: #8B9BAB;
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
  #title-1{
  color:white;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3 id="title-1">交易紀錄新增 - addAcr.jsp</h3></td><td>
		 <h4><a href="select_page.jsp">回首頁</a><img src="images/icondo.jpg"  height="90" border="0"></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列(最後更改) --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="acr" name="form1">
<table>
	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="memno" size="45" 
			 value="<%= (acrVO==null)? "MEM000001" : acrVO.getMemno()%>" /></td>
	</tr>
	<tr>
		<td>交易金額:</td>
		<td><input type="TEXT" name="acrprice" size="45"
			 value="<%= (acrVO==null)? "10000" : acrVO.getAcrprice()%>" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>轉入/轉出:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="acrsource"> -->
<!-- 			<option value="0">轉出</option> -->
<!-- 			<option value="1">轉入</option> -->
<!-- 		</select></td> -->
<!-- 	</tr> -->
	<tr>
		<td>匯款目的地:</td>
		<td><input type="TEXT" name="acrend" size="45"
			 value="<%= (acrVO==null)? "儲值" : acrVO.getAcrend()%>" /></td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="acrsource" value="1">
<input type="submit" value="送出新增"></FORM>
</body>




</html>


