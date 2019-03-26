<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>
<% 
  MemVO memVO = (MemVO) request.getAttribute("memVO");
  List<String> listCity = Arrays.asList(new String[] {
		    "基隆市",
		    "台北市",
		    "新北市",
		    "桃園市",
		    "新竹市",
		    "新竹縣",
		    "苗栗縣",
		    "台中市",
		    "彰化縣",
		    "南投縣",    
		    "雲林縣",
		    "嘉義市",
		    "嘉義縣",
		    "台南市",
		    "高雄市",
		    "屏東縣",
		    "台東縣",
		    "花蓮縣",
		    "宜蘭縣",
		    "澎湖縣",
		    "金門縣",
		    "連江縣"
  });
  request.setAttribute("listCity", listCity);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊新會員</title>

  <jsp:include page="/frontend/navbar.jsp" />
  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/style/f/img/favicon.png" rel="icon">
  <link href="<%=request.getContextPath()%>/style/f/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<%=request.getContextPath()%>/style/f/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<%=request.getContextPath()%>/style/f/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/animate/animate.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/style/f/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<%=request.getContextPath()%>/style/f/css/style.css" rel="stylesheet">



</head>

<body>
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">註冊新會員</h1>
            <span class="color-text-a">T-Venture</span>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->


  <!--/ Contact Star /-->
  <section class="contact">
    <div class="container">
      <div class="row">
        
        <div class="col-sm-12 section-t8">
          <div class="row">
            <div class="col-md-7">
              <form action="<%=request.getContextPath()%>/backend/mem/mem" method="post" name="form1">
                
                <div class="row">
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                    <p>帳號</p>
                      <input type="text" name="memacc" class="form-control form-control-lg form-control-a" placeholder="你的帳號" data-rule="minlen:4" data-msg="帳號不得少於四個字元">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                    <p>密碼</p>
                      <input type="password" name="mempwd" class="form-control form-control-lg form-control-a" placeholder="你的密碼" data-rule="minlen:4" data-msg="密碼不得少於四個字元">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                    <p>再次確認密碼</p>
                      <input type="password" name="password" class="form-control form-control-lg form-control-a" placeholder="請再次輸入密碼" data-rule="minlen:4" data-msg="密碼不得少於四個字元">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                    <p>你的email</p>
                      <input name="mememail" type="email" class="form-control form-control-lg form-control-a" placeholder="你的email" data-rule="email" data-msg="email格式不符">
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                    <p>你的姓名</p>
                      <input type="text" name="memrealname" class="form-control form-control-lg form-control-a" placeholder="請輸入真實姓名">
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                    <p>你的英文名字</p>
                      <input type="text" name="memengname" class="form-control form-control-lg form-control-a" placeholder="請輸入英文姓名">
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <input type="text" name="memphone" class="form-control form-control-lg form-control-a" placeholder="請輸入聯絡電話">
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <p>出生年月日</p>
                      <input type="text" name="membirth" class="form-control form-control-lg form-control-a" placeholder="" id="f_date1">
                    </div>
                  </div>
  <div class="container">
	<div class="row">
    	<div class="col">
			<div class="dropdown ">
	  <p>請輸入地址</p>
	  <select id="twCityName">
			  <option >--請選擇縣市--</option>
			  <c:forEach var="city" items="${listCity}">
			  	<option value="${city}"> ${city}</option>
			  </c:forEach>
	  </select>
	  
	  <select id="CityAreaName" >
			  <option >--請選擇區域--</option>
	  </select>
			    
      <select id="AreaRoadName" >
			  <option >--請選擇路名--</option>
	  </select>	    
	  
	  <input type="text" placeholder="請輸入門牌號碼" id="num">
	  
	  <button type="button" id="buttonLoc">確認地址</button>	    			    
			</div>
		</div>
	</div>
	<div class="row">
		 <input id="addressTotal" name="memaddr" type="text" size="50" >   
	</div>

	</div>
                  <div class="col-md-12">
                    <input type="hidden" name="action" value="signup">
                    <input type="hidden" name="membankacc" value="">
                    <button type="submit" class="btn btn-a">註冊會員</button>
                    <img src="<%=request.getContextPath()%>/frontend/pur/purpic/main.png" height="20" width="20" onClick="idwrite(this)">
                  </div>
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Contact End /-->
<jsp:include page="/frontend/footer.jsp" />
</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Date membirth = null;
  try {
	    membirth = memVO.getMembirth();
   } catch (Exception e) {
	    membirth = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=membirth%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           maxDate:               '+1970-01-01'  // 去除今日(不含)之後
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

<script>
function idwrite(name) {
	  form1.memacc.value = "TIBAME";
	  form1.mempwd.value="123456";
	  form1.password.value="123456";
	  form1.mememail.value="gasbomb@gmail.com";
	  form1.memrealname.value = "大衛海鮮";
	  form1.memengname.value="Davie Seafood";
	  form1.memphone.value="0912345678";
	  form1.membirth.value="1990-01-01";
	  form1.memaddr.value="桃園市中壢區中大路300號";

	 }
</script>

<script> 

$(document).ready(function(){
	
	$("#twCityName").change(function(){
		$.ajax({
			 type: "POST",
			 url: "<%=request.getContextPath()%>/Json64Read",
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
			 url: "<%=request.getContextPath()%>/Json64Read",
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
	
	
	$("#buttonLoc").click(function(){
		
		var twCityName = ($('#twCityName').get(0).selectedIndex)>0? $('#twCityName option:selected').val() :'';
		
		var CityAreaName = ($('#CityAreaName').get(0).selectedIndex)>0? $('#CityAreaName option:selected').val() :'';
		
		var AreaRoadName = ($('#AreaRoadName').get(0).selectedIndex)>0? $('#AreaRoadName option:selected').val() :'' ;
		
		var num = $('#num').val().trim().length != 0 ? $('#num').val()+"號" :'' ; 

		var locTotal = twCityName+CityAreaName+AreaRoadName+num;
		$("#addressTotal").attr("value",locTotal);
		
	});
	
})


</script>
</html>