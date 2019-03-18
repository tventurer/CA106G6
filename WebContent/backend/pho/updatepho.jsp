<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pho.model.*"%>
<%@ page import="com.phd.model.*"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="java.util.*"%>

<%
  PhoVO phovo = (PhoVO)request.getAttribute("phovo");
  PahService pas = new PahService();
  pageContext.setAttribute("pas", pas);
  pageContext.setAttribute("0", "商品未送出");
  pageContext.setAttribute("1", "商品已寄出");
  pageContext.setAttribute("2", "退貨審核中");
  pageContext.setAttribute("3", "已退貨");
  pageContext.setAttribute("4", "退貨失敗");
%>

<!DOCTYPE html>
<html>
<head>

<script>  
	function next(obj) {  
	    if (obj.value.length == obj.maxLength) {  
	        do {  
	            obj = obj.nextSibling;  
	        } while (obj.nodeName != "INPUT");  
	        obj.focus();  
	    }         
	}  
	document.forms[0].N1.focus();  
</script>

<meta charset="UTF-8">
<title>修改訂單</title>
</head>
<body class="app sidebar-mini rtl">


<!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>



	<main class="app-content">
	     <div class="app-title">
	        <div>
	          <h1><i class="fa fa-edit"></i>修改訂單資料</h1>
	          <p>T-Venturer</p>
	        </div>
		 </div>
		 	<div class="row">
	        <div class="col-12">
	          <div class="tile">
	            <div class="row">
	              <div class="col-4">
				  
	<!----------------------  錯誤驗證 ------------------>
					<c:if test="${not empty errorMsgs}">
						<font style="color:red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color:red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>              
	
	<!----------------------- 表單開始 ------------------------>
					<h2>訂單內容</h2>
					<HR>
					<form method="post" action="<%= request.getContextPath() %>/pho/phocontrol">
		
						
						<div class="form-group">
	                    	<label for="exampleInputEmail1">訂單編號:</label>
	                    	<label for="exampleInputEmail1">${phovo.phono}</label>
	                 	</div>
							
						<div class="form-group">
	                    	<label for="exampleInputEmail1">主要聯絡人姓名:</label>
	                   		<input value="${phovo.phoowner}" name="phoowner" type="text" class="form-control" id="exampleInputEmail1">
	                 	</div>
		
						<div class="form-group">
	                    	<label for="exampleInputEmail1">電話號碼:</label>
	                   		<input value="${phovo.phophone}" name="phophone" type="text" class="form-control" id="exampleInputEmail1">
	                 	</div>
	                 	
	                 	<div class="form-group">
	                    	<label for="exampleInputEmail1">E-Mail:</label>
	                   		<input value="${phovo.phomail}" name="phomail" type="email" class="form-control" id="exampleInputEmail1">
	                 	</div>
	                 	
	                 	<div class="form-group">
	                    	<label for="exampleInputEmail1">訂單成立日期:</label>
	                    	<label for="exampleInputEmail1">${phovo.phostdate}</label>
	                 	</div>
	                 	
	                 	<div class="form-group">
		                    <label for="exampleSelect1">訂單狀態:</label>
		                    <select class="form-control" id="exampleSelect1" name="phostatus">
		                    	<%
		                    		for(int i=0; i<5; i++){
		                    			if(phovo.getPhostatus()==i){
		                    	%>
		                    				<option value="<%=i%>" selected><%=pageContext.getAttribute(String.valueOf(i))%>
		                    		  <%}else{%>
		                    				<option value="<%=i%>" ><%=pageContext.getAttribute(String.valueOf(i))%>
		                    	<%}}%>
		                    </select>
	                 	</div>
	                 	
	                 	<div class="form-group">
	                    	<label for="exampleTextarea">訂單狀態備註:</label>
	                  	 	<textarea value="${phovo.phomark}" name="phomark" class="form-control" id="exampleTextarea" rows="5"></textarea>
	                 	</div>
	                 	
           				<label for="exampleTextarea">信用卡號碼:</label><br>
	                 	<div class="div1" style="display:inline-block;">
						<%
							String phovisa0=phovo.getPhovisa().substring(0, 4);
							String phovisa1=phovo.getPhovisa().substring(4, 8);
							String phovisa2=phovo.getPhovisa().substring(8, 12);
							String phovisa3=phovo.getPhovisa().substring(12,16);
						%>  
							<input value="<%=phovisa0%>" style="width:70px"  type="text" name="phovisa0" maxlength="4" size="4" onKeyUp="next(this)">-  
							<input value="<%=phovisa1%>" style="width:70px"  type="text" name="phovisa1" maxlength="4" size="4" onKeyUp="next(this)">-
							<input value="<%=phovisa2%>" style="width:70px"  type="text" name="phovisa2" maxlength="4" size="4" onKeyUp="next(this)">-
							<input value="<%=phovisa3%>" style="width:70px"  type="text" name="phovisa3" maxlength="4" size="4" onKeyUp="next(this)">
                		</div>
	                 	<br><br> 
	                 	
	                 	<div class="form-group">
	                    	<label for="exampleInputEmail1">總金額:</label>
	                    	<label for="exampleInputEmail1">${phovo.phototal}</label>
	                 	</div>
	                 	
	                 	<div class="form-group">
	                    	<label for="exampleInputEmail1">會員編號:</label>
	                   		<input value="${phovo.memno}" name="memno" type="text" class="form-control" id="exampleInputEmail1">
	                 	</div>
	                 	
	                 	
	                 	
					<br>
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="phono" value="${phovo.phono}">
					<input type="hidden" name="phostdate" value="${phovo.phostdate}">
					<input type="hidden" name="phototal" value="${phovo.phototal}">
					<input type="submit" value="送出修改" class="btn btn-primary">
				
				</form>
			  </div>
			  
			  <div class="col-8">
	              <table class="table table-hover table-bordered" id="sampleTable">
             		  <h2> 退貨訂單列表</h2>
             		  <HR>
               		    <thead>
		                  <tr>
							<th>購買商品名稱</th>
<!-- 							<th>商品販售期限</th> -->
							<th>商品目前狀態</th>
							<th>商品價格</th>
							<th>購買數量</th>
		                  </tr>
		                </thead>
		                <tbody>
		                
	              		<c:forEach var="phdvo" items="${phdlist}">	 
	              		  <tr>             		
	              			<th>${pas.findByPk(phdvo.pahno).pahname}</th>
<%-- 							<th>${pas.findByPk(phdvo.pahno).pahdown}</th> --%>
	              			<c:if test="${pas.findByPk(phdvo.pahno).pahstatus==0}">
	              				<th>商品販售中</th>
	              			</c:if>
	              			<c:if test="${pas.findByPk(phdvo.pahno).pahstatus==1}">
	              				<th>商品已下架</th>
	              			</c:if>
							<th>${pas.findByPk(phdvo.pahno).pahprice}</th>
							<th>${phdvo.phdnum}</th>	              	
						   </tr>
	              		</c:forEach>  
	              		
	              	 	<tbody>      
				</table>
			  </div>
			  
			  
			  
			</div>
		  </div>
		</div>
	  </div>
	</main>

</body>
</html>