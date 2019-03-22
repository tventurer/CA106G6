<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*" %>
<%
  MemService memSvc = new MemService();
  MemVO memVO = memSvc.getOneMem(request.getParameter("memno"));
  request.setAttribute("memVO", memVO);
%>
<c:if test="${memVO == null}">
  <c:redirect url="/404.jsp"><c:param name="errorMsgs" value="查無會員編號"/></c:redirect>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>${memVO.memacc}的首頁</title>
</head>
<body>
<table>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
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
	
		
		<tr ${(memVO.memno)}>
			<td>${memVO.memno}</td>
			<th>${memVO.memacc}</th>
			<th>${memVO.mememail}</th>
			<th>${memVO.mememailvalid == 1 ? "email驗證通過" : "尚未通過email驗證"}</th>
			<th>${memVO.memrealname}</th>
			<th>${memVO.memengname}</th>
			<th>${memVO.memphone}</th>
			<th>${memVO.membirth}</th>
			<th>${memVO.memaddr}</th>
			<th>${memVO.memidno}</th>
			<th>${memVO.membankacc}</th>
			<c:if test="${memno == memVO.memno}">
			  <td>
			    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem" style="margin-bottom: 0px;">
			       <input type="submit" value="修改">
			       <input type="hidden" name="memno"  value="${memVO.memno}">
			       <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			       <input type="hidden" name="action"	value="getOne_For_Update"></FORM><br>
			       <a href="<%=request.getContextPath()%>/frontend/pos/ListByMemno.jsp?memno=${memVO.memno}">查看所有貼文</a><br><br>
                   <a href="<%=request.getContextPath()%>/frontend/mpm/mpm?action=list_my_pm">查看私人訊息</a>
			  </td>
			</c:if>
			<c:if test="${memno == memVO.memno}">
              <form action="<%=request.getContextPath()%>/EmailValidator" method="post">
	          <input type="hidden" name="action" value="ask_validation_email">
		      <input type="submit" value="申請驗證信">
	          </form>
			</c:if>
		</tr>
</table>
</body>
</html>