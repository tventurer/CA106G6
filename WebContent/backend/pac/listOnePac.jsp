<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pac.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  PacVO pacVO = (PacVO) request.getAttribute("pacVO"); //PacServlet.java(Concroller), 存入req的pacVO物件
%>
<html>
<head>
<title>員工資料 - listOnePac.jsp</title>

<style>
  table#table-1 {
	background-color: orange;
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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOnePac.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>套裝行程編號</th>
		<th>管理員編號</th>
		<th>套裝行程名稱</th>
		<th>旅遊國家</th>
		<th>旅遊城市</th>
		<th>行程總天數</th>
		<th>行程價格</th>
		<th>行程訂金</th>
		<th>特色標籤</th>
		<th>行程內容</th>
		<th>行程特色1</th>
		<th>行程特色2</th>
		<th>注意事項</th>
		<th>套裝狀態</th>
		<th>修改</th>
		<th>刪除</th>
		
		
		
	</tr>
	<tr>
		<td><%=pacVO.getPacno()%></td>
		<td><%=pacVO.getEmpno()%></td>
		<td><%=pacVO.getPacname()%></td>
		<td><%=pacVO.getPaccountry()%></td>
		<td><%=pacVO.getPaccity()%></td>
		<td><%=pacVO.getPactotalday()%></td>
		<td><%=pacVO.getPacprice()%></td>
		<td><%=pacVO.getPacdeposit()%></td>
		<td><%=pacVO.getPacdiv()%></td>
		<td><%=pacVO.getPaccontent()%></td>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1"></td>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=2"></td>
		<td><%=pacVO.getPacremark()%></td>
		<td><%=pacVO.getPacstatus()%></td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" style="margin-bottom: 0px;">
<%-- 			  <%=request.getContextPath()%>/pac/pac --%>
			     <input type="submit" value="修改">
			     <input type="hidden" name="pacno"  value="${pacVO.pacno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="pacno"  value="${pacVO.pacno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
 	</tr>
</table>

</body>
</html>