<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.pur.model.*"%>
<%
String name = "MEM000003";
	String purid = request.getParameter("purid");
			
	PorService porSvc = new PorService();
	List<PorVO> Porlist = porSvc.getPurAll(purid);
	pageContext.setAttribute("Porlist", Porlist);
	int Por_num = Porlist.size();
	
	
	PurService purSvc = new PurService();
	PurVO OnePur = purSvc.getOnePur(purid);

	String purstatus[] = { "未上架", "上架中", "已下架", "檢舉下架" };
	request.setAttribute("purstatus", purstatus);
	
	
	
	String[] pursort = { "生活居家", "生活休閒", "國際菸草", "各國酒類", "玩具遊戲", "毛小孩專屬", "經典品牌", "行家收藏", "運動用品", "美妝保養" };
	request.setAttribute("pursort", pursort);
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
						<h1 class="title-single">該商品訂單列表</h1>
						<span>
							<img src="<%=request.getContextPath()%>/frontend/pur/pur?purid=<%=OnePur.getPurid()%>" height="100px">
							商品名稱：<%=OnePur.getPurname()%>
						</span>
					</div>
				</div>
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item"><a href="#">會員</a></li>
							<li class="breadcrumb-item"><a href="#">代購商品訂單列表</a></li>
							<li class="breadcrumb-item active" aria-current="page">該商品訂單列表</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!--/ Intro Single End /-->
			
	<!--/ Agents Grid Star /-->
	
	<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	<section class="agents-grid grid">
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<div class="tile">
						<h3 class="tile-title"></h3>
						<table class="table table-hover">

							<thead>
								<tr>
									<th>編號</th>
									<th>訂單編號</th>
									<th>買家帳號</th>
									<th>購買時間</th>
									<th>交易狀態</th>
									<th>物流狀態</th>
									<th>訂單詳情</th>
									<th>寄/收貨</th>
									<th>評價買家</th>
							</thead>
<!-- 							買家跟賣家的訂單詳情可共用，或用燈箱顯示 -->
							<tbody>
								<c:forEach var="porVO" items="${Porlist}" varStatus="s">
									<tr>
										<td>${s.count}</td>
										<td>${porVO.porid}</td>
										<td>${porVO.memno}</td>
										<td><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/></td>
<!-- 									交易狀態 -->
										<c:if test="${porVO.porstatus == 0}">
											<td>付款完成</td>
										</c:if>
										
										<c:if test="${porVO.porstatus == 1}">
											<td>確認商品無誤</td>
										</c:if>
										
										<c:if test="${porVO.porstatus == 2}">
											<td>
											買家申請退款
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	     <button type="submit" name="porstatus" value=3 >可退貨</button>
							   		     	     <button type="submit" name="porstatus" value=4 >不可退貨</button>
				                                 <input type="hidden" name="porid"  value="${porVO.porid}">
				                                 <input type="hidden" name="action"	value="updata_porstatus"></FORM>
											</td>
										</c:if>
										<c:if test="${porVO.porstatus == 3}">
											<td>提供退貨中</td>
										</c:if>
										<c:if test="${porVO.porstatus == 4}">
											<td>不給予退貨</td>
										</c:if>
										<c:if test="${porVO.porstatus == 5}">
											<td>
											買家申請換貨
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	     <button type="submit" name="porstatus" value=6 >可換貨</button>
							   		     	     <button type="submit" name="porstatus" value=7 >不可換貨</button>
				                                 <input type="hidden" name="porid"  value="${porVO.porid}">
				                                 <input type="hidden" name="action"	value="updata_porstatus"></FORM>
											</td>
										</c:if>
										<c:if test="${porVO.porstatus == 6}">
											<td>提供換貨中</td>
										</c:if>
										<c:if test="${porVO.porstatus == 7}">
											<td>不給予換貨</td>
										</c:if>
										<c:if test="${porVO.porstatus == 8}">
											<td>因檢舉下架退款</td>
										</c:if>
										<c:if test="${porVO.porstatus == 9}">
											<td>已退貨</td>
										</c:if>
								
								<!--出貨與交易狀況 -->
										<td>
				 							<c:if test="${porVO.porlogistics == 0 }">
				 								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	     <input type="submit" value="出貨">
							   		     	     <input type="hidden" name="memno"  value="<%=name %>">
				                                 <input type="hidden" name="porid"  value="${porVO.porid}">
				                                 <input type="hidden" name="purid"  value="<%=OnePur.getPurid()%>">
				                                 <input type="hidden" name="porlogistics"  value=1>
				                                 <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
				 							</c:if>
				 							<c:if test="${porVO.porlogistics == 1 }">
				 							已出貨
				 							</c:if>
									
										<c:if test="${porVO.porlogistics == 2}">
											買家已領貨
										</c:if>
										<c:if test="${porVO.porlogistics == 3}">
											等待退換貨寄回
										</c:if>
										<c:if test="${porVO.porlogistics == 4}">
											
											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	<button type="submit" name="porlogistics" value=3 >寄出換貨</button>
							   		     	<input type="hidden" name="memno"  value="<%=name %>">
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
											
										</c:if>
										<c:if test="${porVO.porlogistics == 5}">
										<c:if test="${porVO.porstatus == 6}">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	<button type="submit" name="porlogistics" value=6 >收到換貨</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="memno"  value="<%=name %>">
				                            <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
										</c:if>
										<c:if test="${porVO.porstatus == 3}">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
										<button type="submit" name="porlogistics" value=6 >收到退貨</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="memno"  value="<%=name %>">
				                            <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
										</c:if>
											
										</c:if>
										<c:if test="${porVO.porlogistics == 6}">
										<c:if test="${porVO.porstatus == 6}">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	<button type="submit" name="porlogistics" value=5 >寄出換貨</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="memno"  value="<%=name %>">
				                            <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
										</c:if>
										<c:if test="${porVO.porstatus == 3}">
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
										<button type="submit" name="porstatus" value=9 >退貨成功</button>
				                            <input type="hidden" name="porid"  value="${porVO.porid}">
				                            <input type="hidden" name="action"	value="updata_porstatus"></FORM>
										</c:if>
										</c:if>
										
			 							</td>
									 
										<td>
							     		  <button type="button" data-toggle="modal" data-target="#myModal">查看</button>
												<div class="modal fade" id="myModal" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">訂單詳情</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
							
												</div>
												<div class="modal-body">
												<strong>編&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${s.count}<br>
												<strong>訂&nbsp;單&nbsp;編&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${porVO.porid}<br>
												<strong>買&nbsp;家&nbsp;帳&nbsp;號&nbsp;&nbsp;：&nbsp;</strong>${porVO.memno}<br>
												<strong>購&nbsp;買&nbsp;時&nbsp;間&nbsp;&nbsp;：&nbsp;</strong><fmt:formatDate value="${porVO.portime}"  timeStyle="short" type="both"/><br>
												<strong>交&nbsp;易&nbsp;狀&nbsp;態&nbsp;&nbsp;：&nbsp;</strong>${porVO.porstatus}<br>
												<strong>收件人姓名：&nbsp;</strong>${porVO.pormemname}<br>
												<strong>收&nbsp;貨&nbsp;地&nbsp;址&nbsp;&nbsp;：&nbsp;</strong>${porVO.poraddress}<br>
												<strong>連&nbsp;絡&nbsp;電&nbsp;話&nbsp;&nbsp;：&nbsp;</strong>${porVO.portel}<br>
												<strong>訂&nbsp;購&nbsp;數&nbsp;量&nbsp;&nbsp;：&nbsp;</strong>${porVO.porsum}<br>
												<strong>訂&nbsp;購&nbsp;總&nbsp;額&nbsp;&nbsp;：&nbsp;</strong>${porVO.porprice}<br>
												<strong>物&nbsp;流&nbsp;狀&nbsp;態&nbsp;&nbsp;：&nbsp;</strong>${porVO.porlogistics}<br>
												<strong>物流最後更新時間：&nbsp;</strong><fmt:formatDate value="${porVO.porlogtime}"  timeStyle="short" type="both"/>
												</div>
												<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												</div>
												</div>
												</div>
												</div>
			 							</td>
			 							
			 							<td>
				 							<c:if test="${porVO.porlogistics == 0 }">
				 								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
							   		     	     <input type="submit" value="出貨">
				                                 <input type="hidden" name="porid"  value="${porVO.porid}">
				                                 <input type="hidden" name="purid"  value="<%=OnePur.getPurid()%>">
				                                 <input type="hidden" name="porlogistics"  value=1>
				                                 <input type="hidden" name="memno"  value="<%=name %>">
				                                 <input type="hidden" name="action"	value="updata_porlogistics"></FORM>
				 							</c:if>
				 							
				 							<c:if test="${porVO.porlogistics == 1 }">
				 							已出貨
				 							</c:if>
				 							<!--物流狀態 -->
										
									
										<c:if test="${porVO.porlogistics == 2}">
											買家已領貨
										</c:if>
										<c:if test="${porVO.porlogistics == 3}">
											等待退換貨寄回
										</c:if>
										<c:if test="${porVO.porlogistics == 4}">
											
											寄出退換貨
<%-- 											<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;"> --%>
<!-- 							   		     	     <button type="submit" name="porlogistics" value=6 ></button> -->
<%-- 				                                 <input type="hidden" name="porid"  value="${porVO.porid}"> --%>
<!-- 				                                 <input type="hidden" name="action"	value="updata_porlogistics"></FORM> -->
											
										</c:if>
										<c:if test="${porVO.porlogistics == 5}">
											收到退換貨
										</c:if>
			 							</td>
			 							
			 							<td>
				 							<c:if test="${porVO.porlogistics == 0 }"> <!--因未出貨，將不能給予評價 -->
				 								你不能給予評價
				 							</c:if>
				 							<c:if test="${porVO.porlogistics > 0 }"><!--已出貨，給予評價 -->
				 							<c:if test="${porVO.porstatus != 8 }">
				 							<c:if test="${empty porVO.porselltime}">
				 							
											<button type="button" data-toggle="modal" data-target="#showbox${s.count}"  class='sellscore' value="${porVO.porsellscore}" data-data="${s.count}">評價買家</button>
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
												<div class="modal fade" id="showbox${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">評價買家</h4>
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
												<textarea class="form-control rounded-0" name="porsellcontent" id="porsellcontent" rows="4" >${porVO.porsellcontent}</textarea>
												<input type="hidden" name="porsellscore2" value="${porVO.porsellscore}" >
			                                    <input type="hidden" name="purid"  value="<%=OnePur.getPurid()%>">
			                                    <input type="hidden" name="porid"  value="${porVO.porid}">
			                                    <input type="hidden" name="action"	value="go_sellgivescore">
												</div>
												<div class="modal-footer"> 
												<input type="submit" class="btn btn-default" value="評價買家">
												</div>
												</div>
												</div>
												</div>
												</FORM>
			 							</c:if>
			 							
			 							</c:if>
			 							<c:if test="${not empty porVO.porselltime}">
			 								<button type="button" data-toggle="modal" data-target="#showbox${s.count}"  class='sellscore' value="${porVO.porsellscore}" data-data="${s.count}">更改評價</button>
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/por/por" style="margin-bottom: 0px;">
												<div class="modal fade" id="showbox${s.count}" role="dialog">
												<div class="modal-dialog">
												<div class="modal-content">
												<div class="modal-header">
												<h4 class="modal-title">更改評價</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">
												目前評價：
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
												<textarea class="form-control rounded-0" name="porsellcontent" id="porsellcontent" rows="4" >${porVO.porsellcontent}</textarea>

												<input type="hidden" name="porsellscore2" value="${porVO.porsellscore}" >
			                                    <input type="hidden" name="purid"  value="<%=OnePur.getPurid()%>">
			                                    <input type="hidden" name="porid"  value="${porVO.porid}">
			                                    <input type="hidden" name="action"	value="go_sellgivescore">
												</div>
												<div class="modal-footer"> 
												<input type="submit" class="btn btn-default" value="更改評價">
												</div>
												</div>
												</div>
												</div>
												</FORM>
			 							</c:if>
										</c:if>	
										<c:if test="${porVO.porstatus == 8 }">
										你不能給予評價
										</c:if>		 							
			 							</td>
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

	<!--/ footer Star /-->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="nav-footer">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#">Home</a></li>
							<li class="list-inline-item"><a href="#">About</a></li>
							<li class="list-inline-item"><a href="#">Property</a></li>
							<li class="list-inline-item"><a href="#">Blog</a></li>
							<li class="list-inline-item"><a href="#">Contact</a></li>
						</ul>
					</nav>
					<div class="socials-a">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-facebook" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-twitter" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-instagram" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-pinterest-p" aria-hidden="true"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fa fa-dribbble" aria-hidden="true"></i>
							</a></li>
						</ul>
					</div>
					<div class="copyright-footer">
						<p class="copyright color-text-a">
							&copy; Copyright <span class="color-a">T-Venturer</span> All
							Rights Reserved.
						</p>
					</div>
					<div class="credits">
						<!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
						Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/ Footer End /-->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>
	
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
		  $('.success-box div.text-message').html("<input type='hidden' name='porsellscore' class='porsellscore'  value='"+msg+"' >");
		}
	</script>
</body>
</html>
