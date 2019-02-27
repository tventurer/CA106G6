<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.emp.model.*" %>

<%  
	EmpService EmpSvc = new EmpService();
    List<EmpVO> list = EmpSvc.getAll();
	pageContext.setAttribute("list",list);  //取得值為何要  
%>

<!DOCTYPE html>
<html>
<head>
<title>所有管理員資料 - listAllEmp.jsp</title>

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
<body>

<table id="table-1">
	<tr>
		<td>
			<h3>所有管理員資料</h3>
			<h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
		</td>
	</tr>
</table>

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
		<td>管理員編號</td>
		<td>姓名</td>
		<td>密碼</td>
		<td>性別</td>
		<td>電話</td>
		<td>手機</td>
		<td>email</td>
		<td>部門</td>
		<td>職務</td>
		<td>薪資</td>
		<td>到職日</td>
		<td>照片</td>
		<td>修改</td>
		<td>刪除</td>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${empVO.empno}</td>
			<td>${empVO.empname}</td>
			<td>${empVO.emppwd}</td>
			<td>${empVO.empgen}</td>
			<td>${empVO.empphone}</td>
			<td>${empVO.empcell}</td>
			<td>${empVO.empmail}</td>
			<td>${empVO.empdept}</td>
			<td>${empVO.empposi}</td>
			<td>${empVO.empsal}</td>
			<td>${empVO.empdoe}</td>
			<td>
				<img src="emp?empno=${empVO.empno}">
			</td>
			<td>
			    <form method="post" action="<%=request.getContextPath()%>/backend/emp/emp" style="margin-bottom: 0px;">
			        <input type="submit" value="修改">
			        <input type="hidden" name="empno"  value="${empVO.empno}">
			        <input type="hidden" name="action"	value="getOne_For_Update">
			    </form>
			</td>
			<td>
			    <form method="post" action="<%=request.getContextPath()%>/backend/emp/emp" style="margin-bottom: 0px;">
			        <input type="submit" value="刪除">
			        <input type="hidden" name="empno"  value="${empVO.empno}">
			        <input type="hidden" name="action" value="delete">
			    </form>
			</td>	
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>