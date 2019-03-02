<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*" %>
<%@ page import="com.emr.model.*" %>


<!DOCTYPE html>
<html>
<head>
<title>CA106G6 Employee Authorization</title>
	
	<style>
  		table#table-1 {
			width: 450px;
			background-color: #CCCCFF;
			margin-top: 5px;
			margin-bottom: 10px;
		    border: 3px ridge Gray;
		    height: 80px;
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
	
</head>
<body bgcolor="white">

<table id="table-1">
	<tr><td><h3>CA106G6 管理員授權頁面</h3><h4>( MVC )</h4></td></tr>
</table>

<p>CA106G6 管理員授權頁面首頁</p>

<h3>資料查詢:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li><a href="listAllEma.jsp">列出</a>所有管理員授權項目</li>
	<li>
		<form action="ema" method="post">
			<b>輸入管理員編號(如 EMP000001):</b>
			<input type="text" name="empno">
			<br>
			<b>輸入權限編號(如 EMR000001):</b>
			<input type="text" name="emrno">
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
	
	<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
	<jsp:useBean id="emrSvc" scope="page" class="com.emr.model.EmrService" />
		
	<li>
		<form action="ema" method="post">
			<b>選擇管理員編號:</b>
			<select name="empno">
				<c:forEach var="empVO" items="${empSvc.all}">
					<option value="${empVO.empno}">${empVO.empno}
				</c:forEach>
			</select>
			<br>
			<b>選擇權限編號:</b>
			<select name="emrno">
				<c:forEach var="emrVO" items="${emrSvc.all}">
					<option value="${emrVO.emrno}">${emrVO.emrno}
				</c:forEach>
			</select>
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
	
	<li>
		<form action="ema" method="post">
			<b>選擇管理員名稱:</b>
			<select name="empno">
				<c:forEach var="empVO" items="${empSvc.all}">
					<option value="${empVO.empno}">${empVO.empname}
				</c:forEach>
			</select>
			<br>
			<b>選擇權限名稱:</b>
			<select name="emrno">
				<c:forEach var="emrVO" items="${emrSvc.all}">
					<option value="${emrVO.emrno}">${emrVO.emrname}
				</c:forEach>
			</select>
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</form>
	</li>
	
</ul>

<h3>管理員權限管理</h3>

<ul>
	<li><a href="addEma.jsp">新增</a>一筆管理員權限資料</li>
</ul>

</body>
</html>