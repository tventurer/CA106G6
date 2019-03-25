<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="com.phd.model.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">

	
<title>會員訂單列表</title>

<meta charset="UTF-8">

</head>
<body class="app sidebar-mini rtl">

<!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>


<%-- 錯誤驗證 --%>
<c:if test="${not empty errorMsgs}">
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
          <h1><i class="fa fa-th-list"></i>已成交訂單</h1>
          <p>T-Venturer</p>
        </div>
      </div>

<!---------------------------------所有上架商品 ------------------------------------>       
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
             	<h2> 成交訂單列表</h2>
             	<hr>
                <thead>
                  <tr>
					<th>機加酒編號</th>
					<th>主要聯絡人姓名</th>
					<th>電話號碼</th>
					<th>E-Mail</th>
					<th>訂單成立日期</th>
					<th>機加酒訂單狀態</th>
					<th>總金額</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="phoVO" items="${sucessOrderList}" varStatus="s">
                	
								<tr>
									<td>${phoVO.phono}</td>
									<td>${phoVO.phoowner}</td>
									<td>${phoVO.phophone}</td> 
									<td>${phoVO.phomail}</td>
									<td>${phoVO.phostdate}</td>
									<c:if test="${phoVO.phostatus==0}">
										<td>商品未送出</td>
									</c:if>
									<c:if test="${phoVO.phostatus==1}">
										<td>商品已寄出</td>
									</c:if>
									<c:if test="${phoVO.phostatus==2}">
										<td>退貨審核中</td>
									</c:if>
									<c:if test="${phoVO.phostatus==3}">
										<td>已退貨</td>
									</c:if>
									<c:if test="${phoVO.phostatus==4}">
										<td>退貨失敗</td>
									</c:if>
									<td>${phoVO.phototal}</td>
								</tr>							
							
					</c:forEach>  
                </tbody>
              </table>
              <br>
			<h2 style="color:red" align=left>目前營業額 : ${allMoney}!!</h2> 
			<form method="post" action="<%=request.getContextPath()%>/backend/pho/listallrefund.jsp">
				<input type="submit" value="回訂單管理" class="btn btn-primary">                			
			</form>
          </div>
        </div>
      </div>
    </div>
   </main>

</body>

<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script
	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

</html>