<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="com.phd.model.*"%>
<%@ page import="java.util.*"%>
<%
	Map<PhoVO,List<PhdVO>> orderList = new HashMap<PhoVO,List<PhdVO>>();
	orderList = (Map<PhoVO,List<PhdVO>>)request.getAttribute("orderList");
	PahService pas = new PahService();
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">


	
	
<meta charset="UTF-8">


<title>機加酒訂單</title>
</head>
<body>

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />



<!----------------------------------------------- 標題列 -------------------------------------------->   
   <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-11">
          <div class="title-single-box">
            <h1 class="title-single">訂單查詢</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
        <div class="col-1">
        	  <input onclick="javascript:socket('${memno}')" value="訂單問題" type="button" class="btn btn-secondary">
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
<!----------------------------------------------- 標題列 -------------------------------------------->    
  


<!-----------------------------------/ 訂單開始 /----------------------------------->
  <section class="property-grid grid">
    <div class="container">
      <div class="row">      
        <div class="col-12">
       		

<!-- 	錯誤表列 -->
	<c:if test="${not empty errorMsgs}">
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
<!-- 	列印表單 -->

				<%
					if(orderList!=null){
						Set<PhoVO> phoSet = orderList.keySet(); 
						for(PhoVO phoVO:phoSet){
				%>
					
					<div id="accordion">
						  <div class="card">
						    <div class="card-header" id="headingOne">
						      <h5 class="mb-0">
						        <button class="btn btn-link" data-toggle="collapse" data-target="#<%=phoVO.getPhono()%>" aria-expanded="true" aria-controls="<%=phoVO.getPhono()%>">
						         	 訂單日期: <%=phoVO.getPhostdate()%>
						         	<%if(phoVO.getPhostatus()==0){%>
										商品未送出
									<%}else if(phoVO.getPhostatus()==1){%>	
										商品已寄出
									<%}else if(phoVO.getPhostatus()==2){%>	
										退貨審核中
									<%}else if(phoVO.getPhostatus()==3){%>	
										已退貨
									<%}else if(phoVO.getPhostatus()==4){%>
										退貨失敗
									<%}%>
						        </button>
						      </h5>
						    </div>
						
						    <div id="<%=phoVO.getPhono()%>" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
						      <div class="card-body">
						      		<h2>主要聯絡人姓名: <%=phoVO.getPhoowner()%></h2><br>	
						      		
						      		<table class="table table-bordered">
									  <thead>
									    <tr>
									      <th scope="col"></th>
									      <th scope="col">購買項目</th>
									      <th scope="col">數量</th>
									      <th scope="col">使用期限</th>
									    </tr>
									  </thead>
						      		  <%
						      			List<PhdVO> phdList = orderList.get(phoVO);
						      		  	int i=1;
						      			for(PhdVO phdVO:phdList){
						      		  %>
						      		  <tbody>
									    <tr>
									      <th scope="row"><%=i%></th>
									      <td><%=pas.findByPk(phdVO.getPahno()).getPahname()%></td>
									      <td><%=phdVO.getPhdnum()%></td>
									      <td><%=pas.findByPk(phdVO.getPahno()).getPahstdate()%></td>
									    </tr>					     
						      		  </tbody>
						      		  <%}%>
									</table>
									<%
										if(phoVO.getPhomark()!=null){
									%>		
										<h5>訂單備註:<%=phoVO.getPhomark()%></h5>				
											
									<%}%>
								<H3 style="color:red">總金額:<%=phoVO.getPhototal()%></H3>
								<form action="<%=request.getContextPath()%>/pho/phocontrol" method="post">
									<input type="hidden" name="action" value="returnPah">
									<input type="hidden" name="orderID" value="<%=phoVO.getPhono()%>">
									<input type="hidden" name="memno" value="${memno}">
									<%if(phoVO.getPhostatus()==0){%>
										<input type="submit" value="申請退貨" class="btn btn-info">									
									<%}else{%>
										<input type="submit" value="申請退貨" class="btn btn-info" disabled>
									<%}%>
								</form>	
								
						      </div>
						    </div>
						  </div>
						</div>

				<%}}%>		
						
						
				
        </div>
      </div>	
    </div>
  </section>
  <!-----------------------------------/ 訂單結束 /----------------------------------->	
	
	
	
	
		
</body>


<script src="<%=request.getContextPath()%>/bootstrap/jquery-3.3.1.slim.min.js" ></script>
<script src="<%=request.getContextPath()%>/bootstrap/popper.min.js"></script>
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script> --%>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>	
	
<script>
 
	function socket(m){
	 	document.open("/CA106G6/backend/sme/message2.jsp?memno=" + m, "" ,"height=680,width=850,left=50,top=40,resizable=yes,scrollbars=yes");
	}
	
</script>	


</html>