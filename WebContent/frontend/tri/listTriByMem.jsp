<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.tri.model.*" %>

<jsp:useBean id="triSvc" class="com.tri.model.TriService"/>
<%
	String memno = (String)session.getAttribute("memno");
	List<TriVO> triList = triSvc.getAllByMemno(memno);
	request.setAttribute("triList", triList);
%>

<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap/css/bootstrap.min.css">

    <title>listTriByMem</title>
    
  </head>
  <jsp:include page="/frontend/navbar.jsp"/>
  <body>

<section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">我的行程</h1>
          </div>
        </div>
      </div>
    </div>
  </section>
  <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
  </c:if>
<section class="section-about">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12">
        <table class="table table-striped table-bordered">
          <thead>
            <tr>
              <th scope="col"></th>
              <th scope="col">會員帳號</th>
              <th scope="col">行程名稱</th>
              <th scope="col">開始日期</th>
              <th scope="col">結束日期</th>
              <th scope="col">人數</th>
              <th scope="col">狀態</th>
              <th scope="col">修改</th>
              <th scope="col">刪除</th>
            </tr>
          </thead>
          <tbody>
          
          
      <!--處理分頁 -->
	
			  <%@ include file="pages/page1.file" %>
          
          <% int count = pageIndex + 1; %> 
          <c:forEach var="triVO" items="${triList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" varStatus="s">
   
          	<tr>
              <th scope="row"><%= count++ %></th>
              <jsp:useBean id="memSvc" class="com.mem.model.MemService"/>
              <td>${memSvc.getOneMem(triVO.memno).mememail}</td>
              <td>${triVO.triname}</td>
              <td>${triVO.tribegdate}</td>
              <td>${triVO.trienddate}</td>
              <td>${triVO.tripeonum}</td>
              <td class="tristat">
              	<c:if test="${triVO.tristat == 0}">規劃中</c:if>
              	<c:if test="${triVO.tristat == 1}">審核中</c:if>
              	<c:if test="${triVO.tristat == 2}">
              		<form id="form${s.index}" name="form${s.index}" method="post" action="<%= request.getContextPath() %>/frontend/tod/tod">
              			<input type="hidden" name="trino" value="${triVO.trino}">
              			<input type="hidden" name="action" value="displayMemOrder">
              			<a href="javascript:document.form${s.index}.submit()">查看訂單</a>
              		</form>
              	</c:if>
              </td>
              <td>
              	<form method="post" action="<%= request.getContextPath() %>/frontend/tri/tri?whichPage=<%= whichPage %>&memno=<%= memno %>">      <!--傳送頁碼供修改後回到該頁面 -->
              	<input type="hidden" name="trino" value="${triVO.trino}">
              	<input type="hidden" name="come" value="frontend">
              	<input type="hidden" name="action" value="getOneForUpdate">
              	<button type="submit" class="modify">修改</button>
              	</form>
              </td>
              <td>
              	<form method="post" action="<%= request.getContextPath() %>/frontend/tri/tri?whichPage=<%= whichPage %>&memno=<%= memno %>">
              	<input type="hidden" name="trino" value="${triVO.trino}">
              	<input type="hidden" name="reqURL" value=<%= request.getServletPath() %>> 
              	<input type="hidden" name="action" value="delete">
              	<button type="submit" class="del">刪除</button>
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
</section>
<br>
<br> 
<br>
<jsp:include page="/frontend/footer.jsp"/>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="<%= request.getContextPath() %>/bootstrap/popper.min.js"></script>
    <script src="<%= request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
  </body>

<script>
var tristat = $(".tristat");
var modify = $(".modify");
var del = $(".del");
debugger
for(var i=0; i<tristat.length; i++){
	debugger
	if(tristat[i].innerText != "規劃中"){
		debugger
		modify[i].disabled = "disabled";
	}
	if(tristat[i].innerText == "查看訂單"){
		debugger
		del[i].disabled = "disabled";
	}
}
</script>

</html>