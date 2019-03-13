<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.acr.model.*"%>

<%
  AcrVO acrVO = (AcrVO) request.getAttribute("acrVO"); //AcrServlet.java (Concroller) 存入req的acrVO物件 (包括幫忙取出的acrVO, 也包括輸入資料錯誤時的acrVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>交易資料修改 - update_acr_input.jsp</title>

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
		 <h3>交易資料修改 - update_acr_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/catimage.gif" width="100" height="32" border="0">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="acr" name="form1">
<table>
	<tr>
		<td>交易編號:<font color=red><b>*</b></font></td>
		<td><%=acrVO.getAcrid()%></td>
	</tr>
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td><%=acrVO.getMemno()%></td>
	</tr>
	<tr>
		<td>交易金額:</td>
		<td><input type="TEXT" name="acrprice" size="45" value="<%=acrVO.getAcrprice()%>" /></td>
	</tr>
	<tr>
		<td>轉入/轉出:</td>
		<td><select size="1" name="acrsource">
		<%String acrsou[]={"轉出","轉入"};
		for(int i = 0; i<acrsou.length; i++){
			if(acrVO.getAcrsource()==i){
				out.print("<option value='" + i + "' selected='selected'>" + acrsou[i]+ "</option>");
			}else{
				out.print("<option value='" + i + "'>"+ acrsou[i]+ "</option>");
			}
		}%>
		</select></td>
	</tr>
	<tr>
		<td>匯款目的地:</td>
		<td><input type="TEXT" name="acrend" size="45"	value="<%=acrVO.getAcrend()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="acrid" value="<%=acrVO.getAcrid()%>">
<input type="hidden" name="memno" value="<%=acrVO.getMemno()%>">
<input type="submit" value="送出修改"></FORM>
</body>


</html>