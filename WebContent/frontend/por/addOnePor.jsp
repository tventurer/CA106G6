<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pur.model.*"%>
<%@ page import="com.acr.model.*"%>
<%
	String purid = new String(request.getParameter("purid"));
	pageContext.setAttribute("purid",purid);
	
	Integer porsum = new Integer(request.getParameter("porsum"));
	pageContext.setAttribute("porsum",porsum);
	
	
	
	PurService purSvc = new PurService();
	PurVO purVO = purSvc.getOnePur(purid);
	Integer purpricing = purVO.getPurpricing();
	pageContext.setAttribute("purpricing",purpricing);
	
	String memno =(String)session.getAttribute("memno");
	pageContext.setAttribute("memno",memno);
	
	if(memno != null || memno.trim().length() != 0){
		AcrService acrSvc = new AcrService();
	    List<AcrVO> list = acrSvc.getMemAll(memno);
	    pageContext.setAttribute("Acrlist",list);
	}
	
    String[] pursort = {"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
    request.setAttribute("pursort", pursort);
    
    String[] listCity={"台北市","新北市","桃園市","台中市","台南市","高雄市","基隆市","新竹市","嘉義市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣"};
    request.setAttribute("listCity",listCity);
    
%>

 <c:if test="${empty memno}">
 <%
 response.sendRedirect(request.getContextPath()+"/frontend/pur/purIndex.jsp");
 %>
</c:if>
<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />

  <style>
  .img-fluid{
  height:250px;
  }
  </style>

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">填寫訂單資料</h1>
            <span class="color-text-a">資料填妥，即可下訂 ~ 祝您購物愉快 !</span><br>
            <%-- 錯誤表列(最後更改) --%>
<c:if test="${not empty errorMsgs}">
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
		<script>
		window.addEventListener("load", function(event) {
			if("請儲值" == "${message}"){
				var r = confirm("您的儲值餘額不足，請前往儲值~!");
				if(r == true){
					window.location = '<%=request.getContextPath()%>/frontend/acr/addOneAcr.jsp';
				}else{
// 					window.history.go(-1); 
				}
			}
			});
		
		</script>
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
          </div>
        </div>

<!--         / 此處可放搜尋類別路徑 / -->
<!--         <div class="col-md-12 col-lg-4"> -->
<!--           <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a href="#">首頁</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item" aria-current="page"> -->
<%--               <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">代購商品</a> --%>
<!--               </li> -->
<!--                <li class="breadcrumb-item"> -->
<%--                 <a href="<%=request.getContextPath()%>/frontend/pur/purListOne.jsp?purid=${purid}"><%=purVO.getPurname() %></a> --%>
<!--               </li> -->
<!--               <li class="breadcrumb-item active"> -->
<!--                 <a>填寫訂單資料</a> -->
<!--               </li> -->
<!--             </ol> -->
<!--           </nav> -->
<!--         </div> -->

      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-5">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                 <img width="400px" height="100%" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=<%=purVO.getPurid() %>" alt="">
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">訂單詳情</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>商品名稱：</strong>
                      <span><%=purVO.getPurname() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品價格：</strong>
                      <span><%=purVO.getPurpricing() %></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>商品數量：</strong>
                      <span>${porsum}</span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>購物總額：</strong>
                      <strong>${purpricing*porsum}</strong>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 section-md-t4">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">收件人資料</h4>
                  </div>
                </div>
              </div>
              <div class="property-description">
<form class="form-a" METHOD="post" name="form1" ACTION="<%=request.getContextPath()%>/frontend/por/por">
        <div class="row">
<!--           <div class="col-md-12 col-lg-8"> -->
<!--             <div class="form-group"> -->
<!--               <input type="checkbox" id="memcheck" value="OK"><label for="Type">同會員基本資料</label> -->
<!--             </div> -->
<!--           </div> -->
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="Type">收件人姓名</label>
              <input name="pormemname" type="text" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="Type">收貨地址</label>
              	<div class="row">
    	<div class="col">
			<div class="dropdown">
	  
<select id="twCityName" class="form-control form-control-lg form-control-a">
<option >--請選擇縣市--</option>
<c:forEach var="city" items="${listCity}">
<option value="${city}"> ${city}</option>
</c:forEach>
</select>
	  
<select id="CityAreaName" class="form-control form-control-lg form-control-a" >
<option >--請選擇區域--</option>
</select>
			    
<select id="AreaRoadName" class="form-control form-control-lg form-control-a" >
<option >--請選擇路名--</option>
</select>	    
	  
<input type="text" class="form-control form-control-lg" placeholder="請輸入門牌號碼" id="num">
	  
	    			    
</div>
	 </div></div></div>
	</div>
	 <div class="col-md-12 col-lg-8">
            <div class="form-group" style="text-align: right;">
			<input type="button" class="btn btn-default" value="確認" id="btnLoc">	
            </div>
          </div>
	 <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <input type="text" id="poraddress" name="poraddress" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="portel">聯絡電話</label>
              <input type="text" name="portel" class="form-control form-control-lg form-control-a">
            </div>
          </div>
          
          <div class="col-md-12 ">
         <c:forEach var="myacr" items="${Acrlist}" varStatus="s">
		 <c:choose>
		 <c:when test="${s.last}">
		 <input type="hidden" name="acrtotal" value="${myacr.acrtotal}">
		 </c:when>
		 </c:choose>
		 </c:forEach> 
		 	<input type="hidden" name="purid" value="${purid}">
            <input type="hidden" name="purname" value="<%=purVO.getPurname() %>">
          	<input type="hidden" name="porsum" value="${porsum}">
          	<input type="hidden" name="porprice" value="${purpricing*porsum}">
			<input type="hidden" name="porstatus" value="0">
			<input type="hidden" name="memno" value="${memno}">
			<input type="hidden" name="porlogistics" value="0">
			<input type="hidden" name="action" value="insert">
            <button type="submit" class="btn btn-b">確認送出</button>
           <img src="<%=request.getContextPath()%>/frontend/pur/purpic/main.png" height="20" width="20" onClick="idwrite(this)">
          </div>
           </div>
      </form>
              </div>
            </div>
          </div>
        </div>


                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <br>

<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->
      </div>
<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->


    </div>
  </section>
<jsp:include page="/frontend/footer.jsp" />
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>
  
  <script>
function idwrite(name) {
	  form1.pormemname.value = "吳先生";
	  form1.portel.value="0938690706";
	 }
</script>
 <script> 

$(document).ready(function(){
	
	$("#twCityName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json3Read",
			 data: {"action":"twCityName",
				 	"twCityName":$('#twCityName option:selected').val()},
			 dataType: "json",
			 success: function(result){
				 $("#CityAreaName").empty();
				
				 $("#CityAreaName").append("<option >--請選擇區域--</option>")
				 for(var i=0; i<result.length; i++){
				 	$("#CityAreaName").append('<option value="'+result[i]+'">'+result[i]+'</option>');
				 }
			 },
	         error: function(){
	        	 alert("AJAX-grade發生錯誤囉!")
	        	 }
	    });
	});
	
	$("#CityAreaName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json3Read",
			 data: {"action":"CityAreaName",
				 	"twCityName":$('#twCityName option:selected').val(),
				 	"CityAreaName":$('#CityAreaName option:selected').val()},
			 dataType: "json",
			 success: function(result){
				 $("#AreaRoadName").empty();
				 $("#AreaRoadName").append("<option >--請選擇區域--</option>")
				 for(var i=0; i<result.length; i++){
				 	$("#AreaRoadName").append('<option value="'+result[i]+'">'+result[i]+'</option>');
				 }
			 },
	         error: function(){
	        	 alert("AJAX-grade發生錯誤囉!")
	        	 }
	    });
	});
	
	
	$("#btnLoc").click(function(){
		
		var twCityName = ($('#twCityName').get(0).selectedIndex)>0? $('#twCityName option:selected').val() :'';
		
		var CityAreaName = ($('#CityAreaName').get(0).selectedIndex)>0? $('#CityAreaName option:selected').val() :'';
		
		var AreaRoadName = ($('#AreaRoadName').get(0).selectedIndex)>0? $('#AreaRoadName option:selected').val() :'' ;
		
		var num = $('#num').val().trim().length != 0 ? $('#num').val()+"號" :'' ; 

		var locTotal = twCityName+CityAreaName+AreaRoadName+num;
		$("#poraddress").attr("value",locTotal);
		
	});	
})


</script>
</body>
</html>
