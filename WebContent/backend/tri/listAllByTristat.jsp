<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tri.model.*" %>
<%@ page import="java.util.*" %>

<%
	TriService triSvc = new TriService();
	List<TriVO> triList = triSvc.getAllByTristat(1);
	request.setAttribute("triList", triList);
%>


<!DOCTYPE html>
<html>
  <head>
    <title>listAllTod</title>
  </head>
  <body class="app sidebar-mini rtl">
    
    <jsp:include page="/backend/backbar.jsp"/>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> 顯示所有待報價行程</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">待報價行程</h3>
            
            <c:if test="${not empty errorMsg}">
            	<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
            </c:if>
            
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>行程編號</th>
                  <th>會員編號</th>
                  <th>行程名稱</th>
                  <th>開始日期</th>
                  <th>結束日期</th>
                  <th>人數</th>
                  <th>狀態</th>
                  <th>報價</th>
                </tr>
              </thead>
              <tbody>
              
              <!--處理分頁 -->
		  
		  		<%@ include file="pages/page1.file" %>
          
          		<% int count = pageIndex + 1; %> 
          		<c:forEach var="triVO" items="${triList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
              
                <tr>
                  <td><%= count++ %></th>
	              <td>${triVO.trino}</td>
	              <td>${triVO.memno}</td>
	              <td>${triVO.triname}</td>
	              <td>${triVO.tribegdate}</td>
	              <td>${triVO.trienddate}</td>
	              <td>${triVO.tripeonum}</td>
	              <td class="tristat">
	              	<c:if test="${triVO.tristat == 0}">規劃中</c:if>
	              	<c:if test="${triVO.tristat == 1}">審核中</c:if>
	              	<c:if test="${triVO.tristat == 2}">已報價</c:if>
	              </td>
	              <td>
	              	<input class="quo" type="button" value="報價" onclick="location.href='<%= request.getContextPath() %>/backend/tod/addTod.jsp?trino=${triVO.trino}&whichPage=<%= whichPage %>&memno=${triVO.memno}'">
	              </td>
                </tr>
                
                </c:forEach>
              
              </tbody>
            </table>
            
            <%@ include file="pages/page2.file" %>
            
          </div>
        </div>
      </div>
    </main>

  </body>
  
<script>
var tristat = $(".tristat");
var quo = $(".quo");
debugger
for(var i=0; i<tristat.length; i++){
	debugger
	if(tristat[i].innerText == "規劃中" || tristat[i].innerText == "已報價"){
		debugger
		quo[i].disabled = "disabled";
	}
}
</script>
  
</html>