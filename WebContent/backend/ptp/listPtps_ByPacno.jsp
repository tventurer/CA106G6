<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ptp.model.*"%>
<%@ page import="com.pac.model.*"%>


<jsp:useBean id="listPtps_ByPacno" scope="session" type="java.util.Set<PtpVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />

<html>
<head><title>出團細節 - listPacs_ByPacno.jsp</title>

<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }

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
  .table-bordered {
    border: 1px solid #dee2e6;
    background-color: white;
	}
	
	.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
    background-color: #f8f9fa;
}
</style>

</head>
<body class="app sidebar-mini rtl">
	<jsp:include page="/backend/backbar.jsp" />
<%-- <% System.out.println(pacVO.getPacno()) ;%> --%>
<!-- <table id="table-2"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3> -->
<%-- 		    	<font color='#99FF99'>${triname}</font>出團內容 - listPtps_ByPacno.jsp</h3> --%>
<%-- 		 <h4><a href="../ptp/addPtp.jsp?pacno=${pacno}&pacname=${triname}"><img src="images/back1.gif" width="100" height="32" border="0">新增出團時間</a></h4> --%>
<!-- 	</td></tr> -->
<!-- </table> -->
<div class="row justify-content-center">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title"><font color='#0066FF'>${triname}</font><br></h3>
			<h4><a href="../ptp/addPtp.jsp?pacno=${pacno}&pacname=${triname}"><img src="images/world.jpg" width="100" height="100" border="0">新增出團時間</a></h4>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="table table-hover table-bordered" style="background-color: white;">
	<thead>
	<tr>
		<th>價格</th>
		<th>行程編號</th>
		<th>起始日期</th>
		<th>結束日期</th>
		<th>截止日期</th>
		<th>改變公告</th>
		<th>剩餘空位</th>
		<th>幾人成行</th>
		<th>行程狀態</th>
		<th>上架時間</th>
		<th>修改</th>
		<th>刪除</th>
		
	</tr>
	</thead>
<%-- 	<%@ include file="page1" %> --%>
	<tbody style="background-color: white;">
	<c:forEach var="ptpVO" items="${listPtps_ByPacno}" >
		<tr ${(ptpVO.ptpno==param.ptpno) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色-->
			<td><c:forEach var="pacVO" items="${pacSvc.all}">
                    <c:if test="${ptpVO.pacno==pacVO.pacno}">
	                    ${pacVO.pacprice}
                    </c:if>
                </c:forEach>
			</td>
			<td>${ptpVO.ptpno}</td>
			<td><fmt:formatDate value="${ptpVO.ptpstart}" pattern="yyyy-MM-dd HH:MM E"/></td>
			<td><fmt:formatDate value="${ptpVO.ptpend}" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${ptpVO.ptpsigndle}" pattern="yyyy-MM-dd"/></td>
			<td>${ptpVO.ptpnotice}</td>
			<td>${ptpVO.ptpvacancy}</td>
			<td>${ptpVO.ptpminmen}</td>
			<td>
			<c:if test="${ptpVO.ptpstatus == 0}">報名中</c:if>
			<c:if test="${ptpVO.ptpstatus == 1}">額滿</c:if>
			<c:if test="${ptpVO.ptpstatus == 2}">已成團</c:if>
			<c:if test="${ptpVO.ptpstatus == 3}">保證成團</c:if>
			</td>
			<td><fmt:formatDate value="${ptpVO.ptptimelog}" pattern="yyyy-MM-dd HH:MM E"/></td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			    <input type="submit" value="修改"> 
			    <input type="hidden" name="ptpno"      value="${ptpVO.ptpno}">
			    <input type="hidden" name="requestURL" value="<%=request.getContextPath()%>/backend/ptp/listAllPacX.jsp?whichPage=${whichPage}"><!--送出本網頁的路徑給Controller--><!-- 目前尚未用到  -->
				<input type="hidden" name="action"	   value="getOne_For_UpdateX"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="ptpno"      value="${ptpVO.ptpno}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="action"     value="delete_query"></FORM>
			</td>
		</tr>
	</c:forEach>
	</tbody>
<%-- 	<%@ include file="page2" %>       --%>
</table>

<!-- <br>本網頁的路徑:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b> --%>

</body>
</html>