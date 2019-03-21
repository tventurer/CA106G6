<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.pcd.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService" />
<jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService" />

<%
   
 	//String memno=request.getParameter("memno");
	String memno=(String)session.getAttribute("memno");
    Set<PcdVO> set = pcdSvc.member_query(memno);
    pageContext.setAttribute("set",set);
 //   pageContext.setAttribute("pcdVO", pcdVO);
   
%>


<html>
<head>
<title>會員查詢訂單 - listAllPcd.jsp</title>

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
    border: 10px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body>
<jsp:include page="/frontend/navbar.jsp"/>

<section class="section-property section-t8">
    <section class="section-property section-t8">
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
會員查詢報名訂單
<table>
	<tr>
		<th>套裝訂單編號</th>
		<th>套裝出團內容編號</th>
		<th>會員編號</th>
		<th>參加人數</th>
		<th>繳費日期</th>
		<th>繳費金額</th>
		<th>費用狀態</th>
		<th>第二聯絡人</th>
		<th>參團人資料</th>
		<th>需求註記</th>
		<th>修改</th>
		
	</tr>
	<c:forEach var="pcdVO" items="${set}">
		<tr ${(pcdVO.pcdno==param.pcdno) ? 'bgcolor=#CCCCFF':''}>
			<td>${pcdVO.pcdno}</td>
			<td>${pcdVO.ptpno}</td>
			<td>${pcdVO.memno}</td>
			<td>${pcdVO.pcdtripmen}</td> 
			<td><fmt:formatDate value="${pcdVO.pcdordday}" pattern="yyyy-MM-dd"/></td>
			<td>${pcdVO.pcdmoney}</td>
			<td>
			<c:if test="${pcdVO.pcdstatus == 0}">未繳費</c:if>
			<c:if test="${pcdVO.pcdstatus == 1}">已繳全額</c:if>
			<c:if test="${pcdVO.pcdstatus == 2}">已繳訂金</c:if>
			<c:if test="${pcdVO.pcdstatus == 3}">取消訂單</c:if>
			</td>
			<td>${pcdVO.pcdsecphone}</td>
			<td>${pcdVO.pcdfamdata}</td>
			<td>${pcdVO.pcdmark==null ? '' : pcdVO.pcdmark}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="pcdno"  value="${pcdVO.pcdno}">
			     <input type="hidden" name="action"	value="getOne_For_UpdateX"></FORM>
			</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="刪除"> -->
<%-- 			     <input type="hidden" name="pcdno"  value="${pcdVO.pcdno}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>
</section>
</section>
</body>
</html>