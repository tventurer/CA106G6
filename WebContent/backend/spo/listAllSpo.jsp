<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spo.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64" %>

<%
	SpoService spoSvc = new SpoService();
	List<SpoVO> spoList = spoSvc.getAll();
	request.setAttribute("spoList", spoList);
%>


<!DOCTYPE html>
<html>
<head>
<title>listAllSpo</title>
<style type="text/css">
#img1{
width: 100px;
height: 100px;
}
</style>
</head>
  <body class="app sidebar-mini rtl">
   
   <jsp:include page="/backend/backbar.jsp"/>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> 顯示所有景點</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">所有景點</h3>
            
            <c:if test="${not empty errorMsg}">
            	<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
            </c:if>
            
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>景點名稱</th>
                  <th>景點分類</th>
                  <th>城市</th>
                  <th>緯度</th>
                  <th>經度</th>
                  <th>地址</th>
                  <th>簡介</th>
                  <th>照片</th>
                  <th>修改</th>
                  <th>刪除</th>
                </tr>
              </thead>
              <tbody>
              
              <!--處理分頁 -->
		  
		  		<%@ include file="pages/page1.file" %>
          
          		<% int count = pageIndex + 1; %> 
          		<c:forEach var="spoVO" items="${spoList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
              
                <tr>
                  <td><%= count++ %></th>
	              <td>${spoVO.sponame}</td>
	              <td>${spoVO.spoclass}</td>
	              <td>${spoVO.spocity}</td>
	              <td>${spoVO.spolat}</td>
	              <td>${spoVO.spolong}</td>
	              <td>${spoVO.spoaddr}</td>
	              <td>${spoVO.spocontent}</td>
	              <td>
	              <c:set var="spopic" value="${spoVO.spopic}"/>
	   			  <%
	//			  	SpoVO spoVO = (SpoVO)request.getAttribute("spoVO");
	//			  	byte[] b = spoVO.getSpopic(); 此行有未知NullpointerException (DAO update)
	   			  	byte[] b = (byte[])pageContext.getAttribute("spopic");
	        	  	String encodeImg = null;
	        	  	if(b != null){
	        	  		encodeImg = Base64.encode(b);%>
	        	  		<img src="data:image/jpg;base64,<%= encodeImg %>" id="img1">
	        	  	<%}%>
	              </td>
	              <td>
	              	<form method="post" action="spo">
	              	<input type="hidden" name="whichPage" value=<%= whichPage %>>
	              	<input type="hidden" name="spono" value="${spoVO.spono}">
	              	<input type="hidden" name="action" value="getOneForUpdate">
	              	<button type="submit">修改</button>
	              	</form>
	              </td>
	              <td>
	              	<form method="post" action="spo">
	              	<input type="hidden" name="whichPage" value="${param.whichPage}">
	              	<input type="hidden" name="spono" value="${spoVO.spono}">
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