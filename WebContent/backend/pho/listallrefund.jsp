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


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">

	
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
          <input onclick="javascript:socket('${empno}')" value="客戶服務" type="button" class="btn btn-secondary">
        </div>
      </div>

<!---------------------------------所有上架商品 ------------------------------------>       
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">  
             
             <%-- 錯誤驗證 --%>
			<c:if test="${not empty errorMsgs}">
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
           <form method="post" action="<%=request.getContextPath()%>/pho/phocontrol">
           	  <table class="table table-hover table-bordered" id="sampleTable">
	              <HR>
	             	<h2> 已下定訂單列表</h2>
	             	<h8>(勾選已送出商品訂單)</h8>
	                <thead>
	                  <tr>
	                 	<th></th>
						<th>主要聯絡人姓名</th>
						<th>電話號碼</th>
						<th>E-Mail</th>
						<th>訂單成立日期</th>
						<th>機加酒訂單狀態</th>
						<th>總金額</th>
	                  </tr>
	                </thead>
	                <tbody>
	                	<c:forEach var="phoVO" items="${list}" varStatus="s">
							<c:if test="${phoVO.phostatus==0}">
								<tr>
									<td align="center"><input type="checkbox" name="OKOrder" value="${phoVO.phono}"></td>
									<td>${phoVO.phoowner}</td>
									<td>${phoVO.phophone}</td> 
									<td>${phoVO.phomail}</td>
									<td>${phoVO.phostdate}</td>
									<td>商品尚未寄出</td>
									<td>${phoVO.phototal}</td>
								</tr>
							</c:if>
						</c:forEach>                    
	                </tbody>
              	</table>  
              <input type="hidden" name="action" value="successOrder">      
              <input type="submit" value="確認寄出商品" class="btn btn-primary">
              <c:if test="${not empty noOrder}"> 
             	 <li style="color:red">${noOrder}</li> 
              </c:if>    
           </form> 
            
            
<!----------------------  等待退貨訂單 -->
           <table class="table table-hover table-bordered" id="sampleTable">
			   <HR>
             	<h2> 退貨訂單列表  </h2><h8>(點選訂單編號即可審核)</h8>
                <thead>
                  <tr>
					<th>訂單編號</th>
					<th>主要聯絡人姓名</th>
					<th>電話號碼</th>
					<th>E-Mail</th>
					<th>訂單成立日期</th>
					<th>機加酒訂單狀態</th>
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
								<td>${phoVO.phovisa}</td>
								<td>${phoVO.phototal}</td>
								<td>${phoVO.memno}</td>
							</tr>
						</c:if>
					</c:forEach>                    
                </tbody>
              </table>
              
              
<!-- 顯示全部訂單   -->
              <table class="table table-hover table-bordered" id="sampleTable">
			   <HR>
             	<h2> 全部訂單列表  </h2>
                <thead>
                  <tr>
					<th>訂單編號</th>
					<th>主要聯絡人姓名</th>
					<th>電話號碼</th>
					<th>E-Mail</th>
					<th>訂單成立日期</th>
					<th>機加酒訂單狀態</th>
					<th>信用卡號碼</th>
					<th>總金額</th>
					<th>會員編號</th>
                  </tr>
                </thead>
                <tbody>
	               	<c:forEach var="phoVO" items="${list}" varStatus="s">
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
								<td>${phoVO.phovisa}</td>
								<td>${phoVO.phototal}</td>
								<td>${phoVO.memno}</td>
							</tr>
					</c:forEach>                    
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
     </main>


</body>



<script>
  	
	function socket(e){
	 	document.open("/CA106G6/backend/sme/message2.jsp?empno=" + e, "" ,"height=680,width=850,left=50,top=40,resizable=yes,scrollbars=yes");
	}
	
</script>

</html>