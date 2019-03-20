<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="com.phd.model.*"%>
<%@ page import="java.util.*"%>

<%
	Map<PhoVO,List<PhdVO>> orderList = new HashMap<PhoVO,List<PhdVO>>();
	orderList = (Map<PhoVO,List<PhdVO>>)request.getAttribute("orderList");
	Set<PhoVO> phoSet = orderList.keySet();
	pageContext.setAttribute("phoSet", phoSet);
%>


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
	
<title>會員訂單列表</title>

<meta charset="UTF-8">

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
          <h1><i class="fa fa-th-list"></i>會員訂單列表</h1>
          <p>T-Venturer</p>
        </div>
      </div>

<!---------------------------------所有上架商品 ------------------------------------>       
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table class="table table-hover table-bordered" id="sampleTable">
             	<h2> 會員訂單列表</h2>
             	<h8>(點選訂單編號即可修改)</h8>
                <thead>
                  <tr>
					<th>機加酒編號</th>
					<th>主要聯絡人姓名</th>
					<th>電話號碼</th>
					<th>E-Mail</th>
					<th>訂單成立日期</th>
					<th>機加酒訂單狀態</th>
					<th>訂單狀態備註</th>
					<th>信用卡號碼</th>
					<th>總金額</th>
					<th>會員編號</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="phoVO" items="${phoSet}" varStatus="s">
                		<c:if test="${phovo.phono==phoVO.phono}">
<!-------------------------客戶退貨訂單 -->
							<tr class="table-success">
								<td><a href="<%=request.getContextPath()%>/pho/phocontrol?action=getOneUpdate&phono=${phoVO.phono}">${phoVO.phono}</a></td>
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
								<td>${phoVO.phomark}</td>
								<td>${phoVO.phovisa}</td>
								<td>${phoVO.phototal}</td>
								<td>${phoVO.memno}</td>
							</tr>
						</c:if>
<!------------------------客戶的其他訂單 -->
						<c:if test="${phovo.phono!=phoVO.phono}">
							<tr>
								<td><a href="<%=request.getContextPath()%>/pho/phocontrol?action=getOneUpdate&phono=${phoVO.phono}">${phoVO.phono}</a></td>
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
								<td>${phoVO.phomark}</td>
								<td>${phoVO.phovisa}</td>
								<td>${phoVO.phototal}</td>
								<td>${phoVO.memno}</td>
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