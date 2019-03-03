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
		 <h3>套裝行程新增 - addPac.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/003.jpg" width="100" height="100" border="0">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" name="form1" enctype="multipart/form-data">
<table>
	
<!-- 加了會500  這個類似是前面有編號出現	<tr> -->
<!-- 		<td>套裝編號:<font color=red><b>*</b></font></td> -->
<%-- 		<td><%=pacVO.getPacno()%></td> --%>
<!-- 	</tr> -->

	<tr>
		<td>行程名稱:</td>
		<td><input type="TEXT" name="pacname" size="45" 
			 value="<%= (pacVO==null)? "好多名字" : pacVO.getPacname()%>" /></td>
	</tr>
	<tr>
		<td>管理員編號:</td>
		<td><input type="TEXT" name="empno" size="45"
			 value="<%= (pacVO==null)? "EMP000001" : pacVO.getEmpno()%>" /></td>
	</tr>
	<tr>
		<td>旅遊國家:</td>
		<td><input type="TEXT" name="paccountry" size="45"
			 value="<%= (pacVO==null)? "國家" : pacVO.getPaccountry()%>" /></td>
	</tr>
	<tr>
		<td>旅遊城市:</td>
		<td><input type="TEXT" name="paccity" size="45"
			 value="<%= (pacVO==null)?"城市" : pacVO.getPaccity()%>" /></td>
	</tr>
	<tr>
		<td>旅遊天數:</td>
		<td><input type="TEXT" name="pactotalday" size="45"
			 value="<%= (pacVO==null)? "6" : pacVO.getPactotalday()%>" /></td>
	</tr>
	
	<tr>
		<td>團費價格:</td>
		<td><input type="TEXT" name="pacprice" size="45"
			 value="<%= (pacVO==null)? "88000" : pacVO.getPacprice()%>" /></td>
	</tr>
	
	<tr>
		<td>預繳訂金:</td>
		<td><input type="TEXT" name="pacdeposit" size="45"
			 value="<%= (pacVO==null)? "6666" : pacVO.getPacdeposit()%>" /></td>
	</tr>
	<tr>
		<td>特色標籤:</td>
		<td><input type="TEXT" name="pacdiv" size="45"
			 value="<%= (pacVO==null)? "特色標籤" : pacVO.getPacdiv()%>" /></td>
	</tr>
	
	<tr>
		<td>行程內容:</td>
		<td><input type="TEXT" name="paccontent" size="45"
			 value="<%= (pacVO==null)? "內容" : pacVO.getPaccontent()%>" /></td>
	</tr>
	<tr>
		<td>行程特色1:</td>
		<td><input type="file" name="pactchar1" size="45"
			 value="<%= (pacVO==null)?"請選擇圖片": pacVO.getPactchar1()%>" id="photo"/>
			 <img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacVO.getPactchar1()"  width="100" height="100">	
			 </td>
	</tr>
	<tr>
		<td>行程特色2:</td>
		<td><input type="file" name="pactchar2" size="45"
			 value="<%= (pacVO==null)? "" : pacVO.getPactchar2()%>" id="photo"/>
			<img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacVO.getPactchar2()"  width="100" height="100">	 
		</td>
	</tr>
	
	<tr>
		<td>注意事項:</td>
		<td>
			<input type="TEXT" name="pacremark" size="45"
				 value="<%= (pacVO==null)? "注意事項": pacVO.getPacremark()%>" /></td>
	</tr>
	<tr>
		<td>行程狀況:</td>
		<td>
			<select name="pacstatus">
				<option value=0>可出團
				<option value=1>不再出團
			</select> 
			 	
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>
</html>