<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tod.model.*" %>
<%@ page import="java.util.*" %>

<%
	TodService todSvc = new TodService();
	List<TodVO> todList = todSvc.getAll();
	request.setAttribute("todList", todList);
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
          <h1><i class="fa fa-th-list"></i> 顯示所有自由行訂單</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">所有自由行訂單</h3>
            
            <c:if test="${not empty errorMsg}">
            	<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
            </c:if>
            
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>訂單編號</th>
                  <th>會員編號</th>
                  <th>行程名稱</th>
                  <th>管理員編號</th>
                  <th>報價總金額</th>
                  <th>繳付截止日</th>
                  <th>訂單送出日期</th>
                  <th>狀態</th>
                  <th>修改</th>
                  <th>刪除</th>
                </tr>
              </thead>
              <tbody>
              
              <!--處理分頁 -->
		  
		  		<%@ include file="pages/page1.file" %>
          
          		<% int count = pageIndex + 1; %> 
          		<c:forEach var="todVO" items="${todList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
              
                <tr>
                  <td><%= count++ %></th>
	              <td>${todVO.todno}</td>
	              <td>${todVO.memno}</td>
	              <jsp:useBean id="triSvc" class="com.tri.model.TriService" />
	              <td>${triSvc.getOneTri(todVO.trino).triname}</td>
	              <td>${todVO.empno}</td>
	              <td>${todVO.todquo}</td>
	              <td>${todVO.todddl}</td>
	              <td>${todVO.toddate}</td>
	              <td>
	              	<c:if test="${todVO.todstat == 0}">待付款</c:if>
	              	<c:if test="${todVO.todstat == 1}">已付款待出貨</c:if>
	              	<c:if test="${todVO.todstat == 2}">已出貨</c:if>
	              	<c:if test="${todVO.todstat == 3}">取消訂單</c:if>
	              	<c:if test="${todVO.todstat == 4}">逾期未付款</c:if>
	              	<c:if test="${todVO.todstat == 5}">待退款</c:if>
	              	<c:if test="${todVO.todstat == 6}">已退款</c:if>
	              </td>
	              <td>
	              	<form method="post" action="tod">
	              	<input type="hidden" name="whichPage" value=<%= whichPage %>>
	              	<input type="hidden" name="todno" value="${todVO.todno}">
	              	<input type="hidden" name="action" value="getOneForUpdate">
	              	<button type="submit">修改</button>
	              	</form>
	              </td>
	              <td>
	              	<form method="post" action="<%= request.getContextPath() %>/backend/tod/tod">
	              	<input type="hidden" name="reqURL" value=<%= request.getServletPath() %>>
	              	<input type="hidden" name="whichPage" value=<%= whichPage %>>
	              	<input type="hidden" name="todno" value="${todVO.todno}">
	              	<input type="hidden" name="action" value="delete">
	              	<button type="submit">刪除</button>
	              	</form>
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
</html>