<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pur.model.*"%>

<%
PurVO purVO = (PurVO) request.getAttribute("purVO");

String name=(String)session.getAttribute("memno");
pageContext.setAttribute("name",name);
%>

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>


 <style>
  .img-fluid{
  height:250px;
  }
</style>
  
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">修改代購商品</h1>
            <span class="color-text-a">未上架的商品都可以做修改唷~!按下上架商品即可上架 ~ 祝您交易愉快 !</span>
          </div>
        </div>

        <!--/ 此處可放搜尋類別路徑 /-->
<!--         <div class="col-md-12 col-lg-4"> -->
<!--           <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end"> -->
<!--             <ol class="breadcrumb"> -->
<!--               <li class="breadcrumb-item"> -->
<!--                 <a href="#">首頁</a> -->
<!--               </li> -->
<!--               <li class="breadcrumb-item" aria-current="page"> -->
<%--               <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">代購商品</a> --%>
<!--               </li> -->
<!--               <li class="breadcrumb-item active"> -->
<!--                 <a>修改代購商品</a> -->
<!--               </li> -->
<!--             </ol> -->
<!--           </nav> -->
<!--         </div> -->
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->
    <section class="property-single nav-arrow-b">
<form class="form-a" name="form1" METHOD="post" ACTION="pur" enctype="multipart/form-data">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-5">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
				<img  width="400px" height="80%" id="purpicimg" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}">
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">商品詳情</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>商品圖片：</strong>
                      <span><input type="file" name="purpic" id="purpic" size="45"  value="<%=purVO.getPurpic()%>" /></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>下架時間：</strong>
                      <span><input name="purobtained" id="f_date1" type="text"></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>預計出貨時間：</strong>
                      <span><input type="text" name="purextime" id="f_date2" type="text"></span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>提供收據：</strong>
                      <strong>
                      <%String purreceipt[]={"不提供","提供"};
	                      for(int j = 0; j <purreceipt.length; j++){
	              			if(purVO.getPurreceipt()==j){
	              				out.print("<input type='radio' name='purreceipt' value='" + j + "'checked>"+ purreceipt[j]);
	              			}else{
	              				out.print("<input type='radio' name='purreceipt' value='" + j + "'>"+ purreceipt[j]);
	              			}}
							%></strong>
                    </li><li class="d-flex justify-content-between">
                      <strong>評價限制：</strong>
                      <strong><select size="1" name="purlimit">
						<%
						for(int x = 1; x < 11; x++){
							if(purVO.getPurlimit()==x){
								out.print("<option value='" + x + "' selected='selected'>"+x+"</option>");
							}else{
								out.print("<option value='" + x + "'>"+x+"</option>");
							}
						}
						%>
					</select></strong>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 section-md-t4">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h4 class="title-d">商品內容</h4>
                  </div>
                </div>
              </div>
              <div class="property-description">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purname">代購商品名稱</label>
              <input type="TEXT" name="purname" size="45"  class="form-control form-control-lg form-control-a" value="<%=purVO.getPurname()%>" />
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purcontent">商品描述</label>
              <textarea class="form-control rounded-0" name="purcontent" id="purcontent" rows="4" ><%=purVO.getPurcontent()%></textarea>
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="pursort">商品類別</label>
              <select size="1" name="pursort">
				<%String pursort[]={"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
					for(int i = 0; i<pursort.length; i++){
					if(purVO.getPursort()==i){
						out.print("<option value='" + i + "' selected='selected' >"+ pursort[i]+ "</option>");
					}else{
						out.print("<option value='" + i + "'>"+ pursort[i]+ "</option>");
				}}%>
		</select>
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="pururl">參考網址</label>
             <input type="TEXT" name="pururl" size="45" class="form-control form-control-lg form-control-a" value="<%=purVO.getPururl()%>" />
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purcountry">購買國家</label>
              <input type="TEXT" name="purcountry" size="45" class="form-control form-control-lg form-control-a"
			 value="<%=purVO.getPurcountry()%>" />
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purdelivery">收貨國家</label>
             <input type="TEXT" name="purdelivery" size="45" class="form-control form-control-lg form-control-a"
			 value="<%= purVO.getPurdelivery()%>" />
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purreprice">參考售價</label>
             <input type="TEXT" name="purreprice" size="45" class="form-control form-control-lg form-control-a"
			 value="<%=purVO.getPurreprice()%>" />
            </div>
          </div><div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purpricing">此商品定價</label>
              <input type="TEXT" name="purpricing" size="45"
			 value="<%=purVO.getPurpricing()%>" class="form-control form-control-lg form-control-a"/>
            </div>
          </div>
          <div class="col-md-12 col-lg-8">
            <div class="form-group">
              <label for="purstock">商品數量</label>
              <input type="TEXT" name="purstock" size="45"
			 value="<%=purVO.getPurstock()%>" class="form-control form-control-lg form-control-a"/>
            </div>
          </div>
          
          <div class="col-md-12 ">
          	<input type="hidden" name="memno" value="${name}">
          	<input type="hidden" name="pursell" value="0">
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="purid" value="<%=purVO.getPurid() %>">
            <button type="submit" name="purstatus" value="1" class="btn btn-b">上架商品</button>
            <button type="submit" name="purstatus" value="0" class="btn btn-b">儲存</button>
          </div>
           </div>
              </div>
            </div>
          </div>
        </div>


                
              </div>
              </div>
  </form>
  </section>
  <br>

<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->
      </div>
<!-- 這個div不能刪掉不然頁碼的位置會跑掉! -->


    </div>
  </section>
  <!--/ Property Grid End /-->

  <!--/ footer Star /-->
<!--   <footer> -->
<!--     <div class="container"> -->
<!--       <div class="row"> -->
<!--         <div class="col-md-12"> -->
<!--           <nav class="nav-footer"> -->
<!--             <ul class="list-inline"> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Home</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">About</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Property</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Blog</a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#">Contact</a> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </nav> -->
<!--           <div class="socials-a"> -->
<!--             <ul class="list-inline"> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-facebook" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-twitter" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-instagram" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-pinterest-p" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--               <li class="list-inline-item"> -->
<!--                 <a href="#"> -->
<!--                   <i class="fa fa-dribbble" aria-hidden="true"></i> -->
<!--                 </a> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </div> -->
<!--           <div class="copyright-footer"> -->
<!--             <p class="copyright color-text-a"> -->
<!--               &copy; Copyright -->
<!--               <span class="color-a">T-Venturer</span> All Rights Reserved. -->
<!--             </p> -->
<!--           </div> -->
<!--           <div class="credits"> -->
<!--            
<!--               All the links in the footer should remain intact. -->
<!--               You can delete the links only if you purchased the pro version. -->
<!--               Licensing information: https://bootstrapmade.com/license/ -->
<!--               Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency -->
<!--             --> -->
<!--             Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </footer> -->
  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>


 <!-- JavaScript Libraries -->
  <script src="<%= request.getContextPath() %>/style/f/lib/popper/popper.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/easing/easing.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="<%= request.getContextPath() %>/style/f/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="<%= request.getContextPath() %>/style/f/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%= request.getContextPath() %>/style/f/js/main.js"></script>
</body>
</html>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Timestamp purobtained = null;
  try {
	  purobtained = purVO.getPurobtained();
   } catch (Exception e) {
	   purobtained = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>

<% 
   java.sql.Timestamp purextime = null;
  try {
	   purextime = purVO.getPurextime();
   } catch (Exception e) {
	   purextime = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>

$("#purpic").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#purpicimg").attr('src', e.target.result);
       $("#purpicimg").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({//下架時間
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=purobtained%>' 
		   // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
        $('#f_date2').datetimepicker({//預計出貨時間
 	       theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 	       value: '<%=purextime%>'  
 	       // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
            //startDate:	            '2017/07/10',  // 起始日
            //minDate:               '-1970-01-01', // 去除今日(不含)之前
            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
         });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>