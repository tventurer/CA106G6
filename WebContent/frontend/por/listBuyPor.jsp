<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.pur.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%
String name =(String)session.getAttribute("memno");
	PurService purSvc = new PurService();
	pageContext.setAttribute("name",name);

	PorService porSvc = new PorService();
	List<PorVO> Porlist = porSvc.getMemAllPor(name);
	pageContext.setAttribute("Porlist", Porlist);

	String purstatus[] = { "未上架", "上架中", "已下架", "檢舉下架" };
	request.setAttribute("purstatus", purstatus);
	
	String porstatus[] = {"已付款", "確認商品無誤，完成交易", "申請退貨", "退貨申請成功", "退貨申請失敗", "申請換貨", "換貨申請成功","換貨申請失敗", "因檢舉下架退款", "已退貨"};
	request.setAttribute("porstatus", porstatus);

	String[] pursort = { "生活居家", "生活休閒", "國際菸草", "各國酒類", "玩具遊戲", "毛小孩專屬", "經典品牌", "行家收藏", "運動用品", "美妝保養", "異國美食"};
	request.setAttribute("pursort", pursort);
	
	String porlogistics[] = { "待出貨" , "賣家已出貨", "買家已領貨", "賣家等待退換貨寄回", "買家寄出退換貨" ,"賣家收到退換貨","寄回換貨給買家","買家收到換貨商品"};
	request.setAttribute("porlogistics", porlogistics);
	
	
%>


<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />
<style>
.img-fluid {
	height: 250px;
}
.table td, .table th{
    text-align: center;
}
.modal-body{
text-align: left;
}

.success-box {
  margin:50px 0;
  padding:10px 10px;
  border:1px solid #eee;
  background:#f9f9f9;
}

.success-box img {
  margin-right:10px;
  display:inline-block;
  vertical-align:top;
}

.success-box > div {
  vertical-align:top;
  display:inline-block;
  color:#888;
}



/* Rating Star Widgets Style */
.rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2.5em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
}
</style>
	<!--/ Nav End /-->

	<!--/ Intro Single star /-->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">買家訂單</h1>
						<span class="color-text-a">如您有購買商品，此處顯示為您的所有購買商品的訂單</span>
					</div>
				</div>
<!-- 				<div class="col-md-12 col-lg-4"> -->
<!-- 					<nav aria-label="breadcrumb" -->
<!-- 						class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!-- 						<ol class="breadcrumb"> -->
<!-- 							<li class="breadcrumb-item"><a href="#">首頁</a></li> -->
<!-- 							<li class="breadcrumb-item active" aria-current="page"> -->
<!-- 								會員&nbsp;＞&nbsp;購買訂單管理</li> -->
<!-- 						</ol> -->
<!-- 					</nav> -->
<!-- 				</div> -->
			</div>
		</div>
	</section>
	<!--/ Intro Single End /-->

	<!--/ Agents Grid Star /-->
	<section class="agents-grid grid">
		<div class="container">
			<div class="row">
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<c:forEach var="message" items="${errorMsgs}">
    		<script type="text/javascript">
    		window.addEventListener("load", function(event) {
    		var check="${message}";
    		if(check=="退貨原因請勿空白"){
    			alert("退貨原因請勿空白");
    		}else if(check=="換貨原因請勿空白"){
    			alert("換貨原因請勿空白");
    		}
    		});
    		</script>
    		</c:forEach>
</c:if>
				<div class="col-md-12">
					<div class="tile">
						<h3 class="tile-title">購買訂單管理</h3>
						<table class="table table-hover">

							<thead>
								<tr>
									<th>編號</th>
									<th>訂單編號</th>
									<th>商品圖片</th>
									<th>商品名稱</th>
									<th>下單時間</th>
									<th>預計出貨時間</th>
									<th>交易狀態</th>
									<th>訂單詳情</th>
									<th>物流狀態</th>
									<th>評價賣家</th>
								</tr>
							</thead>

							<tbody>
							<c:if test="${fn:length(Porlist) == 0}">
								<tr>
									<td  colspan="10"><br><h5>您尚無下定任何商品 ~ <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">心動不如馬上行動選購去 ~ </a></h5><br></td>
								</tr>
							</c:if>
								<c:forEach var="porVO" items="${Porlist}" varStatus="s">
									<tr>
										<td>${s.count}</td>
										<td>${porVO.porid}</td>
										<td><img
											src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${porVO.purid}"
											width="100px"></td>
										<c:set var="id" scope="page" value="${porVO.purid}" />
										<%
											String id = (String) pageContext.getAttribute("id");
											PurVO purVO = purSvc.getOnePur(id);
											pageContext.setAttribute("purVO",purVO);
										%>
										<td>${purVO.purname}</td>
										<td><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/></td>
										<td><fmt:formatDate value="${purVO.purextime}"  timeStyle="short" type="both"/></td>
										
									<!-- 交易狀態 -->
									<c:forEach var="myporstatus" items="${porstatus}" varStatus="a">
										 <c:choose>
										 <c:when test="${porVO.porstatus == a.index}">
										 <td>${myporstatus}</td>
										 </c:when>
										 </c:choose>
									 </c:forEach>
									 
									<!-- 訂單詳情 -->
										<td>
							     		<button type="button" data-toggle="modal" data-target="#myModal${s.count}">查看</button>
												<div class="modal fade" id="myModal${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">訂單詳情</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
							
												</div>
												<div class="modal-body">
												<strong>編&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${s.count}<br>
												<strong>訂&nbsp;單&nbsp;編&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${porVO.porid}<br>
												<strong>購&nbsp;買&nbsp;時&nbsp;間&nbsp;&nbsp;：&nbsp;</strong><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/><br>
												<strong>交&nbsp;易&nbsp;狀&nbsp;態&nbsp;&nbsp;：&nbsp;</strong>
													<c:forEach var="myporstatus" items="${porstatus}" varStatus="s1">
														<c:if test="${porVO.porstatus == s1.index}">
														${myporstatus}
														</c:if>
														</c:forEach>
													<br>
												<strong>收件人姓名：&nbsp;</strong>${porVO.pormemname}<br>
												<strong>收&nbsp;貨&nbsp;地&nbsp;址&nbsp;&nbsp;：&nbsp;</strong>${porVO.poraddress}<br>
												<strong>連&nbsp;絡&nbsp;電&nbsp;話&nbsp;&nbsp;：&nbsp;</strong>${porVO.portel}<br>
												<strong>訂&nbsp;購&nbsp;數&nbsp;量&nbsp;&nbsp;：&nbsp;</strong>${porVO.porsum}<br>
												<strong>訂&nbsp;購&nbsp;總&nbsp;額&nbsp;&nbsp;：&nbsp;</strong>${porVO.porprice}<br>
												<strong>物&nbsp;流&nbsp;狀&nbsp;態&nbsp;&nbsp;：&nbsp;</strong>
													<c:forEach var="myporlogistics" items="${porlogistics}" varStatus="s2">
														<c:if test="${porVO.porlogistics == s2.index}">
														${myporlogistics}
														</c:if>
														</c:forEach>
													<br>
												<strong>物流最後更新時間：&nbsp;</strong><fmt:formatDate value="${porVO.porlogtime}"  timeStyle="short" type="both"/>
												</div>
												<div class="modal-footer">
												
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												</div>
												</div>
												</div>
												</div>
			 							</td>
			 							<!-- 物流狀態 -->
 			 						<!--這交易狀態下會遇到的物流狀態	交易狀態"已付款", "確認商品無誤，完成交易", "申請退貨", "退貨申請成功", "退貨申請失敗", "申請換貨", "換貨申請成功","換貨申請失敗", "因檢舉下架退款", "已退貨 -->
 			 						<!--以交易狀太篩選是否出貨		      物流狀態 "待出貨" , "賣家已出貨", "買家已領貨", "賣家等待退換貨寄回", "買家寄出退換貨" ,"賣家收到退換貨","寄回換貨給買家","買家收到換貨商品"   -->
			 							<c:choose>
			 							<c:when test="${porVO.porlogistics == 0 }">
 			 								<td><!--買家購買，等待賣家出貨 -->
												待出貨
											</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 1 }">
			 								<!--賣家已出貨，買家確認收到貨物 -->
			 								<td>
												 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;"> 
							   		     	     <input type="submit" value="收到商品">
							   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
							   		     	     <input type="hidden" name="memno" value="${name}">
							   		     	     <input type="hidden" name="porlogistics" value=2 >
				                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
											</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 2 }">
			 								<td><!--買家確認收到貨物，檢查有無瑕疵，是否要換退貨 -->
			 							<c:if test="${porVO.porstatus == 0 }">
			 									
						 						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
									   		    <input type="submit" value="確認">
									   		    <input type="hidden" name="porstatus" value=1 >
									   		    <input type="hidden" name="porid"  value="${porVO.porid}">
						                        <input type="hidden" name="action"	value="updata_porstatus"></FORM>
						                                 
						                        <button type="button" data-toggle="modal" data-target="#qa${s.count}">換貨</button>
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
													<div class="modal fade" id="qa${s.count}" role="dialog">
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header">
													<h4 class="modal-title">要求換貨</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">
															
													換貨原因：<br>
													<textarea class="form-control rounded-0" name="changebuy" rows="4" ></textarea>
															
													<input type="hidden" name="porid"  value="${porVO.porid}">
													<input type="hidden" name="porstatus" value=5 >
						                            <input type="hidden" name="action"	value="updata_porstatus">
													</div>
													<div class="modal-footer"> 
													<input type="submit" class="btn btn-default" value="送出換貨需求">
													</div>
													</div>
													</div>
													</div>
												</FORM>
											
													 
						                        <button type="button" data-toggle="modal" data-target="#qab${s.count}">退貨</button>
											    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
													<div class="modal fade" id="qab${s.count}" role="dialog">
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header">
													<h4 class="modal-title">要求退貨</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">
															
													退貨原因：<br>
													<textarea class="form-control rounded-0" name="backbuy" rows="4" ></textarea>
															
													<input type="hidden" name="porstatus" value=2 >
													<input type="hidden" name="porid"  value="${porVO.porid}">
						                            <input type="hidden" name="action"	value="updata_porstatus">
													</div>
													<div class="modal-footer"> 
													<input type="submit" class="btn btn-default" value="送出">
													</div>
													</div>
													</div>
													</div>
												</FORM>
												
												</c:if>
												<c:if test="${porVO.porstatus == 1}">
												買家收到商品
												</c:if>
												<c:if test="${porVO.porstatus == 7}">
												買家收到商品
												</c:if>
												<c:if test="${porVO.porstatus == 5}">
												買家收到商品
												</c:if>
												<c:if test="${porVO.porstatus == 2}">
												買家收到商品
												</c:if>
												<c:if test="${porVO.porstatus == 4}">
												買家收到商品
												</c:if>
					 							<c:if test="${porVO.porstatus == 3}">
													退貨申請成功
													<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
								   		     	     <input type="submit" value="寄出需退商品">
								   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
								   		     	     <input type="hidden" name="porlogistics" value=5 >
								   		     	     <input type="hidden" name="memno" value="${name}">
					                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
													
												</c:if>
					 							<c:if test="${porVO.porstatus == 6}">
													換貨申請成功
													<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
								   		     	     <input type="submit" value="寄出需換商品">
								   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
								   		     	     <input type="hidden" name="porlogistics" value=5 >
								   		     	     <input type="hidden" name="memno" value="${name}">
					                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
													
												</c:if>
											</td>
										</c:when>
										<c:when test="${porVO.porlogistics == 3 }">
											<!--賣家等待退換貨寄回 -->
											<td>
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
								   		    <input type="submit" value="寄回退換貨">
								   		    <input type="hidden" name="porid"  value="${porVO.porid}">
								   		    <input type="hidden" name="porlogistics" value=4 >
								   		    <input type="hidden" name="memno" value="${name}">
					                        <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
											</td>
											
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 4 }">
			 								<!--買家寄出退換貨 -->
			 								<td>等待賣家收到退換貨</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 5 }">
			 								<!--賣家收到退換貨 -->
			 								<td>賣家收到退換貨處理中</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 6 }">
			 								<!--寄回換貨給買家 -->
			 								<td>
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
								   		    <input type="submit" value="收到換貨商品">
								   		    <input type="hidden" name="porid"  value="${porVO.porid}">
								   		    <input type="hidden" name="porlogistics" value=7 >
								   		    <input type="hidden" name="memno" value="${name}">
					                        <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
											</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 7 }">
			 								<td><!--買家收到換貨商品 -->
			 								<c:if test="${porVO.porstatus == 0 }">
											
						 						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
									   		    <input type="submit" value="確認商品無誤">
									   		    <input type="hidden" name="porstatus" value=1 >
									   		    <input type="hidden" name="porid"  value="${porVO.porid}">
						                        <input type="hidden" name="action"	value="updata_porstatus"></FORM>
						                                 
						                        <button type="button" data-toggle="modal" data-target="#qa${s.count}">再次要求換貨</button>
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
													<div class="modal fade" id="qa${s.count}" role="dialog">
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header">
													<h4 class="modal-title">再次要求換貨</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">
															
													換貨原因：<br>
													<textarea class="form-control rounded-0" name="changebuy" rows="4" ></textarea>
															
													<input type="hidden" name="porid"  value="${porVO.porid}">
													<input type="hidden" name="porstatus" value=5 >
						                            <input type="hidden" name="action"	value="updata_porstatus">
													</div>
													<div class="modal-footer"> 
													<input type="submit" class="btn btn-default" value="送出換貨需求">
													</div>
													</div>
													</div>
													</div>
												</FORM>
													 
						                        <button type="button" data-toggle="modal" data-target="#qab${s.count}">退貨</button>
											    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
													<div class="modal fade" id="qab${s.count}" role="dialog">
													<div class="modal-dialog">
													<div class="modal-content">
													<div class="modal-header">
													<h4 class="modal-title">要求退貨</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">
															
													退貨原因：<br>
													<textarea class="form-control rounded-0" name="backbuy" rows="4" ></textarea>
															
													<input type="hidden" name="porstatus" value=2 >
													<input type="hidden" name="porid"  value="${porVO.porid}">
						                            <input type="hidden" name="action"	value="updata_porstatus">
													</div>
													<div class="modal-footer"> 
													<input type="submit" class="btn btn-default" value="送出">
													</div>
													</div>
													</div>
													</div>
												</FORM>
												</c:if>
												<c:if test="${porVO.porstatus == 1}">
												買家收到換貨
												</c:if>
												<c:if test="${porVO.porstatus == 7}">
												買家收到換貨
												</c:if>
												<c:if test="${porVO.porstatus == 5}">
												買家收到換貨
												</c:if>
												<c:if test="${porVO.porstatus == 2}">
												買家收到換貨
												</c:if>
												<c:if test="${porVO.porstatus == 4}">
												買家收到換貨
												</c:if>
					 							<c:if test="${porVO.porstatus == 3}">
													退貨申請成功
													<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
								   		     	     <input type="submit" value="寄出需退商品">
								   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
								   		     	     <input type="hidden" name="porlogistics" value=5 >
								   		     	     <input type="hidden" name="memno" value="${name}">
					                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
												</c:if>
					 							<c:if test="${porVO.porstatus == 6}">
													換貨申請成功
													<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
								   		     	     <input type="submit" value="寄出需換商品">
								   		     	     <input type="hidden" name="porid"  value="${porVO.porid}">
								   		     	     <input type="hidden" name="porlogistics" value=5 >
								   		     	     <input type="hidden" name="memno" value="${name}">
					                                 <input type="hidden" name="action"	value="updata_porlogistics_buy"></FORM>
												</c:if>
												</td>
			 							</c:when>
			 							<c:when test="${porVO.porlogistics == 8 }">
			 							<td>
			 								退貨完成，已將退款轉回您的代幣儲值
			 							</td>
			 							</c:when>
										

			 							</c:choose>
			 							
			 							<!-- 評價賣家 -->
			 							<c:if test="${porVO.porstatus == 1  }"><!--取消交易，你不能給予評價 -->
				 						<c:if test="${empty porVO.porbuytime}">
				 						<td><button type="button" data-toggle="modal" data-target="#showbox${s.count}"  class='sellscore' value="${porVO.porbuyscore}" data-data="${s.count}">評價賣家</button>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
												<div class="modal fade" id="showbox${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">評價賣家</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
												
												給予評價：
												<!-- Rating Stars Box -->
												<section class='rating-widget'>
												  <div class='rating-stars text-center'>
												    <ul id='stars' class="stars">
												      <li id='star1${s.count}' class='star1 star' title='Poor' data-value='1'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star2${s.count}' class='star2 star' title='Fair' data-value='2'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star3${s.count}' class='star3 star' title='Good' data-value='3'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star4${s.count}' class='star4 star' title='Excellent' data-value='4'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star5${s.count}' class='star5 star' title='WOW!!!' data-value='5'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												    </ul>
												  </div>
												  
												</section>
												<div class='success-box'>
												    <div class='text-message'></div>
												</div>
												評價內容：<br>
												<textarea class="form-control rounded-0" name="porbuycontent" id="porbuycontent" rows="4" >${porVO.porbuycontent}</textarea>
												<input type="hidden" name="porbuyscore2" value="${porVO.porbuyscore}" >
			                                    <input type="hidden" name="porid"  value="${porVO.porid}">
			                                    <input type="hidden" name="action"	value="go_buygivescore">
												</div>
												<div class="modal-footer"> 
												<input type="submit" class="btn btn-default" value="評價買家">
												</div>
												</div>
												</div>
												</div>
										 </FORM></td>
				 						</c:if>
				 						<c:if test="${not empty porVO.porbuytime}"><!--更改評價評價 -->
							     		  <td><button type="button" data-toggle="modal" data-target="#showbox${s.count}"  class='sellscore' value="${porVO.porbuyscore}" data-data="${s.count}">更改評價</button>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
												<div class="modal fade" id="showbox${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">更改評價</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
												
												給予評價：
												<!-- Rating Stars Box -->
												<section class='rating-widget'>
												  <div class='rating-stars text-center'>
												    <ul id='stars' class="stars">
												      <li id='star1${s.count}' class='star1 star' title='Poor' data-value='1'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star2${s.count}' class='star2 star' title='Fair' data-value='2'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star3${s.count}' class='star3 star' title='Good' data-value='3'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star4${s.count}' class='star4 star' title='Excellent' data-value='4'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												      <li id='star5${s.count}' class='star5 star' title='WOW!!!' data-value='5'>
												        <i class='fa fa-star fa-fw'></i>
												      </li>
												    </ul>
												  </div>
												  
												</section>
												<div class='success-box'>
												    <div class='text-message'></div>
												</div>
												評價內容：<br>
												<textarea class="form-control rounded-0" name="porbuycontent" id="porbuycontent" rows="4" >${porVO.porbuycontent}</textarea>
												<input type="hidden" name="porbuyscore2" value="${porVO.porbuyscore}" >
			                                    <input type="hidden" name="porid"  value="${porVO.porid}">
			                                    <input type="hidden" name="action"	value="go_buygivescore">
												</div>
												<div class="modal-footer"> 
												<input type="submit" class="btn btn-default" value="更改評價">
												</div>
												</div>
												</div>
												</div>
										 </FORM>
										 </c:if><!--更改評價評價 -->
			 							</c:if><!--取消交易不能給予評價 -->
			 							<c:if test="${porVO.porstatus != 1  }">
			 								<td>未完成交易，不得評價</td>
			 							</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ Agents Grid End /-->
	<br>
<jsp:include page="/frontend/footer.jsp" />

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>

</body>
	<script>
	$(document).ready(function(){
		var elements = document.getElementsByClassName('sellscore');
		for(var i = 0; i < elements.length; i++){
			elements[i].addEventListener("mouseover",Showstar,false);
		}
	})
	function Showstar(e){
		var sc = e.target.value;
		var data = e.target.getAttribute("data-data");
		
		if(sc > 0){
			for(i = 1; i <= sc; i++){
				if(sc >= i){
					$('#star'+i+data).addClass('selected');
				}else{
					$('#star'+i+data).removeClass('selected');
				}
			}
		}			
	}
	$(document).ready(function(){
		
		  /* 1. Visualizing things on Hover - See next part for action on click */
		$('.stars li').on('mouseover', function(){
			var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
		   
		    // Now highlight all the stars that's not after the current hovered star
			$(this).parent().children('li.star').each(function(e){
				if (e < onStar) {
		        	$(this).addClass('hover');
				}else {
					$(this).removeClass('hover');
				}
			});
		}).on('mouseout', function(){
			$(this).parent().children('li.star').each(function(e){
			$(this).removeClass('hover');
			});
		});
		  
		  /* 2. Action to perform on click */
		$('.stars li').on('click', function(){
		    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
		    var stars = $(this).parent().children('li.star');
		    
		    for (i = 0; i < stars.length; i++) {
		      $(stars[i]).removeClass('selected');
		    }
		    for (i = 0; i < onStar; i++) {
		      $(stars[i]).addClass('selected');
		    }
		    // JUST RESPONSE (Not needed)
		    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
		    var msg = "";
		    if (ratingValue > 1) {
		        msg =  ratingValue ;
		    }
		    else {
		        msg =  ratingValue ;
		    }
		    responseMessage(msg);
		    
		  });
		  
		  
		});


		function responseMessage(msg) {
		  $('.success-box div.text-message').html("<input type='hidden' name='porbuyscore' class='porbuyscore'  value='"+msg+"' >");
		}
	</script>
</html>
