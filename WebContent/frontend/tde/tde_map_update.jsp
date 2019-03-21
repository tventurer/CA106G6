<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spo.model.*"%>
<%@ page import="com.spo.controller.*"%>
<%@ page import="com.tde.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="timepicki/css/timepicki.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/datetimepicker/jquery.datetimepicker.css" />
<title>行程規劃</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 76%;
	width: 74.5%;
	position: absolute;
	right: 0.5%;
	bottom: 1%;
	border: dotted teal 5px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#tripList{
	overflow: auto; 
	height: 470px;
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

.xdsoft_datetimepicker .xdsoft_datepicker {
      width:  300px;   /* width:  300px; */
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
      height: 151px;   /* height:  151px; */
}

</style>
<!-- this is for autocomplete -->
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>

</head>
<jsp:include page="/frontend/navbar.jsp"/>
<body>



<section class="section-property section-t8">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-6" style="padding-left: 0px; margin:15px">
				

				<form>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="spoclass"
							id="all" value="all" onchange="addAllMarker()"> <label
							class="form-check-label" for="all">顯示全部</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="spoclass"
							id="spot" value="景點" onchange="addSpotMarker()"> <label
							class="form-check-label" for="spot">景點</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="spoclass"
							id="food" value="美食" onchange="addFoodMarker()"> <label
							class="form-check-label" for="food">美食</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="spoclass"
							id="museum" value="博物館" onchange="addMuseumMarker()"> <label
							class="form-check-label" for="museum">博物館</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="spoclass"
							id="night" value="夜生活" onchange="addNightMarker()"> <label
							class="form-check-label" for="night">夜生活</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" name="spoclass"
							id="hotel" value="飯店" onchange="addHotelMarker()"> <label
							class="form-check-label" for="hotel">飯店</label>
					</div>
<!-- 	=============	<input type="button" class="btn btn-primary" id="save" value="儲存行程" style="position: absolute; right: -40%; top: -50%"> -->
						<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#tripResult" id="tResult" value="查看行程規劃結果" style="position: absolute; right: -40%; top: -50%">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/frontend/tde/modal.jsp"/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-1">
				<ul class="list-group" id="dayUl">
				  <li class="list-group-item"><a href="javascript:void(0)" class="day">D1</a></li>
				  <li class="list-group-item"><a href="javascript:void(0)" class="day">D2</a></li>
				  <li class="list-group-item"><a href="javascript:void(0)" class="day">D3</a></li>
				  <li class="list-group-item"><a href="javascript:void(0)" class="day">D4</a></li>
				  <li class="list-group-item"><a href="javascript:void(0)" class="day">D5</a></li>
				  <li class="list-group-item add"><a href="javascript:void(0)"><img src="image/addDay.png"></a></li>
				  <li class="list-group-item" id="cloneDay" style="display:none"><a href="javascript:void(0)" class="day"></a></li>
				</ul>
			</div>
			<div class="col-2" style="padding-left:0px; ">
				<ul class="list-group">
				  <li class="list-group-item">
				  	<input type="text" class="form-control" name="tribegdate" id="tribegdate" value="${triVO.tribegdate}" onchange="changeDate()" style="border: 0px; width: 150px; height: 20px">
				  	<input type="text" class="form-control" name="cityname" value="${city}" style="border: 0px; width: 150px; height: 20px"  id="changeCity">
				  </li>
				  <div id="tripList"></div>
				</ul>
			</div>
		</div>
	</div>
</section>
	<script src="timepicki/js/timepicki.js"></script>
	<script src="<%= request.getContextPath() %>/datetimepicker/jquery.datetimepicker.full.js"></script>
	<div id="map"></div>

	<!-- 付費的 -->
		    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJDWHf2nJvG1HGWjhDSz95Gv8E0h_ZFp0"></script>
	<!-- 非付費的    -->

<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYmC8oUYc9DGAZn8hqZKakFeclhAbTRSI"></script> -->

<script>

<% 
//依使用者選擇的城市換算緯經度傳給初始化地圖
TdeService tdeSvc = new TdeService();
SpoService spoSvc = new SpoService();
//取行程中第一天第一個景點的城市為初始城市
String city = spoSvc.getOneSpo(tdeSvc.getAllByTri("TRI000001").get(0).getSpono()).getSpocity();
double[] latlong = AddrToLatLong.getLatLong(city);
%>

	var map;
	var city = "${city}";
	var lat = <%= latlong[0] %>;
	var lng = <%= latlong[1] %>;
	//使用者更改城市條件時觸發此Ajax事件移動地圖
	$("#changeCity").on("keyup", function(){
		var xhr = new XMLHttpRequest();
		xhr.onload = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					debugger
					var citys = JSON.parse(xhr.responseText);
					$("#changeCity").autocomplete({
						source: citys,
						select: function (e, ui) {
							
					        var xhr = new XMLHttpRequest();
					        city = ui.item.value;
					        xhr.onload = function(){
					        	if(xhr.readyState == 4){
					        		if(xhr.status == 200){
					        			var text = xhr.responseText;
					        			var latlng = text.split("/");
					        			lat = parseFloat(latlng[0]);
					        			lng = parseFloat(latlng[1])
					        			debugger
					        			map.panTo({ lat: lat, lng: lng });
										map.setZoom(13);
					        		} else{
					        			alert(xhr.status);
					        		}
					        	}
					        }
					        
					        xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/ChangeCityAjax", true);
					        xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
					        xhr.send("action=getLatLong&city=" + ui.item.value);
					    }
					});
					
					
				} else{
					alert(xhr.status);
				}
			}
		}
		
		city = $("#changeCity").val();
		var content = encodeURIComponent(city);
		
		debugger
		xhr.open("POST", "../tde/ChangeCityAjax", true);
		xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
		xhr.send("action=getContent&content=" + content);
	});
	
	//設定換天數時的儲存Ajax事件(打包tdeVO)
	var day = "D1";
	var index = parseInt(day.substring(1,2));
	var whichDate = "${triVO.tribegdate}";
	
function changeDate(){
	whichDate = $("#tribegdate").val();
}
	
	$(".day").on("click", makeTdeVO);

function makeTdeVO(e){
		
		//在換頁時的點擊事件儲存使用者輸入的時間於tripList(須注意最後送出時的當頁時間可能沒有寫入javascript物件)
		debugger
		var startTime = $(".startTime").serializeArray();
		var finishTime = $(".finishTime").serializeArray();
		if(typeof(tripList[index-1]) == "undefined"){
			tripList[index-1] = new Array();
		}
		for(var i=0; i<tripList[index-1].length; i++){
			tripList[index-1][i]["tdestart"] = startTime[i].value;
			debugger
			tripList[index-1][i]["tdefinish"] = finishTime[i].value;
		}
		
		var currentday = day;
		
		//更改天數變數
        var obj = $(".day");
		var size = $(".day").length;
		if(typeof(e) != "undefined"){	
			for(var i=0; i<size; i++){
				if(obj[i] == e.currentTarget){
					day = "D" + (i+1);
					index = parseInt(day.substring(1,2));
					console.log("day=" + day);
				}
			}
		}
		
		//日期天數設定
		var date = new Date(whichDate.substring(0,4), (whichDate.substring(5,7))-1, whichDate.substring(8,10));
		var nextDate = date.getTime() + (index-1)*24*60*60*1000;
		var y = new Date(nextDate).getFullYear().toString();
		var m = parseInt(new Date(nextDate).getMonth()) + 1;
		var d = new Date(nextDate).getDate();
		debugger
		if(m < 10){
			m = "0" + m;
		}
		if(d < 10){
			d = "0" + d;
		}
		debugger
		$("#tribegdate").val( y + "-" + m + "-" + d);
		if(day != "D1"){
			$("#tribegdate").off("mousedown");
		} else{
			$(function(){
				 $('#tribegdate').datetimepicker({
				  format:'Y-m-d',
				  onShow:function(){
				   this.setOptions({
					   minDate: '-1970-01-01'			    
				   })
				  },
				  timepicker:false
				 });
			});
			debugger
		}
		
		var xhr = new XMLHttpRequest();
		xhr.onload = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					debugger
					if(xhr.responseText == "null"){
						map.panTo({ lat: lat, lng: lng });
						map.setZoom(13);
						debugger
						$("#all").prop("checked", false);
						$("#spot").prop("checked", false);
						addSpotMarker();  //關閉marker
						$("#food").prop("checked", false);
						addFoodMarker();
						$("#museum").prop("checked", false);
						addMuseumMarker();
						$("#night").prop("checked", false);
						addNightMarker();
						$("#hotel").prop("checked", false);
						addHotelMarker();
						debugger
						$("#tripList li").remove();
						drcDisplay.set("directions", null);
						for(var i=0; i < newMarker.length; i++){
							  newMarker[i].setMap(null);
				              newMarker[i] = null;
				              debugger
				          }
				    	  newMarker = [];

					} else{
						debugger
						$("#tripList li").remove();
						getTripList();
						if(tripList[index-1].length > 1){
                        	direction();
                        }
					}
				}else{
					alert(xhr.status);
				}
			} 
		}
		
		var tdestart = $(".startTime").serialize();  //tdestart=01%3A00&tdestart=20%3A59
		var tdefinish = $(".finishTime").serialize();
		
		var tdestart_clean = encodeURIComponent(tdestart);
		var tdefinish_clean = encodeURIComponent(tdefinish);
		
		debugger
		xhr.open("POST", "<%= request.getContextPath()%>/frontend/tde/tde", true);
		xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
        xhr.send("action=makeTdeVO&tdedate=" + currentday + "&tdestart=" + tdestart_clean + "&tdefinish=" + tdefinish_clean + "&xmlday=" + day + "&whichDate=" + whichDate);
      
	}
	
	$("#tResult").on("click", cloneNode);
	
	var tripList = new Array();
	
	
//從TdeService中呼叫方法拿出該行程集合轉javascript物件=====================================
	<% 
	List<TdeVO> tdeList = tdeSvc.getAllByTri("TRI000001");
	Map<String,List<SpoVO>> map = new LinkedHashMap<String,List<SpoVO>>();
	List<SpoVO> spoList = new ArrayList<SpoVO>();
	
	for(TdeVO tdeVO : tdeList){
// 		if(tdeVO.getTdedate){
			
// 		}
	}
	Map<String,List<SpoVO>> dayTripList = (Map<String,List<SpoVO>>)session.getAttribute("dayTripList");
	   List<SpoVO> tripList = null; 
	   if(dayTripList != null){
	   	 for(int j=0; j<dayTripList.keySet().size(); j++){
		    	tripList = dayTripList.get("D"+(j+1));
	   		if(tripList != null){%>
				tripList[<%= j %>] = new Array(
					<%for(int i=0; i<tripList.size(); i++){%>
					{
						sponame:"<%= tripList.get(i).getSponame() %>",
						spoclass:"<%= tripList.get(i).getSpoclass() %>",
						spocon:"<%= tripList.get(i).getSpocon() %>",
						spocity:"<%= tripList.get(i).getSpocity() %>",
						spolat:"<%= tripList.get(i).getSpolat() %>",
						spolong:"<%= tripList.get(i).getSpolong() %>",
						spoaddr:"<%= tripList.get(i).getSpoaddr() %>",
						spocontent:"<%= tripList.get(i).getSpocontent() %>"
						},
					<%}%>
				);
	 	  <%}}}%>
	
      debugger
      //初始化地圖
      function initMap() {
        var position = { lat: <%= latlong[0] %>, lng: <%= latlong[1] %> };
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: position,
          clickableIcons: false
        });
		
        // 放置路線圖層
        drcDisplay.setMap(map);
        
      }
      var request;
      var drcSvc = new google.maps.DirectionsService();
  	  var drcDisplay = new google.maps.DirectionsRenderer({suppressMarkers: true});
  	  var newMarker = new Array();
  	  
      function direction(){
    		//經過地點設定
    		var waypts = new Array();
        	for (var i = 0; i < tripList[index-1].length; i++) {
                
        		if(i == 0 || i == ((tripList[index-1].length)-1)){
                	continue;
                }	
        			waypts.push({
                        location: { lat: tripList[index-1][i].spolat, lng: tripList[index-1][i].spolong },
                        stopover: true
                	});
                
        	}
    	  	debugger
    	  	// 路線請求設定
    	    request = {
    	        origin: { lat: tripList[index-1][0].spolat, lng: tripList[index-1][0].spolong },
    	        destination: { lat: tripList[index-1][(tripList[index-1].length)-1].spolat, lng: tripList[index-1][(tripList[index-1].length)-1].spolong },
    	        waypoints: waypts,
                optimizeWaypoints: false,
    	        travelMode: "WALKING"
    	    };
    		
    		debugger

    	    // 繪製路線
    	    drcSvc.route(request, function (result, status) {
    	        if (status == 'OK') {
    	            // 回傳路線上每個步驟的細節
    	            console.log(result.routes[0].legs[0].steps);
    	            var steps = result.routes[0].legs[0].steps;
    	            console.log("steps:" + steps);
    	            drcDisplay.setDirections(result);
    	            for(var i=0; i<tripList[index-1].length; i++){
    	                // 加入地圖標記
    	                newMarker[i] = new google.maps.Marker({
    	                position: { lat: tripList[index-1][i].spolat, lng: tripList[index-1][i].spolong },
    	                map: map,
    	                label: { text: (i+1) + '', color: "#fff" }
    	                });
    	                debugger
    	            }
    	            
    	        } else {
    	            console.log(status);
    	        }
    	    });
      }
      
      // Adds all marker to the map.
      var allMarkers = new Array();
      function addAllMarker() {
    	  
    	  if($("#all").prop("checked")){
    		  	$("#spot").prop("checked", true);
				addSpotMarker();
				$("#food").prop("checked", true);
				addFoodMarker();
				$("#museum").prop("checked", true);
				addMuseumMarker();
				$("#night").prop("checked", true);
				addNightMarker();
				$("#hotel").prop("checked", true);
				addHotelMarker();
      	   }else{
      		 	$("#spot").prop("checked", false);
				addSpotMarker();
				$("#food").prop("checked", false);
				addFoodMarker();
				$("#museum").prop("checked", false);
				addMuseumMarker();
				$("#night").prop("checked", false);
				addNightMarker();
				$("#hotel").prop("checked", false);
				addHotelMarker();
      	   }
      }

</script>
     
<script> 
      //顯示景點標籤設定
      var spotMarkers = new Array();   //此陣列作為移除marker使用
      var marker = new Array();
      var spoList;
      var smTimeout = new Array();  //marker的setTimeout
      var siTimeout = new Array();  //infoWindow的setTimeout
	  var isOpen = false;
      
      function addSpotMarker(){
    	  if($("#spot").prop("checked")){

            $.ajax({
                 type: "POST",
                 url: "<%= request.getContextPath() %>/frontend/tde/GetClassAjax",
                 data: {"spoclass": "景點", "spocity": city},
                 dataType: "json",
                 async: true, 
                 success: function (data){
                    console.log(data);
                    spoList = data;
                    debugger
                    var position = new Array();
                    var iWindow = new Array();
                    var content = new Array();
                    
                    debugger
                    for(var i=0; i<spoList.length; i++){
                        position[i] = { lat: spoList[i].spolat, lng: spoList[i].spolong };
                        marker[i] = new google.maps.Marker({
                        	position: position[i],
                            map: map,
                            icon: "image/place.png"
                        });
                        debugger
                        spotMarkers[i] = marker[i];
                        
						debugger
                        //第一個觸發的marker mouseover事件,在infoWindow domready事件中即註冊mouse事件
                        marker[i].addListener('mouseover', function(){
                        	var k = this;
                        	var num = marker.indexOf(this);
                        	
                        	if(iWindow[num])
                          		iWindow[num].close();
                        	
                        	debugger
                            //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                            content[num] = "<div id='mouseEventSpot" +num+ "'><h8>" + spoList[num].sponame +
                             "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addSpot" +num+ "'><img src='image/add.png'></a></div>" + 
                             "<script>var smTimeout=new Array(); smTimeout[" +num+ "]=" + smTimeout[num] + "var siTimeout=new Array(); siTimeout=[" +num+ "]=" + siTimeout[num];
                            iWindow[num] = new google.maps.InfoWindow({
                                content: content[num],
                                maxWidth: 500 
                             });
                        	
                        	
                        	debugger
                            clearTimeout(smTimeout[num]);  //要先clearTimeout(避免marker滑出滑入時被setTimeout關閉)
                            debugger
                            if(!isOpen){
                            	iWindow[num].open(map, this);
                            	isOpen = true;
                            }
                            google.maps.event.addListener(iWindow[num], 'domready', function() {
                                document.getElementById("addSpot" +num).addEventListener("click", function(){

                                    //Ajax處理新增行程
                                    var xhr = new XMLHttpRequest();
                                    var pos = this.id.charAt(this.id.length-1);
                                    xhr.onload = function(){
                                        if( xhr.readyState == 4 ){
                                            if(xhr.status == 200){

                                                var spot = JSON.parse(xhr.responseText);
                                                debugger
                                                if(xhr.responseText != "null"){
                                                    debugger
                                                    if(typeof(tripList[index-1]) == "undefined"){
                                                        tripList[index-1] = new Array();
                                                    }
                                                    tripList[index-1].push(spot);

                                                    $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/place.png"></li>');
                                                    
                                                    console.log("spot:"+ spot.sponame);
                                                    
                                                    var sValue = tripList[index-1][tripList[index-1].length-1].tdestart;
                                                    if(typeof(sValue) == "undefined"){
                                                          sValue = "";
                                                    }
                                                  
                                                    var fValue = tripList[index-1][tripList[index-1].length-1].tdefinish;
                                                    if(typeof(fValue) == "undefined"){
                                                         fValue = "";
                                                    }
                                                    
                                                    $("#tripList li:last").append("<h9>" + spot.sponame + "</h9>&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' id='delSpot" +pos+ "'><img src='image/delete.png'></a>");
                                                    debugger
                                                    $("#tripList li:last").append('<div class="form-group row">'
                                                            + '<label class="col-sm-5 col-form-label" style="padding-left:0px">起始時間</label>'
                                                            + '<div class="col-sm-7" style="padding:0px">'
                                                            + "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' onchange='setMinHour()' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
                                                            + '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
                                                            + '<div class="col-sm-7" style="padding:0px">'
                                                            + "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' onchange='setMinHour()' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
                                                            + '</div></div>');
                                                    
                                                    
                                                    $("#delSpot" +pos).on("click", delSpot);
                                                    
                                                    $('.startTime').timepicki();
                                                    
                                                    debugger
                                                    if(tripList[index-1].length > 1){
                                                    	direction();
                                                    }
                                                    debugger
                                                }

                                            }else{
                                                alert(xhr.status);
                                            }
                                        }
                                    }
                                    debugger
                                    xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
                                    xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
                                    xhr.send("action=ADD&sponame=" + spoList[pos].sponame + "&tdedate=" + day);
                                });
                                
                                document.getElementById("mouseEventSpot" +num).addEventListener("mouseover", function(){
                                    var pos = this.id.charAt(this.id.length-1);
                                	debugger
                                    clearTimeout(siTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                                    clearTimeout(smTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                                });

                                document.getElementById("mouseEventSpot" +num).addEventListener("mouseout", function(){
                                    var pos = this.id.charAt(this.id.length-1);
                                	debugger
                                    siTimeout[pos] = setTimeout(function(){
                                    	debugger
                                    	iWindow[pos].close();
                                    	iWindow[pos] = '';
                                    	isOpen = false;
                                    	}, 300);
                                });
                            });
                        });
                        
                        marker[i].addListener('mouseout', function(){
                            var pos = marker.indexOf(this);
                            debugger
                        	smTimeout[pos] = setTimeout(function(){
                        		iWindow[pos].close();
                        		isOpen = false;
                        		}, 300);
                        });
                        
                        
                    }
                 },
                error: function(){alert("AJAX發生錯誤")}
            })

        } else{
              for(var i=0; i < spotMarkers.length; i++){
                  spotMarkers[i].setMap(null);
              }
        }
    }
      
//       function setMinHour(){
//     	  $('.startTime').timepicki();
//     	  var len = ($(".startTime").length-1);
//           var minHourStr = $(".startTime:eq(" + len +")").val().substring(0,2);//09:36 PM
//           var minHour = parseInt(minHourStr);
//           console.log($('.startTime'))
//           console.log($(".finishTime"))
//           console.log('======'+minHour)
//           debugger
//           $(".finishTime").timepicki({min_hour_value: minHour});
//     	  	debugger
//       }
      
</script>      

<script>

//顯示美食標籤設定
var foodMarkers = new Array();   //此陣列作為移除marker使用
var foodMark = new Array();
var foodList;
var fmTimeout = new Array();  //marker的setTimeout
var fiTimeout = new Array();  //infoWindow的setTimeout
var isOpen = false;

function addFoodMarker(){
	  if($("#food").prop("checked")){

      $.ajax({
           type: "POST",
           url: "<%= request.getContextPath() %>/frontend/tde/GetClassAjax",
           data: {"spoclass": "美食", "spocity": city},
           dataType: "json",
           async: true, 
           success: function (data){
              console.log(data);
              foodList = data;
              debugger
              var position = new Array();
              var iWindow = new Array();
              var content = new Array();
              
              debugger
              for(var i=0; i<foodList.length; i++){
                  position[i] = { lat: foodList[i].spolat, lng: foodList[i].spolong };
                  foodMark[i] = new google.maps.Marker({
                  	position: position[i],
                      map: map,
                      icon: "image/ice-cream.png"
                  });
                  debugger
                  foodMarkers[i] = foodMark[i];
                  
					debugger
                  //第一個觸發的marker mouseover事件,在infoWindow domready事件中即註冊mouse事件
                  foodMark[i].addListener('mouseover', function(){
                  	var k = this;
                  	var num = foodMark.indexOf(this);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventFood" +num+ "'><h8>" + foodList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addFood" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var fmTimeout=new Array(); fmTimeout[" +num+ "]=" + fmTimeout[num] + "var fiTimeout=new Array(); fiTimeout=[" +num+ "]=" + fiTimeout[num];
                      iWindow[num] = new google.maps.InfoWindow({
                          content: content[num],
                          maxWidth: 500 
                       });
                  	
                  	
                  	debugger
                      clearTimeout(fmTimeout[num]);  //要先clearTimeout(避免marker滑出滑入時被setTimeout關閉)
                      debugger
                      if(!isOpen){
                      	iWindow[num].open(map, this);
                      	isOpen = true;
                      }
                      google.maps.event.addListener(iWindow[num], 'domready', function() {
                          document.getElementById("addFood" +num).addEventListener("click", function(){

                              //Ajax處理新增行程
                              var xhr = new XMLHttpRequest();
                              var pos = this.id.charAt(this.id.length-1);
                              xhr.onload = function(){
                                  if( xhr.readyState == 4 ){
                                      if(xhr.status == 200){

                                          var food = JSON.parse(xhr.responseText);
                                          debugger
                                          if(xhr.responseText != "null"){
                                              debugger
                                              if(typeof(tripList[index-1]) == "undefined"){
                                                  tripList[index-1] = new Array();
                                              }
                                              tripList[index-1].push(food);

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/ice-cream.png"></li>');
                                              
                                              console.log("food:"+ food.sponame);
                                              
                                              var sValue = tripList[index-1][tripList[index-1].length-1].tdestart;
                                              if(typeof(sValue) == "undefined"){
                                                    sValue = "";
                                              }
                                            
                                              var fValue = tripList[index-1][tripList[index-1].length-1].tdefinish;
                                              if(typeof(fValue) == "undefined"){
                                                   fValue = "";
                                              }
                                              
                                              $("#tripList li:last").append("<h9>" + food.sponame + "</h9>&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' id='delFood" +pos+ "'><img src='image/delete.png'></a>");
                                              debugger
                                              $("#tripList li:last").append('<div class="form-group row">'
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">起始時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
                                                      + '</div></div>');
                                              $(".time_element").timepicki();
                                              $("#delFood" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                          }

                                      }else{
                                          alert(xhr.status);
                                      }
                                  }
                              }
                              debugger
                              xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
                              xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
                              xhr.send("action=ADD&sponame=" + foodList[pos].sponame + "&tdedate=" + day);
                          });
                          
                          document.getElementById("mouseEventFood" +num).addEventListener("mouseover", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              clearTimeout(fiTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(fmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventFood" +num).addEventListener("mouseout", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              fiTimeout[pos] = setTimeout(function(){
                              	debugger
                              	iWindow[pos].close();
                              	iWindow[pos] = '';
                              	isOpen = false;
                              }, 300);
                          });
                      });
                  });
                  
                  foodMark[i].addListener('mouseout', function(){
                      var pos = foodMark.indexOf(this);
                      debugger
                      isOpen = false;
                  		fmTimeout[pos] = setTimeout(function(){
                  			iWindow[pos].close();
                  		}, 300);
                  });
                  
                  
              }
           },
          error: function(){alert("AJAX發生錯誤")}
      })

  } else{
        for(var i=0; i < foodMarkers.length; i++){
            foodMarkers[i].setMap(null);
        }
  }
}      
</script>

<script>

//顯示博物館標籤設定
var museumMarkers = new Array();   //此陣列作為移除marker使用
var museumMark = new Array();
var museumList;
var mmTimeout = new Array();  //marker的setTimeout
var miTimeout = new Array();  //infoWindow的setTimeout
var isOpen = false;

function addMuseumMarker(){
	  if($("#museum").prop("checked")){

      $.ajax({
           type: "POST",
           url: "<%= request.getContextPath() %>/frontend/tde/GetClassAjax",
           data: {"spoclass": "博物館", "spocity": city},
           dataType: "json",
           async: true, 
           success: function (data){
              console.log(data);
              museumList = data;
              debugger
              var position = new Array();
              var iWindow = new Array();
              var content = new Array();
              
              debugger
              for(var i=0; i<museumList.length; i++){
                  position[i] = { lat: museumList[i].spolat, lng: museumList[i].spolong };
                  museumMark[i] = new google.maps.Marker({
                  	position: position[i],
                      map: map,
                      icon: "image/museum.png"
                  });
                  debugger
                  museumMarkers[i] = museumMark[i];
                  
					debugger
                  //第一個觸發的marker mouseover事件,在infoWindow domready事件中即註冊mouse事件
                  museumMark[i].addListener('mouseover', function(){
                  	var k = this;
                  	var num = museumMark.indexOf(this);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventMuseum" +num+ "'><h8>" + museumList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addMuseum" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var mmTimeout=new Array(); mmTimeout[" +num+ "]=" + mmTimeout[num] + "var miTimeout=new Array(); miTimeout=[" +num+ "]=" + miTimeout[num];
                      iWindow[num] = new google.maps.InfoWindow({
                          content: content[num],
                          maxWidth: 500 
                       });
                  	
                  	
                  	debugger
                      clearTimeout(mmTimeout[num]);  //要先clearTimeout(避免marker滑出滑入時被setTimeout關閉)
                      debugger
                      if(!isOpen){
                      	iWindow[num].open(map, this);
                      	isOpen = true;
                      }
                      google.maps.event.addListener(iWindow[num], 'domready', function() {
                          document.getElementById("addMuseum" +num).addEventListener("click", function(){

                              //Ajax處理新增行程
                              var xhr = new XMLHttpRequest();
                              var pos = this.id.charAt(this.id.length-1);
                              xhr.onload = function(){
                                  if( xhr.readyState == 4 ){
                                      if(xhr.status == 200){

                                          var museum = JSON.parse(xhr.responseText);
                                          debugger
                                          if(xhr.responseText != "null"){
                                              debugger
                                              if(typeof(tripList[index-1]) == "undefined"){
                                                  tripList[index-1] = new Array();
                                              }
                                              tripList[index-1].push(museum);

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/museum.png"></li>');
                                              
                                              console.log("museum:"+ museum.sponame);
                                              
                                              var sValue = tripList[index-1][tripList[index-1].length-1].tdestart;
                                              if(typeof(sValue) == "undefined"){
                                                    sValue = "";
                                              }
                                            
                                              var fValue = tripList[index-1][tripList[index-1].length-1].tdefinish;
                                              if(typeof(fValue) == "undefined"){
                                                   fValue = "";
                                              }
                                              
                                              $("#tripList li:last").append("<h9>" + museum.sponame + "</h9>&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' id='delMuseum" +pos+ "'><img src='image/delete.png'></a>");
                                              debugger
                                              $("#tripList li:last").append('<div class="form-group row">'
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">起始時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
                                                      + '</div></div>');
                                              $(".time_element").timepicki({min_hour_value: 4});
                                              $("#delMuseum" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                          }

                                      }else{
                                          alert(xhr.status);
                                      }
                                  }
                              }
                              debugger
                              xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
                              xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
                              xhr.send("action=ADD&sponame=" + museumList[pos].sponame + "&tdedate=" + day);
                          });
                          
                          document.getElementById("mouseEventMuseum" +num).addEventListener("mouseover", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              clearTimeout(miTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(mmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventMuseum" +num).addEventListener("mouseout", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              miTimeout[pos] = setTimeout(function(){
                              	debugger
                              	iWindow[pos].close();
                              	iWindow[pos] = '';
                              	isOpen = false;
                              	}, 300);
                          });
                      });
                  });
                  
                  museumMark[i].addListener('mouseout', function(){
                      var pos = museumMark.indexOf(this);
                      debugger
                  	mmTimeout[pos] = setTimeout(function(){
                  		iWindow[pos].close();
                  		isOpen = false;
                  		}, 300);
                  });
                  
                  
              }
           },
          error: function(){alert("AJAX發生錯誤")}
      })

  } else{
        for(var i=0; i < museumMarkers.length; i++){
            museumMarkers[i].setMap(null);
        }
  }
}      
</script>

<script>

//顯示夜生活標籤設定
var nightMarkers = new Array();   //此陣列作為移除marker使用
var nightMark = new Array();
var nightList;
var nmTimeout = new Array();  //marker的setTimeout
var niTimeout = new Array();  //infoWindow的setTimeout
var isOpen = false;

function addNightMarker(){
	  if($("#night").prop("checked")){

      $.ajax({
           type: "POST",
           url: "<%= request.getContextPath() %>/frontend/tde/GetClassAjax",
           data: {"spoclass": "夜生活", "spocity": city},
           dataType: "json",
           async: true, 
           success: function (data){
              console.log(data);
              nightList = data;
              debugger
              var position = new Array();
              var iWindow = new Array();
              var content = new Array();
              
              debugger
              for(var i=0; i<nightList.length; i++){
                  position[i] = { lat: nightList[i].spolat, lng: nightList[i].spolong };
                  nightMark[i] = new google.maps.Marker({
                  	position: position[i],
                      map: map,
                      icon: "image/beer.png"
                  });
                  debugger
                  nightMarkers[i] = nightMark[i];
                  
					debugger
                  //第一個觸發的marker mouseover事件,在infoWindow domready事件中即註冊mouse事件
                  nightMark[i].addListener('mouseover', function(){
                  	var k = this;
                  	var num = nightMark.indexOf(this);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventNight" +num+ "'><h8>" + nightList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addNight" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var nmTimeout=new Array(); nmTimeout[" +num+ "]=" + nmTimeout[num] + "var niTimeout=new Array(); niTimeout=[" +num+ "]=" + niTimeout[num];
                      iWindow[num] = new google.maps.InfoWindow({
                          content: content[num],
                          maxWidth: 500 
                       });
                  	
                  	
                  	debugger
                      clearTimeout(nmTimeout[num]);  //要先clearTimeout(避免marker滑出滑入時被setTimeout關閉)
                      debugger
                      if(!isOpen){
                      	iWindow[num].open(map, this);
                      	isOpen = true;
                      }
                      google.maps.event.addListener(iWindow[num], 'domready', function() {
                          document.getElementById("addNight" +num).addEventListener("click", function(){

                              //Ajax處理新增行程
                              var xhr = new XMLHttpRequest();
                              var pos = this.id.charAt(this.id.length-1);
                              xhr.onload = function(){
                                  if( xhr.readyState == 4 ){
                                      if(xhr.status == 200){

                                          var night = JSON.parse(xhr.responseText);
                                          debugger
                                          if(xhr.responseText != "null"){
                                              debugger
                                              if(typeof(tripList[index-1]) == "undefined"){
                                                  tripList[index-1] = new Array();
                                              }
                                              tripList[index-1].push(night);

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/beer.png"></li>');
                                              
                                              console.log("night:"+ night.sponame);
                                              
                                              var sValue = tripList[index-1][tripList[index-1].length-1].tdestart;
                                              if(typeof(sValue) == "undefined"){
                                                    sValue = "";
                                              }
                                            
                                              var fValue = tripList[index-1][tripList[index-1].length-1].tdefinish;
                                              if(typeof(fValue) == "undefined"){
                                                   fValue = "";
                                              }
                                              
                                              $("#tripList li:last").append("<h9>" + night.sponame + "</h9>&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' id='delNight" +pos+ "'><img src='image/delete.png'></a>");
                                              debugger
                                              $("#tripList li:last").append('<div class="form-group row">'
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">起始時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
                                                      + '</div></div>');
                                              $(".time_element").timepicki();
                                              $("#delNight" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                          }

                                      }else{
                                          alert(xhr.status);
                                      }
                                  }
                              }
                              debugger
                              xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
                              xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
                              xhr.send("action=ADD&sponame=" + nightList[pos].sponame + "&tdedate=" + day);
                          });
                          
                          document.getElementById("mouseEventNight" +num).addEventListener("mouseover", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              clearTimeout(niTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(nmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventNight" +num).addEventListener("mouseout", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              niTimeout[pos] = setTimeout(function(){
                              	debugger
                              	iWindow[pos].close();
                              	iWindow[pos] = '';
                              	isOpen = false;
                              	}, 300);
                          });
                      });
                  });
                  
                  nightMark[i].addListener('mouseout', function(){
                      var pos = nightMark.indexOf(this);
                      debugger
                  	nmTimeout[pos] = setTimeout(function(){
                  		iWindow[pos].close();
                  		isOpen = false;
                  		}, 300);
                  });
                  
                  
              }
           },
          error: function(){alert("AJAX發生錯誤")}
      })

  } else{
        for(var i=0; i < nightMarkers.length; i++){
            nightMarkers[i].setMap(null);
        }
  }
}      
</script>

<script>

//顯示飯店標籤設定
var hotelMarkers = new Array();   //此陣列作為移除marker使用
var hotelMark = new Array();
var hotelList;
var hmTimeout = new Array();  //marker的setTimeout
var hiTimeout = new Array();  //infoWindow的setTimeout
var isOpen = false;

function addHotelMarker(){
	  if($("#hotel").prop("checked")){

      $.ajax({
           type: "POST",
           url: "<%= request.getContextPath() %>/frontend/tde/GetClassAjax",
           data: {"spoclass": "飯店", "spocity": city},
           dataType: "json",
           async: true, 
           success: function (data){
              console.log(data);
              hotelList = data;
              debugger
              var position = new Array();
              var iWindow = new Array();
              var content = new Array();
              
              debugger
              for(var i=0; i<hotelList.length; i++){
                  position[i] = { lat: hotelList[i].spolat, lng: hotelList[i].spolong };
                  hotelMark[i] = new google.maps.Marker({
                  	position: position[i],
                      map: map,
                      icon: "image/hotel.png"
                  });
                  debugger
                  hotelMarkers[i] = hotelMark[i];
                  
					debugger
                  //第一個觸發的marker mouseover事件,在infoWindow domready事件中即註冊mouse事件
                  hotelMark[i].addListener('mouseover', function(){
                  	var k = this;
                  	var num = hotelMark.indexOf(this);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventHotel" +num+ "'><h8>" + hotelList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addHotel" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var hmTimeout=new Array(); hmTimeout[" +num+ "]=" + hmTimeout[num] + "var hiTimeout=new Array(); hiTimeout=[" +num+ "]=" + hiTimeout[num];
                      iWindow[num] = new google.maps.InfoWindow({
                          content: content[num],
                          maxWidth: 500 
                       });
                  	
                  	
                  	debugger
                      clearTimeout(hmTimeout[num]);  //要先clearTimeout(避免marker滑出滑入時被setTimeout關閉)
                      debugger
                      if(!isOpen){
                      	iWindow[num].open(map, this);
                      	isOpen = true;
                      }
                      google.maps.event.addListener(iWindow[num], 'domready', function() {
                          document.getElementById("addHotel" +num).addEventListener("click", function(){

                              //Ajax處理新增行程
                              var xhr = new XMLHttpRequest();
                              var pos = this.id.charAt(this.id.length-1);
                              xhr.onload = function(){
                                  if( xhr.readyState == 4 ){
                                      if(xhr.status == 200){

                                          var hotel = JSON.parse(xhr.responseText);
                                          debugger
                                          if(xhr.responseText != "null"){
                                              debugger
                                              if(typeof(tripList[index-1]) == "undefined"){
                                                  tripList[index-1] = new Array();
                                              }
                                              tripList[index-1].push(hotel);

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/hotel.png"></li>');
                                              
                                              console.log("hotel:"+ hotel.sponame);
                                              
                                              var sValue = tripList[index-1][tripList[index-1].length-1].tdestart;
                                              if(typeof(sValue) == "undefined"){
                                                    sValue = "";
                                              }
                                            
                                              var fValue = tripList[index-1][tripList[index-1].length-1].tdefinish;
                                              if(typeof(fValue) == "undefined"){
                                                   fValue = "";
                                              }
                                              
                                              $("#tripList li:last").append("<h9>" + hotel.sponame + "</h9>&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' id='delHotel" +pos+ "'><img src='image/delete.png'></a>");
                                              debugger
                                              $("#tripList li:last").append('<div class="form-group row">'
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">起始時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
                                                      + '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
                                                      + '<div class="col-sm-7" style="padding:0px">'
                                                      + "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
                                                      + '</div></div>');
                                              $(".time_element").timepicki();
                                              $("#delHotel" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                          }

                                      }else{
                                          alert(xhr.status);
                                      }
                                  }
                              }
                              debugger
                              xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
                              xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
                              xhr.send("action=ADD&sponame=" + hotelList[pos].sponame + "&tdedate=" + day);
                          });
                          
                          document.getElementById("mouseEventHotel" +num).addEventListener("mouseover", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              clearTimeout(hiTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(hmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventHotel" +num).addEventListener("mouseout", function(){
                              var pos = this.id.charAt(this.id.length-1);
                          	debugger
                              hiTimeout[pos] = setTimeout(function(){
                              	debugger
                              	iWindow[pos].close();
                              	iWindow[pos] = '';
                              	isOpen = false;
                              	}, 300);
                          });
                      });
                  });
                  
                  hotelMark[i].addListener('mouseout', function(){
                      var pos = hotelMark.indexOf(this);
                      debugger
                  	hmTimeout[pos] = setTimeout(function(){
                  		iWindow[pos].close();
                  		isOpen = false;
                  		}, 300);
                  });
                  
                  
              }
           },
          error: function(){alert("AJAX發生錯誤")}
      })

  } else{
        for(var i=0; i < hotelMarkers.length; i++){
            hotelMarkers[i].setMap(null);
        }
  }
}      
</script>


<script>
		//Ajax處理刪除事件(依新增事件結果傳回的行程表取得行程順序)  
		function delSpot(e){
			    
			  	var xhr = new XMLHttpRequest();
					var size = tripList[index-1].length;
					var seq;
					debugger
				for(var i=0; i<size; i++){
					if(tripList[index-1][i].sponame == e.currentTarget.previousSibling.previousSibling.innerText){
						seq = i;
						console.log("seq=" + seq);
					}
				}
					xhr.onload = function(){
						if(xhr.readyState == 4){
							if(xhr.status == 200){
								debugger
								tripList[index-1].splice(seq, 1);
								$("#tripList li:eq(" + seq + ")").remove();
								debugger
								
                                if(tripList[index-1].length > 1){
                                	direction();
                                } else{
                                	drcDisplay.set("directions", null);
                                }
								
								
                                debugger
							} else{
								alert(xhr.status);
							}
						}
					}
					debugger
					xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
					xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
					console.log("day=" + seq);
					xhr.send("action=delete&seq=" + seq + "&tdedate=" + day);
				}
      
      	//作為畫面重載入時載入第一天行程表
           if(tripList.length != 0){
           		getTripList();
           		
           		debugger
                if(tripList[index-1].length > 1){
                	direction();
                }
                debugger
           }
    		  
           function getTripList(){
        	   debugger
        	   
        	   if(typeof(tripList[index-1]) == "undefined"){
       			tripList[index-1] = new Array();
       		   }
        	  
        	   for(var i=0; i<tripList[index-1].length; i++){
    			  console.log("tripList[index-1].length:"+ tripList[index-1].length);
                  switch(tripList[index-1][i].spoclass){
                      case "景點":
                      	  $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/place.png"></li>');
//                       	  $("#spot").prop("checked", true);
                          break;
                      case "美食":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/ice-cream.png"></li>');
//                           $("#food").prop("checked", true);
                          break;
                      case "博物館":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/museum.png"></li>');
//                           $("#museum").prop("checked", true);
                          break;
                      case "夜生活":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/beer.png"></li>');
//                           $("#night").prop("checked", true);
                          break;
                      case "飯店":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img src="image/hotel.png"></li>');
//                           $("#hotel").prop("checked", true);
                          break;
                  }
                  console.log("tripList[index-1][i].tdestart:"+ tripList[index-1][i].tdestart);
                  console.log("tripList[index-1][i].tdefinish:"+ tripList[index-1][i].tdefinish);
					debugger
                  $("#tripList li:last").append(tripList[index-1][i].sponame + "&nbsp;&nbsp;&nbsp;<a href='javascript:void(0)' class='seq'><img src='image/delete.png'></a>");
                  
				  var sValue = tripList[index-1][i].tdestart;
				  if(typeof(sValue) == "undefined"){
					  sValue = "";
				  }
				  
				  var fValue = tripList[index-1][i].tdefinish;
				  if(typeof(fValue) == "undefined"){
					  fValue = "";
				  }
				  debugger
				  $("#tripList li:last").append('<div class="form-group row">'
					+ '<label class="col-sm-5 col-form-label" style="padding-left:0px">起始時間</label>'
					+ '<div class="col-sm-7" style="padding:0px">'
					+ "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
					+ '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
					+ '<div class="col-sm-7" style="padding:0px">'
					+ "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
					+ '</div></div>');
				  debugger
		   	 		$(".time_element").timepicki();
				  debugger
              }
//         	   if($("#spot").prop("checked") == true){
//         		   addSpotMarker();
//         	   }
//         	   if($("#food").prop("checked") == true){
//         		   addFoodMarker();
//         	   }
//         	   if($("#museum").prop("checked") == true){
//         		   addMuseumMarker();
//         	   }
//         	   if($("#night").prop("checked") == true){
//         		   addNightMarker();
//         	   }
//         	   if($("#hotel").prop("checked") == true){
//         		   addHotelMarker();
//         	   }
        	   makeSeq();
           }
    		  
    	   function makeSeq(){
    			$(".seq").on("click",function(e){
        			var xhr = new XMLHttpRequest();
        			var obj = $(".seq");
        			var size = $(".seq").length;
        			var seq;
  				for(var i=0; i<size; i++){
  					if(obj[i] == e.currentTarget){
  						seq = i;
  						console.log("seq=" + seq);
  					}
  				}
        			xhr.onload = function(){
        				if(xhr.readyState == 4){
        					if(xhr.status == 200){
        						debugger
        						if(typeof(tripList[index-1]) != "undefined"){
                        			debugger
                        			tripList[index-1].splice(seq, 1);
                        		}
        						$("#tripList li:eq(" + seq + ")").remove();
        					} else{
        						alert(xhr.status);
        					}
        				}
        			}
        			xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
        			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
        			xhr.send("action=delete&seq=" + seq + "&tdedate=" + day);
        		});
    	   }
    	   

      google.maps.event.addDomListener(window, 'load', initMap);
    </script>
    
    
<!-- 儲存行程ajax -->
    <script>
    
 		$('#save').on('click',function(){
 			var xhr = new XMLHttpRequest();
 			xhr.onload = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						var abc = xhr.responseText;
						console.log("-----"abc);
						debugger
						alert("儲存成功!");
					} else{
						alert(xhr.status);
					}
				}
			}
			xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true);
			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
			xhr.send("action=save");
 		})   
    
 	</script>
    
    
    
    
	
	<!-- 時間css&javascript -->
	<script src="timepicki/js/timepicki.js"></script>
	<script>
 	 	$(this).load(function(){
   	 		$(".time_element").timepicki({min_hour_value: 4});
 	 	});
	</script>
	<script>
		$.datetimepicker.setLocale('zh'); // kr ko ja en
		$(function(){
			 $('#tribegdate').datetimepicker({
			  format:'Y-m-d',
			  onShow:function(){
			   this.setOptions({
				   minDate: '-1970-01-01'			    
			   })
			  },
			  timepicker:false
			 });
			 
			 
			 
// 			 $('#tripList').on('click', '.startTime', function(){
// 				 console.log($(this))
// 				 console.log(555)
// 				  $('.startTime').timepicki();
// 		    	  var len = ($(".startTime").length-1);
// 		          var minHourStr = $(".startTime:eq(" + len +")").val().substring(0,2);//09:36 PM
// 		          var minHour = parseInt(minHourStr);
// 		          console.log($('.startTime'))
// 		          console.log($(".finishTime"))
// 		          console.log('======'+minHour)
// 		          debugger
// 		          $(".finishTime").timepicki({min_hour_value: minHour});
// 		    	  	debugger
// 			 })
		});
	</script>
	<script>
		$("#dayUl").on("click", ".add", function(){
			var newDay = $("#cloneDay").clone();
			newDay.attr("style", "display:''");
			newDay.find("a").text("D" + $(".day").length);
			debugger
			$(".add").before(newDay);
			$(".day").off().on("click", makeTdeVO);
		});
	</script>
	<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
</body>

</html>