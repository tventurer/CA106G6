<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.por.model.*"%>
<%@ page import="com.pur.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%
	String name=(String)session.getAttribute("memno");
	PurService purSvc = new PurService();
	pageContext.setAttribute("name",name);

	List<PurVO> Purlist = purSvc.getMemAll(name);
	pageContext.setAttribute("Purlist", Purlist);

	String purstatus[] = { "未上架", "上架中", "已下架", "檢舉下架" };
	request.setAttribute("purstatus", purstatus);

	String[] pursort = { "生活居家", "生活休閒", "國際菸草", "各國酒類", "玩具遊戲", "毛小孩專屬", "經典品牌", "行家收藏", "運動用品", "美妝保養", "異國美食"};
	request.setAttribute("pursort", pursort);
	
	String porlogistics[] = { "待出貨" , "已出貨", "已領貨", "等待退換貨寄回", "寄出退換貨" ,"已收到退換貨"};
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
						<h1 class="title-single">代購商品</h1>
						<h4><a href="<%=request.getContextPath()%>/frontend/pur/addOnePur.jsp">新增代購商品</a></h4>
						<span class="color-text-a">您所有的代購商品列表</span>
					</div>
				</div>
<!-- 				<div class="col-md-12 col-lg-4"> -->
<!-- 					<nav aria-label="breadcrumb" -->
<!-- 						class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!-- 						<ol class="breadcrumb"> -->
<!-- 							<li class="breadcrumb-item"><a href="#">首頁</a></li> -->
<!-- 							<li class="breadcrumb-item active" aria-current="page"> -->
<!-- 								會員&nbsp;＞&nbsp;代購商品&nbsp;＞&nbsp;商品列表</li> -->
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
			<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">代購商品列表</h3>
			<table class="table table-hover">

				<thead>
					<tr>
					<th>編號</th>
					<th>商品編號</th>
					<th>商品圖片</th>
					<th>商品名稱</th>
					<th>商品類別</th>
					<th>發布時間</th>
					<th>下架時間</th>
					<th>商品狀態</th>
					<th>最後修改時間</th>
					<th>查看詳情</th>
					<th>修改</th>
					<th>下架商品</th>
					</tr>
				</thead>

				<tbody>
				<c:if test="${fn:length(Purlist) == 0}">
					<tr>
					<td  colspan="12"><br><h5>您尚無任何商品 ~ <a href="<%=request.getContextPath()%>/frontend/pur/addOnePur.jsp">來去新增商品 ~ </a></h5><br></td>
					</tr>
				</c:if>
				<c:forEach var="purVO" items="${Purlist}" varStatus="s">
					<tr>
					<td>${s.count}</td>
					<td>${purVO.purid}</td>
					<td><img src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" width="100px"></td>
					<td>${purVO.purname}</td>
					<c:forEach var="mypursort" items="${pursort}" varStatus="ss">
					<c:choose>
					<c:when test="${purVO.pursort == ss.index}">
			    	<td>${mypursort}</td>
					</c:when>
					</c:choose>
				</c:forEach>
					<td><fmt:formatDate value="${purVO.purtime}"  timeStyle="short" type="both"/></td>
					<td><fmt:formatDate value="${purVO.purobtained}"  timeStyle="short" type="both"/></td>
				<c:forEach var="mypurstatus" items="${purstatus}" varStatus="s">
					<c:choose>
					<c:when test="${purVO.purstatus == s.index}">
			    	<td>${mypurstatus}</td>
					</c:when>
					</c:choose>
				</c:forEach>
					<td><fmt:formatDate value="${purVO.pursavetime}"  timeStyle="short" type="both"/></td>
					<td>
					<c:if test="${purVO.purstatus !=1 }">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pur/purToPurListOne.jsp?purid=${purVO.purid}" style="margin-bottom: 0px;">
			     	<input type="submit" value="查看詳情">
			     	<input type="hidden" name="purid"  value="${purVO.purid}">
			     	<input type="hidden" name="memno"  value="${name}">
			     	<input type="hidden" name="action"	value="show_OnePur"></FORM>
			     	</c:if>
			     	<c:if test="${purVO.purstatus == 1 }">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pur/purListOne.jsp?purid=${purVO.purid}" style="margin-bottom: 0px;">
			     	<input type="submit" value="查看詳情">
			     	<input type="hidden" name="purid"  value="${purVO.purid}">
			     	<input type="hidden" name="memno"  value="${name}">
			     	<input type="hidden" name="action"	value="show_OnePur"></FORM>
			     	</c:if>
					</td>
					<td>
					<c:if test="${purVO.purstatus == 0 }">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pur/pur" style="margin-bottom: 0px;">
			     	<input type="submit" value="修改">
			     	<input type="hidden" name="purid"  value="${purVO.purid}">
			     	<input type="hidden" name="memno"  value="${name}">
			     	<input type="hidden" name="action"	value="getOne_For_Update"></FORM>
					</c:if>
					<c:if test="${purVO.purstatus == 1 }">
						已上架
					</c:if>
					<c:if test="${purVO.purstatus == 2 }">
						已下架
					</c:if>
					<c:if test="${purVO.purstatus == 3 }">
						已遭檢舉
					</c:if>
					</td>
					<td>
					<c:if test="${purVO.purstatus == 0 }">
						此商品未上架
					</c:if>
					<c:if test="${purVO.purstatus == 1 }">
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/pur/pur" style="margin-bottom: 0px;">
					     <input type="submit" value="提前下架商品">
					     <input type="hidden" name="purid"  value="${purVO.purid}">
					     <input type="hidden" name="memno"  value="${name}">
					     <input type="hidden" name="allpur"  value="allpur">
					     <input type="hidden" name="action" value="delete"></FORM>
					</c:if>
					<c:if test="${purVO.purstatus == 2 }">
						此商品已下架
					</c:if>
					<c:if test="${purVO.purstatus == 3 }">
						已遭檢舉下架
					</c:if>
					</td>
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
