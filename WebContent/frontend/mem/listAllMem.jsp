<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%
	MemService memSvc = new MemService();
	List<MemVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員資料 - listAllMem.jsp</title>

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
	width: 800px;
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

<table id="table-1">
	<tr><td>
		 <h3>所有會員資料 - listAllMem.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/mem/select_page.jsp">
		 <img src="<%=request.getContextPath()%>/frontend/mem/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>email</th>
		<th>email驗證狀態</th>
		<th>會員姓名</th>
		<th>英文姓名</th>
		<th>電話</th>
		<th>出生年月日</th>	
		<th>地址</th>
		<th>身份證字號</th>
		<th>銀行帳號</th>	
	</tr>
	
	<%@ include file="page1.file" %> 
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr ${(memVO.memno == param.memno) ? 'bgcolor=#CCCCFF':''}>
			<td>${memVO.memno}</td>
			<th>${memVO.memacc}</th>
			<th>${memVO.mempwd}</th>
			<th>${memVO.mememail}</th>
			<th>${memVO.mememailvalid}</th>
			<th>${memVO.memrealname}</th>
			<th>${memVO.memengname}</th>
			<th>${memVO.memphone}</th>
			<th>${memVO.membirth}</th>
			<th>${memVO.memaddr}</th>
			<th>${memVO.memidno}</th>
			<th>${memVO.membankacc}</th>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="memno"  value="${memVO.memno}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>