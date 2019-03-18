<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="com.phd.model.*"%>
<%@ page import="java.util.*"%>


<%
	PhoService phoSvc = new PhoService();
	List<PhoVO> list = phoSvc.getall();
	pageContext.setAttribute("list",list);
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
	
<title>退貨訂單審核</title>

<meta charset="UTF-8">

</head>
<body class="app sidebar-mini rtl">

<!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>






<!---------------------------------標題 ------------------------------------> 
    <main class="app-content">    
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i>客戶訂單管理</h1>
          <p>T-Venturer</p>
        </div>
      </div>

<!---------------------------------所有上架商品 ------------------------------------>       
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">  
             
             <%-- 錯誤驗證 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color:red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
             
             
            <!----------------------  姓名搜尋訂單 -->   
            <form action="<%=request.getContextPath()%>/pho/phocontrol">
	            <h2>搜尋客戶訂單 : </h2>
	            <input type="hidden" name="action" value="listMeOrderback">  
	            <input type="text" name="memno" placeholder="請輸入會員編號">
	            <input type="submit" value="查詢" class="btn btn-primary">  
            </form>  
            <br>      
            <!----------------------  商品尚未寄出訂單 -->              
            <table class="table table-hover table-bordered" id="sampleTable">
              <HR>
             	<h2> 已下定訂單列表</h2>
                <thead>
                  <tr>
					<th>訂單編號</th>
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
                	<c:forEach var="phoVO" items="${list}" varStatus="s">
						<c:if test="${phoVO.phostatus==0}">
							<tr>
								<td><a href="<%=request.getContextPath()%>/pho/phocontrol?action=getOneUpdate&phono=${phoVO.phono}">${phoVO.phono}</a></td>
								<td>${phoVO.phoowner}</td>
								<td>${phoVO.phophone}</td> 
								<td>${phoVO.phomail}</td>
								<td>${phoVO.phostdate}</td>
								<td>商品尚未寄出</td>
								<td>${phoVO.phomark}</td>
								<td>${phoVO.phovisa}</td>
								<td>${phoVO.phototal}</td>
								<td>${phoVO.memno}</td>
							</tr>
						</c:if>
					</c:forEach>                    
                </tbody>
              </table>            
            
            
<!----------------------  等待退貨訂單 -->
           <table class="table table-hover table-bordered" id="sampleTable">
			   <HR>
             	<h2> 退貨訂單列表</h2>
                <thead>
                  <tr>
					<th>訂單編號</th>
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
                	<c:forEach var="phoVO" items="${list}" varStatus="s">
						<c:if test="${phoVO.phostatus==2}">
							<tr>
								<td><a href="<%=request.getContextPath()%>/pho/phocontrol?action=getJudge&phono=${phoVO.phono}">${phoVO.phono}</a></td>
								<td>${phoVO.phoowner}</td>
								<td>${phoVO.phophone}</td> 
								<td>${phoVO.phomail}</td>
								<td>${phoVO.phostdate}</td>
								<td>審核中</td>
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