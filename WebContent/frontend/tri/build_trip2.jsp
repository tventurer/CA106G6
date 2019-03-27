<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spo.model.*"%>
<%@ page import="com.spo.controller.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap/css/bootstrap.min.css">
<title>建立行程</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />

<style>
html, body {
  height: 100%;
  width: 100%;
  margin: 0;
  padding: 0;
}
#map {
  height: 100%;
  width: 100%;
}
#cityList{
	overflow: scroll; 
	height: 252px;
}
::-webkit-scrollbar {
width: 5px;
}
::-webkit-scrollbar-track {
-webkit-border-radius: 10px;
border-radius: 10px;
margin:5px 0 5px 0;
}
::-webkit-scrollbar-thumb {
-webkit-border-radius: 4px;
border-radius: 4px;
background: rgb(219,219,219);
}
#nextStep{
position: absolute;
z-index: -1;
}
label{
margin-left: 15px;
}
.xdsoft_datetimepicker .xdsoft_datepicker {
width:  300px;
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
height: 151px;
}
font{
color: red;
}
b {
color: red;	  
}
</style>
<script src="<%= request.getContextPath()%>/frontend/tri/js/jquery-2.1.4.min.js"></script>
<script src="<%= request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script src="<%= request.getContextPath()%>/frontend/tri/js/gmap3.min.js"></script>
</head>
<body>

<div id="map"></div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJDWHf2nJvG1HGWjhDSz95Gv8E0h_ZFp0"></script>
</body>

<script>

<%
//錯誤處理
Map<String,String> errorMsgs = (Map<String,String>)request.getAttribute("errorMsgs");
if(errorMsgs != null){
	if(!errorMsgs.isEmpty()){%>
		$(this).load(function(){
			show();
		});
<%}}%>

<%
//城市轉經緯度(寫死提升效能)
SpoService spoSvc = new SpoService();
List<String> citys = spoSvc.getAllCity();
List<double[]> latlngs = new ArrayList<double[]>();
// for(String city: citys){
// 	double[] latlng = AddrToLatLong.getLatLong(city);
latlngs.add(new double[]{25.1276033, 121.7391833});	//基隆市
latlngs.add(new double[]{25.0329694, 121.5654177}); //台北市
latlngs.add(new double[]{25.0169826, 121.4627868}); //新北市
latlngs.add(new double[]{24.9936281, 121.3009798}); //桃園市
latlngs.add(new double[]{24.1477358, 120.6736482}); //台中市
latlngs.add(new double[]{23.4800751, 120.4491113}); //嘉義市
latlngs.add(new double[]{24.8138287, 120.9674798}); //新竹市
latlngs.add(new double[]{24.7021073, 121.7377502}); //宜蘭縣
latlngs.add(new double[]{23.4518428, 120.2554615}); //嘉義縣
latlngs.add(new double[]{23.9871589, 121.6015714}); //花蓮縣
latlngs.add(new double[]{24.0517963, 120.5161352}); //彰化縣
latlngs.add(new double[]{24.8387226, 121.0177246}); //新竹縣
latlngs.add(new double[]{24.560159, 120.8214265}); //苗栗縣
latlngs.add(new double[]{23.9609981, 120.9718638}); //南投縣
latlngs.add(new double[]{22.9997281, 120.2270277}); //台南市
latlngs.add(new double[]{22.7972447, 121.0713702}); //台東縣
latlngs.add(new double[]{23.7092033, 120.4313373}); //雲林縣
latlngs.add(new double[]{22.6272784, 120.3014353}); //高雄市
latlngs.add(new double[]{22.5519759, 120.5487597}); //屏東縣
latlngs.add(new double[]{24.3487792, 118.3285644}); //金門縣
latlngs.add(new double[]{26.160243, 119.9516652}); //連江縣
latlngs.add(new double[]{23.571486, 119.579161}); //澎湖縣
%>

var position = { lat: 23.632519 , lng: 119.005576 };
var markers = new Array();
var map = $('#map')
      .gmap3({
        center: position,
        zoom: 8,
        clickableIcons: false,
     	mapTypeControl: false,
     	streetViewControl: false,
     	zoomControl: false,
     	disableDoubleClickZoom: true,
     	scrollwheel: false,
     	draggable: false,
      })
      .overlay({
        position: { lat: 25.006946 , lng: 115.600285 },
        content:  '<div class="container">' +
        '<div class="row">' +
          '<div class="col-6">' +
	        '<div class="card" style="width: 23rem; color:#000000; border:1px solid grey;background-color: white;">' +
	        '<div class="card-body">' +
	          '<h2 class="card-title">選擇旅遊城市</h2>' +
	        '</div>' +
	        '<div id="cityList">' +
	        '<ul class="list-group list-group-flush">' +
	        <% for(int i = 0; i < citys.size(); i++){%>
	          '<button id="<%= i %>" class="list-group-item list-group-item-action city" value="<%= citys.get(i) %>"><h5><%= citys.get(i) %></h5></button>' +
	      	<%}%>
	        '</ul>' +
	        '</div>' +
	        '<center><b>${errorMsgs.city}${errorMsgs.error}</b></center><div class="card-body">' +
	          '<center><button onclick="show()" class="btn btn-success">下一步</button><center>' +
	        '</div>' +
	      '</div>' +
	      '</div>' +
	      
	      '<div class="col-8" id="nextStep">' +
	        '<div class="card" style="width: 23rem; color:#000000; border:1px solid grey;background-color: white;">' +
	        '<div class="card-body">' +
	          '<h2 class="card-title">我的行程</h2>' +
	        '</div>' +
	        '<form method="post" action="tri">' +
	        '<div class="form-group row">' +
				'<label class="col-sm-4 col-form-label"><h5><font>*</font>行程名稱</h5></label>' +
				'<div class="col-sm-7">' +
					'<input type="text" class="form-control" name="triname" value="${param.triname}"><b>${errorMsgs.triname}</b>' +
				'</div>' +
			'</div>' +
			'<div class="form-group row">' +
				'<label class="col-sm-4 col-form-label"><h5><font>*</font>出發日期</h5></label>' +
				'<div class="col-sm-7">' +
					'<input type="text" id="start_date" class="form-control" name="tribegdate" value="${param.tribegdate}"><b>${errorMsgs.tribegdate}</b>' +
				'</div>' +
			'</div>' +
			'<div class="form-group row">' +
				'<label class="col-sm-4 col-form-label"><h5><font>*</font>回程日期</h5></label>' +
				'<div class="col-sm-7">' +
					'<input type="text" id="end_date" class="form-control" name="trienddate" value="${param.trienddate}"><b>${errorMsgs.trienddate}</b>' +
				'</div>' +
			'</div>' +
			'<div class="form-group row">' +
				'<label class="col-sm-4 col-form-label"><h5>行程人數</h5></label>' +
				'<div class="col-sm-7">' +
					'<input type="number" class="form-control" name="tripeonum" min="1" max="10" value="${param.tripeonum}">' +
				'</div>' +
			'</div>' +
	        '<div class="card-body">' +
	        '<input type="hidden" name="action" value="insert">' +
	          '<center><button type="submit" class="btn btn-success">下一步</button><center>' +
	        '</div>' +
	        '</form>' +
	      '</div>' +
	      '</div>' +
	      
      	'</div>' +
      '</div>'     
      })
      <% for(int i = 0; i < latlngs.size(); i++){%>
      .marker({
        position: { lat: <%= latlngs.get(i)[0] %>, lng: <%= latlngs.get(i)[1] %> },
        icon: "image/place.png",
      })
     <%}%>
     .on({
         load: function (marker) {
           markers = marker
           debugger
         }
     });
     
     
//滑窗動畫
function show(){
	$("#nextStep").animate({left:'400px'},"slow");
}

//將選擇城市
$(this).load(function(){
	var g = map.marker;
	var s = $.makeArray();
	console.log(g)
	debugger
	$(".city").on("click",function(e){
		debugger
		$.ajax({
			 type: "POST",
			 url: "tri",
			 data: {"city": e.currentTarget.value,"action": "setCity"},
			 dataType: "text",
			 async: true,
			 success: function (){
				console.log("OK");
				},
	       error: function(){alert("AJAX發生錯誤")}
	   });
	});
});

$(this).load(function(){
	$(".city").on("mouseover",function(e){
		var k = e.currentTarget.id;
		debugger
	});
});

//datetimepicker
$(this).load(function(){
	$.datetimepicker.setLocale('zh'); // kr ko ja en
	$(function(){
		 $('#start_date').datetimepicker({
		  format:'Y-m-d',
		  onShow:function(){
		   this.setOptions({
			 minDate:'-1970-01-01',
			 maxDate:$('#end_date').val()?$('#end_date').val():false
		   })
		  },
		  timepicker:false
		 });
		 
		 $('#end_date').datetimepicker({
		  format:'Y-m-d',
		  onShow:function(){
		   this.setOptions({
		    minDate:$('#start_date').val()?$('#start_date').val():false
		   })
		  },
		  timepicker:false
		 });
	});
});
</script>
<script src="<%= request.getContextPath() %>/bootstrap/popper.min.js"></script>
<script src="<%= request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
</html>