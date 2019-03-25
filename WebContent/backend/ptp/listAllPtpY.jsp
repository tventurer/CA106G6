<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.ptp.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    PtpService ptpSvc = new PtpService();
    List<PtpVO> listStart = ptpSvc.get_start_ptp();
    pageContext.setAttribute("listStart",listStart);
%>
 

<html>
<head>
<title>所有行程內容資料 - listAllPtp.jsp</title>

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
<body class="app sidebar-mini rtl" >
<jsp:include page="/backend/backbar.jsp" />

<main class="app-content">
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
 
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">

              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
						<th>出發時間</th>
						<th>套裝行程出團編號</th>
						<th>套裝行程內容編號</th>
						<th>回程時間</th>
						<th>報名截止時間</th>
						<th>行程異動公告</th>
						<th>剩餘空位</th>
						<th>最少出團人數</th>
						<th>團體人數上限</th>
						<th>出團狀態</th>
						<th>上架時間</th>
						<th>修改</th>
						<th>刪除</th>
				  </tr>
                </thead>
    <tbody>
	<%@ include file="page3" %> 
	<c:forEach var="ptpVO" items="${listStart}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td><fmt:formatDate value="${ptpVO.ptpstart}" pattern="yyyy-MM-dd HH:MM E"/></td>
			<td>${ptpVO.ptpno}</td>
			<td>${ptpVO.pacno}</td>
			<td><fmt:formatDate value="${ptpVO.ptpend}" pattern="yyyy-MM-dd"/></td>
			<td><fmt:formatDate value="${ptpVO.ptpsigndle}" pattern="yyyy-MM-dd"/></td>
			<td>${ptpVO.ptpnotice}</td> 
			<td>${ptpVO.ptpvacancy}</td>
			<td>${ptpVO.ptpminmen}</td>
			<td>${ptpVO.ptpmaxmen}</td>
			<td>${ptpVO.ptpstatus}</td>
			<td><fmt:formatDate value="${ptpVO.ptptimelog}" pattern="yyyy-MM-dd HH:MM:ss"/></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ptpno"  value="${ptpVO.ptpno}">
			     <input type="hidden" name="action"	value="getOne_For_UpdateY"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/ptp/ptp" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="ptpno"  value="${ptpVO.ptpno}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
 <%@ include file="page4" %>
        </div>
      </div>
     </div>
     </div>
</main>
</body>
</html>