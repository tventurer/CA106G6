<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>


<%
	PahService pahSvc = new PahService();
	List<PahVO> list = pahSvc.getall();
	pageContext.setAttribute("list",list);
%>
<%-- 新增一個全部機加酒商品List --%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	
<title>機加酒商品列表</title>

</head>

<body class="app sidebar-mini rtl">

<!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>


<%-- 錯誤驗證 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<!---------------------------------標題 ------------------------------------> 
    <main class="app-content">    
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i>機加酒商品列表</h1>
          <p>T-Venture</p>
        </div>
      </div>

<!---------------------------------所有上架商品 ------------------------------------>       
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
             	<h2> 商品上架中</h2>
             	<h8>(點選編號修改商品)</h8>
                <thead>
                  <tr>
					<th>機加酒編號</th>
					<th>機加酒標題</th>
					<th>價格</th>
					<th>國家</th>
					<th>數量</th>
					<th>出發日期</th>
					<th>回程日期</th>
					<th>下架日期</th>
					<th>商品狀態</th>
					<th>管理員編號</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="pahVO" items="${list}" varStatus="s">
						<c:if test="${pahVO.pahstatus==0}">
							<c:if test="${sucessUpdate.pahno==pahVO.pahno}">
								<tr class="table-success">
							</c:if>
							<c:if test="${sucessUpdate.pahno!=pahVO.pahno}">
								<tr>
							</c:if>
								<td><a href="<%=request.getContextPath()%>/pah/pahcontrol?action=oneUpdatePah&pahno=${pahVO.pahno}">${pahVO.pahno}</a></td>
								<td>${pahVO.pahname}</td>
								<td>${pahVO.pahprice}</td> 
								<td>${pahVO.pahcountry}</td>
								<td>${pahVO.pahnum}</td>
								<td>${pahVO.pahstdate}</td>
								<td>${pahVO.pahenddate}</td>
								<td>${pahVO.pahdown}</td>
								<td>上架中</td>
								<td>${pahVO.empno}</td>
							</tr>
						</c:if>
					</c:forEach>                    
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      
<!---------------------------------已下架商品 ------------------------------------>             
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
             	<h2> 商品已下架</h2>
             	<h8>(點選編號修改商品)</h8>
                <thead>
                  <tr>
					<th>機加酒編號</th>
					<th>機加酒標題</th>
					<th>價格</th>
					<th>國家</th>
					<th>數量</th>
					<th>出發日期</th>
					<th>回程日期</th>
					<th>下架日期</th>
					<th>商品狀態</th>
					<th>管理員編號</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="pahVO" items="${list}" varStatus="s">
						<c:if test="${pahVO.pahstatus==1}">
							<c:if test="${sucessUpdate.pahno==pahVO.pahno}">
								<tr class="table-success">
							</c:if>
							<c:if test="${sucessUpdate.pahno!=pahVO.pahno}">
								<tr>
							</c:if>
								<td><a href="<%=request.getContextPath()%>/pah/pahcontrol?action=oneUpdatePah&pahno=${pahVO.pahno}">${pahVO.pahno}</a></td>
								<td>${pahVO.pahname}</td>
								<td>${pahVO.pahprice}</td> 
								<td>${pahVO.pahcountry}</td>
								<td>${pahVO.pahnum}</td>
								<td>${pahVO.pahstdate}</td>
								<td>${pahVO.pahenddate}</td>
								<td>${pahVO.pahdown}</td>
								<td>已下架</td>
								<c:set var="pic1" value="${pahVO.pahpc1}"></c:set>
								<c:set var="pic2" value="${pahVO.pahpc2}"></c:set>
								<c:set var="pic3" value="${pahVO.pahpc3}"></c:set>
								<c:set var="pic4" value="${pahVO.pahpc4}"></c:set>
								<c:set var="pic5" value="${pahVO.pahpc5}"></c:set>
								<td>${pahVO.empno}</td>								
							</tr>
						</c:if>
					</c:forEach>                   
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>


</body>
</html>









<!---------------- 參考程式碼 ----------------------->
<%-- <c:set var="pic1" value="${pahVO.pahpc1}"></c:set> --%>
<%-- <c:set var="pic2" value="${pahVO.pahpc2}"></c:set> --%>
<%-- <c:set var="pic3" value="${pahVO.pahpc3}"></c:set> --%>
<%-- <c:set var="pic4" value="${pahVO.pahpc4}"></c:set> --%>
<%-- <c:set var="pic5" value="${pahVO.pahpc5}"></c:set> --%>
<%-- <% --%>
<!--  for(int i=1; i<=5; i++){  -->
<!--  byte b[] = (byte[])pageContext.getAttribute("pic"+i);  -->
<!--  String encoding = null;  -->
<!--  if(b != null){  -->
<!--  encoding = Base64.encode(b); -->
<%-- %>  --%>
<%-- <td><img src="data:image/jpg;base64,<%=encoding %>"></td> --%>
<%-- <% --%>
<%-- }else{%><td></td><%}}%>  --%>