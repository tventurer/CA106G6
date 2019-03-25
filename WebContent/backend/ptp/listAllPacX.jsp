<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.ptp.model.*"%>
<%@ page import="com.pac.model.*"%>

<jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />
<jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService" />
<%
List<PacVO> list = pacSvc.getAll();
pageContext.setAttribute("list",list);
List<PtpVO> listptp = ptpSvc.getAll();
pageContext.setAttribute("listptp",listptp);
%>

<html>
<head><title>所有行程細節 - listAllPacX.jsp</title>
</head>
<body class="app sidebar-mini rtl" >
	<jsp:include page="/backend/backbar.jsp" />

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<style>

</style>
<main class="app-content">
	<div class="container-fluid">
		<div class="row">
		 <div class="col-6">
			          <div class="tile">
			            <h3 class="tile-title">行程總覽</h3>
			            <table class="table table-hover table-bordered" >
			              <thead style="background-color: white;">
			                <tr>
			                  <th>行程編號</th>
			                  <th>行程名稱</th>
			                  <th>行程價格</th>
			                  <th>修改</th>
							  <th>查詢細節時間</th>
			                </tr>
			              </thead>
			              <tbody style="background-color: white;">
			<%@ include file="page1" %>              
		    <c:forEach var="pacVO" items="${pacSvc.all}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr ${(pacVO.pacno==param.pacno) ? 'bgcolor=#CCCCFF':''}>
			<td>${pacVO.pacno}</td>
			<td>${pacVO.pacname}</td>
			<td>${pacVO.pacprice}</td>
			           <td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			<input type="submit" value="修改"  > 
			<input type="hidden" name="pacno" value="${pacVO.pacno}">
			<input type="hidden" name="empno" value="${pacVO.empno}">
			   <input type="hidden" name="requestURL" value="/backend/ptp/listAllPac.jsp">
			   <input type="hidden" name="action" value="getOne_For_Update_Pac"></FORM>
			</td>
			<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" style="margin-bottom: 0px;">
			<input type="submit" value="送出查詢"> 
			<input type="hidden" name="pacno" value="${pacVO.pacno}">
				<input type="hidden" name="triname" value="${pacVO.pacname}">
			    <input type="hidden" name="action" value="listPtps_ByPacno_B"></FORM>
			</td>
			        </tr>
			</c:forEach>
			</tbody>
			</table>
			<%@ include file="page2" %>            
			</div>
		</div>       
		                        
			<div class="col-6">
				 <%if (request.getAttribute("listPtps_ByPacno")!=null){%>
					<jsp:include page="listPtps_ByPacno.jsp" />
				 <%} %>  
			</div> 
		</div>
	</div>                
          
                
              
</main>




</body>
</html>