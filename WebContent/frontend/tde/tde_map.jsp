<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spo.model.*"%>
<%@ page import="com.spo.controller.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/bootstrap/css/bootstrap.min.css">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="<%= request.getContextPath() %>/bootstrap/popper.min.js"></script>
<script src="<%= request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="jquery-timepicker/jquery.timepicker.css">
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
.liImg{
width: 33px;
height: 35px;
}
#collapse{
width: 590px;
height: 550px;
position: absolute;
right: -400px;
z-index: 999;
background-color: white;
display: none;
border: solid 1px grey;
overflow-y: auto;
overflow-x: hidden;
}
#spopic{
width: 150px;
height: 150px;
}

</style>
<!-- this is for autocomplete -->
<link href="js/jquery-ui.css" rel="Stylesheet"></link>

</head>
<body>



<section class="section-property section-t8">
	<jsp:include page="/frontend/tde/spoInfo.jsp"/>
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-6" style="padding-left: 0px; margin:15px">
				

				<form>

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
						<input type="button" class="btn btn-success" data-toggle="modal" data-target="#tripResult" id="tResult" value="查看行程規劃結果" style="position: absolute; right: -40%; top: -50%">
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
				  	<div id="tribegdate" style="border: 0px; width: 150px; height: 20px">${triVO.tribegdate}</div>
				  	<input type="text" class="form-control" name="cityname" value="${city}" style="border: 0px; width: 150px; height: 20px"  id="changeCity">
				  </li>
				  <div id="tripList"></div>
				</ul>
			</div>
		</div>
	</div>
</section>

	<div id="map"></div>

	<!-- 付費的 -->
		    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJDWHf2nJvG1HGWjhDSz95Gv8E0h_ZFp0"></script>
	<!-- 非付費的    -->

<!-- 	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYmC8oUYc9DGAZn8hqZKakFeclhAbTRSI"></script> -->
	
<script>

<% 
//依使用者選擇的城市換算緯經度傳給初始化地圖
String city = (String)session.getAttribute("city");
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
										map.setZoom(14);
										
										//景點種類checkbox清空
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

//使用者更改日期時呼叫此方法,將輸入值傳入whichDate
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
					if(i < 9){
						day = "D" + (i+1);
						index = parseInt(day.substring(1,2));
						console.log("day=" + day);
					} else{
						day = "D" + (i+1);
						index = parseInt(day.substring(1,3));
						console.log("day=" + day);
					}
				}
			}
		}
		
		//日期天數設定(點擊day1 day2時計算天數)
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
		$("#tribegdate").text( y + "-" + m + "-" + d);
		
		var xhr = new XMLHttpRequest();
		xhr.onload = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					debugger
					//欲前往的城市沒有已規劃的內容,顯示空地圖
					if(xhr.responseText == "null"){
						map.panTo({ lat: lat, lng: lng });
						map.setZoom(13);
						debugger
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
						//行程表清空
						$("#tripList li").remove();
						//路線清空
						drcDisplay.set("directions", null);
						//路線marker清空
						for(var i=0; i < newMarker.length; i++){
							  newMarker[i].setMap(null);
				              newMarker[i] = null;
				              debugger
				          }
				    	 newMarker = [];
					
				    //欲前往的城市有已規劃的內容(先清空)
					} else{
						//路線清空
						drcDisplay.set("directions", null);
						debugger
						//行程表清空
						$("#tripList li").remove();
						//路線marker清空
						for(var i=0; i < newMarker.length; i++){
							  newMarker[i].setMap(null);
				              newMarker[i] = null;
				              debugger
				          }
				    	newMarker = [];
						getTripList();
						if(tripList[index-1].length > 1){
                        	direction();
                        }
						//景點種類checkbox清空
						$("#spot").prop("checked", false);
						$("#food").prop("checked", false);
						$("#museum").prop("checked", false);
						$("#night").prop("checked", false);
						$("#hotel").prop("checked", false);
						//取得該天第一個點的城市並設定給城市的input text及city變數,並呼叫每個種類ajax使checkbox跳轉到只屬於城市
						//取得前先移除marker
						for(var i=0; i < spotMarkers.length; i++){
			                  spotMarkers[i].setMap(null);
			              }
						for(var i=0; i < foodMarkers.length; i++){
			                  foodMarkers[i].setMap(null);
			              }
						for(var i=0; i < museumMarkers.length; i++){
			                  museumMarkers[i].setMap(null);
			              }
						for(var i=0; i < nightMarkers.length; i++){
			                  nightMarkers[i].setMap(null);
			              }
						for(var i=0; i < hotelMarkers.length; i++){
			                  hotelMarkers[i].setMap(null);
			              }
						
						if(tripList[index-1].length != 0){
							$('#changeCity').val(tripList[index-1][0].spocity);
							city = tripList[index-1][0].spocity;
							
							//呼叫ajax算出城市緯經度
							$.ajax({
								 type: "POST",
								 url: "<%= request.getContextPath() %>/frontend/tde/ChangeCityAjax",
								 data: {"action": "getLatLong", "city": city},
								 async: true,
								 success: function (data){
									console.log("data:" + data);
									var latlng = data.split("/");
					        		lat = parseFloat(latlng[0]);
					        		lng = parseFloat(latlng[1])
					        		debugger
					        		//若當天只有一個景點須靠自己跳轉地圖(無法透過direction)
					        		if(tripList[index-1].length == 1){
					        			map.panTo({ lat: lat, lng: lng });
										map.setZoom(14);
					        		}
							     },
					            error: function(){alert("AJAX發生錯誤")}
					        })
							
							addSpotMarker();
							addFoodMarker();
							addMuseumMarker();
							addNightMarker();
							addHotelMarker();
							debugger
						}
					}
				}else{
					alert(xhr.status);
				}
			} 
		}
		
		var tdestart = $(".startTime").serialize();  //"tdestart=09%3A00&tdestart=09%3A30&tdestart=10%3A00"
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
	//從session中拿出行程集合轉javascript物件
	<% Map<String,List<SpoVO>> dayTripList = (Map<String,List<SpoVO>>)session.getAttribute("dayTripList");
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
          zoom: 14,
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
    		
    		//繪製路線前先刪除全部舊marker(避免疊加層)
    		for(var i=0; i < newMarker.length; i++){
				  newMarker[i].setMap(null);
	              newMarker[i] = null;
	              debugger
	          }
	    	newMarker = [];
	    	
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
    	                zIndex: 999,
//     	                label: { text: (i+1) + '', color: "#fff" }
    	                icon: "image/" + (i+1) + ".png"
    	                });
    	                debugger
    	            }
    	            
    	        } else {
    	            console.log(status);
    	        }
    	    });
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
                    var siWindow = new Array();
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
                        	
                        	//設定滑入的z-index為最上層
                        	this.setZIndex(999);
                        	
                        	if(siWindow[num])
                          		siWindow[num].close();
                        	
                        	debugger
                            //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                            content[num] = "<div id='mouseEventSpot" +num+ "'><h8>" + spoList[num].sponame +
                             "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addSpot" +num+ "'><img src='image/add.png'></a></div>" + 
                             "<script>var smTimeout=new Array(); smTimeout[" +num+ "]=" + smTimeout[num] + "var siTimeout=new Array(); siTimeout=[" +num+ "]=" + siTimeout[num] + "&lt;/script&gt;";
                            siWindow[num] = new google.maps.InfoWindow({
                                content: content[num],
                                maxWidth: 500 
                             });
                        	
                        	
                        	debugger
                            clearTimeout(smTimeout[num]);  //要先clearTimeout(避免marker滑出滑入時被setTimeout關閉)
                            debugger
                            if(!isOpen){
                            	siWindow[num].open(map, this);
                            	isOpen = true;
                            }
                            google.maps.event.addListener(siWindow[num], 'domready', function() {
                                document.getElementById("addSpot" +num).addEventListener("click", function(){

                                    //Ajax處理新增行程
                                    var xhr = new XMLHttpRequest();
                                    var pos;
                                	if(this.id.length < 9){
                                		pos = this.id.charAt(this.id.length-1);
                                	} else if(this.id.length == 9){
                                		pos = this.id.substring(7, 9);
                                	} else{
                                		pos = this.id.substring(7, 10);
                                	}
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

                                                    $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/place.png">&nbsp;</li>');
                                                    
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
                                                            + "<input id='timepicker' class='form-control startTime time_element' type='text' name='tdestart' style='width:114px; font-size:10px' value='" + sValue + "'></div>"
                                                            + '<label class="col-sm-5 col-form-label" style="padding-left:0px">終止時間</label>'
                                                            + '<div class="col-sm-7" style="padding:0px">'
                                                            + "<input id='timepicker' class='form-control finishTime time_element' type='text' name='tdefinish' style='width:114px; font-size:10px' value='" + fValue + "'></div>"
                                                            + '</div></div>');
                                                    //自動scroll到最下方
                                                    var $div = $('#tripList');
                                                    $div.scrollTop($div[0].scrollHeight);
                                                    $("#delSpot" +pos).on("click", delSpot);
                                                    
                                                    debugger
                                                    if(tripList[index-1].length > 1){
                                                    	direction();
                                                    }
                                                    debugger
                                                  
                                                  //每次觸發先判斷前方是否有finishTime

                                            	 	var n = $('.startTime').length-1;
                                            	 	debugger
                                            	 	var min = $('.finishTime:eq(' + (n-1) +')').val();
                                            	 	if($('.finishTime:eq(' + (n-1) +')').val() != ""){
					                                	$('.startTime').timepicker({
														    'minTime': min,
														    'timeFormat': 'H:i'
														});
					                                	$('.finishTime').timepicker({
														    'minTime': min,
														    'timeFormat': 'H:i'
														});
					                                	debugger
                                					} else{
                                						$('.time_element').timepicker({'timeFormat': 'H:i'});
                                						debugger
                                					}
                                            	 	
                                              	  $('.startTime').on('change',function(e){
                                            	 		var startTimeArr = new Array();
                                            	 		for(var i=0; i<$('.startTime').length; i++){
                                            	 			startTimeArr[i] = $('.startTime')[i];
                                            	 		}
                                            	 		debugger
                                            	 		//找出是第幾個startTime
                                            	 		var n = startTimeArr.indexOf(e.target);
                                            	 		debugger
                                            	 		//先移除對應的finishTime
                                            	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
                                            	 		var min = $('.startTime:eq(' + n +')').val();
                                            	 		debugger
                                            	 		//設定對應的finishTime限制
                                            	 		$('.finishTime:eq(' + n +')').timepicker({
                                            	 	    	'minTime': min,
                                            	 	    	'timeFormat': 'H:i'
                                            	 		});
                                            	 		//再移除下面全部的startTime及finishTime,並設定限制
                                            	 		for(var i=$('.startTime').length-1; i>n; i--){
                                            	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                            	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                            	 			$('.startTime:eq(' + i +')').timepicker({
                                            		 	    	'minTime': min,
                                            		 	    	'timeFormat': 'H:i'
                                            		 		});
                                            	 			$('.finishTime:eq(' + i +')').timepicker({
                                            		 	    	'minTime': min,
                                            		 	    	'timeFormat': 'H:i'
                                            		 		});
                                            	 		}
                                            	   });
                                             	 	
                                             	 	$('.finishTime').on('change',function(e){
                                            	 		var finishTimeArr = new Array();
                                            	 		for(var i=0; i<$('.finishTime').length; i++){
                                            	 			finishTimeArr[i] = $('.finishTime')[i];
                                            	 		}
                                            	 		debugger
                                            	 		//找出是第幾個finishTime
                                            	 		var n = finishTimeArr.indexOf(e.target);
                                            	 		debugger
                                            	 		//先移除下一個startTime
                                            	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
                                            	 		var min = $('.finishTime:eq(' + n +')').val();
                                            	 		debugger
                                            	 		//設定下一個startTime限制
                                            	 		$('.startTime:eq(' + (n+1) +')').timepicker({
                                            	 	    	'minTime': min,
                                            	 	    	'timeFormat': 'H:i'
                                            	 		});
                                            	 		//再移除下面全部的startTime及finishTime,並設定限制
                                            	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
                                            	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                            	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                            	 			$('.startTime:eq(' + i +')').timepicker({
                                            		 	    	'minTime': min,
                                            		 	    	'timeFormat': 'H:i'
                                            		 		});
                                            	 			$('.finishTime:eq(' + i +')').timepicker({
                                            		 	    	'minTime': min,
                                            		 	    	'timeFormat': 'H:i'
                                            		 		});
                                            	 		}
                                            	   });
                                             	 	
                                             	 	//避免事件蔓延
                                             	 	$('.startTime').on('click',function(e){
                                             	 		e.stopPropagation();
                                             	 	});
                                             	 	$('.finishTime').on('click',function(e){
                                             	 		e.stopPropagation();
                                             	 	});
                                                    
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
                                	var pos;
                                	if(this.id.length < 16){
                                		pos = this.id.charAt(this.id.length-1);
                                	} else if(this.id.length == 16){
                                		pos = this.id.substring(14, 16);
                                	} else{
                                		pos = this.id.substring(14, 17);
                                	}
                                	debugger
                                    clearTimeout(siTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                                    clearTimeout(smTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                                });

                                document.getElementById("mouseEventSpot" +num).addEventListener("mouseout", function(){
                                	var pos;
                                	if(this.id.length < 16){
                                		pos = this.id.charAt(this.id.length-1);
                                	} else if(this.id.length == 16){
                                		pos = this.id.substring(14, 16);
                                	} else{
                                		pos = this.id.substring(14, 17);
                                	}
                                    debugger
                                    if(typeof(siWindow[pos]) != "undefined"){
                                    siTimeout[pos] = setTimeout(function(){
                                    	debugger
                                    	siWindow[pos].close();
                                    	isOpen = false;
                                    	}, 300);
                                    }
                                });
                                	
                            });
                        });
                        
                        marker[i].addListener('mouseout', function(){
                            var pos = marker.indexOf(this);
                            
                          //恢復marker的z-index
                        	this.setZIndex(1);
                          
                            debugger
                        	smTimeout[pos] = setTimeout(function(){
                        		siWindow[pos].close();
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
                  	
                  //設定滑入的z-index為最上層
                	this.setZIndex(999);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventFood" +num+ "'><h8>" + foodList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addFood" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var fmTimeout=new Array(); fmTimeout[" +num+ "]=" + fmTimeout[num] + "var fiTimeout=new Array(); fiTimeout=[" +num+ "]=" + fiTimeout[num] + "&lt;/script&gt;";
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
                              var pos;
                          	  if(this.id.length < 9){
                          		pos = this.id.charAt(this.id.length-1);
                          	  } else if(this.id.length == 9){
                          		pos = this.id.substring(7, 9);
                          	  } else{
                          		pos = this.id.substring(7, 10);
                          	  }
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

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/ice-cream.png">&nbsp;</li>');
                                              
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
                                              //自動scroll到最下方
                                              var $div = $('#tripList');
                                              $div.scrollTop($div[0].scrollHeight);
                                              $("#delFood" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                              
                                              //每次觸發先判斷前方是否有finishTime

                                      	 	var n = $('.startTime').length-1;
                                      	 	debugger
                                      	 	var min = $('.finishTime:eq(' + (n-1) +')').val();
                                      	 	if($('.finishTime:eq(' + (n-1) +')').val() != ""){
				                                	$('.startTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	$('.finishTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	debugger
                          					} else{
                          						$('.time_element').timepicker({'timeFormat': 'H:i'});
                          						debugger
                          					}
                                      	 	
                                        	  $('.startTime').on('change',function(e){
                                      	 		var startTimeArr = new Array();
                                      	 		for(var i=0; i<$('.startTime').length; i++){
                                      	 			startTimeArr[i] = $('.startTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個startTime
                                      	 		var n = startTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除對應的finishTime
                                      	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
                                      	 		var min = $('.startTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定對應的finishTime限制
                                      	 		$('.finishTime:eq(' + n +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.startTime').length-1; i>n; i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       	 	$('.finishTime').on('change',function(e){
                                      	 		var finishTimeArr = new Array();
                                      	 		for(var i=0; i<$('.finishTime').length; i++){
                                      	 			finishTimeArr[i] = $('.finishTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個finishTime
                                      	 		var n = finishTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除下一個startTime
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
                                      	 		var min = $('.finishTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定下一個startTime限制
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       		//避免事件蔓延
                                     	 	$('.startTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                     	 	$('.finishTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                       	 	
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
                        	  var pos;
                          	if(this.id.length < 16){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 16){
                          		pos = this.id.substring(14, 16);
                          	} else{
                          		pos = this.id.substring(14, 17);
                          	}
                              clearTimeout(fiTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(fmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventFood" +num).addEventListener("mouseout", function(){
                        	  var pos;
                          	if(this.id.length < 16){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 16){
                          		pos = this.id.substring(14, 16);
                          	} else{
                          		pos = this.id.substring(14, 17);
                          	}
                              fiTimeout[pos] = setTimeout(function(){
                              	debugger
                              if(typeof(iWindow[pos]) != "undefined"){
                              		iWindow[pos].close();
                              }
                              	isOpen = false;
                              }, 300);
                          });
                      });
                  });
                  
                  foodMark[i].addListener('mouseout', function(){
                      var pos = foodMark.indexOf(this);
                      
                    //恢復marker的z-index
                    	this.setZIndex(1);
                      
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
                  	
                  //設定滑入的z-index為最上層
                	this.setZIndex(999);                  	
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventMuseum" +num+ "'><h8>" + museumList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addMuseum" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var mmTimeout=new Array(); mmTimeout[" +num+ "]=" + mmTimeout[num] + "var miTimeout=new Array(); miTimeout=[" +num+ "]=" + miTimeout[num] + "&lt;/script&gt;";
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
                              var pos;
                          	  if(this.id.length < 11){
                          		pos = this.id.charAt(this.id.length-1);
                          	  } else if(this.id.length == 11){
                          		pos = this.id.substring(9, 11);
                          	  } else{
                          		pos = this.id.substring(9, 12);
                          	  }
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

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/museum.png">&nbsp;</li>');
                                              
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
                                              //自動scroll到最下方
                                              var $div = $('#tripList');
                                              $div.scrollTop($div[0].scrollHeight);
                                              $("#delMuseum" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                              
                                              //每次觸發先判斷前方是否有finishTime

                                      	 	var n = $('.startTime').length-1;
                                      	 	debugger
                                      	 	var min = $('.finishTime:eq(' + (n-1) +')').val();
                                      	 	if($('.finishTime:eq(' + (n-1) +')').val() != ""){
				                                	$('.startTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	$('.finishTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	debugger
                          					} else{
                          						$('.time_element').timepicker({'timeFormat': 'H:i'});
                          						debugger
                          					}
                                      	 	
                                        	  $('.startTime').on('change',function(e){
                                      	 		var startTimeArr = new Array();
                                      	 		for(var i=0; i<$('.startTime').length; i++){
                                      	 			startTimeArr[i] = $('.startTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個startTime
                                      	 		var n = startTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除對應的finishTime
                                      	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
                                      	 		var min = $('.startTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定對應的finishTime限制
                                      	 		$('.finishTime:eq(' + n +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.startTime').length-1; i>n; i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       	 	$('.finishTime').on('change',function(e){
                                      	 		var finishTimeArr = new Array();
                                      	 		for(var i=0; i<$('.finishTime').length; i++){
                                      	 			finishTimeArr[i] = $('.finishTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個finishTime
                                      	 		var n = finishTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除下一個startTime
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
                                      	 		var min = $('.finishTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定下一個startTime限制
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       		//避免事件蔓延
                                     	 	$('.startTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                     	 	$('.finishTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                       	 	
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
                        	  var pos;
                          	if(this.id.length < 18){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 18){
                          		pos = this.id.substring(16, 18);
                          	} else{
                          		pos = this.id.substring(16, 19);
                          	}
                          	debugger
                              clearTimeout(miTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(mmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventMuseum" +num).addEventListener("mouseout", function(){
                        	  var pos;
                          	if(this.id.length < 18){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 18){
                          		pos = this.id.substring(16, 18);
                          	} else{
                          		pos = this.id.substring(16, 19);
                          	}
                          	debugger
                              miTimeout[pos] = setTimeout(function(){
                              	debugger
                              if(typeof(iWindow[pos]) != "undefined"){
                              		iWindow[pos].close();
                              }
                              	isOpen = false;
                              	}, 300);
                          });
                      });
                  });
                  
                  museumMark[i].addListener('mouseout', function(){
                      var pos = museumMark.indexOf(this);
                      
                    //恢復marker的z-index
                    	this.setZIndex(1);
                      
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
                  	
                  //設定滑入的z-index為最上層
                	this.setZIndex(999);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventNight" +num+ "'><h8>" + nightList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addNight" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var nmTimeout=new Array(); nmTimeout[" +num+ "]=" + nmTimeout[num] + "var niTimeout=new Array(); niTimeout=[" +num+ "]=" + niTimeout[num] + "&lt;/script&gt;";
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
                              var pos;
                          	  if(this.id.length < 10){
                          		pos = this.id.charAt(this.id.length-1);
                          	  } else if(this.id.length == 10){
                          		pos = this.id.substring(8, 10);
                          	  } else{
                          		pos = this.id.substring(8, 11);
                          	  }
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

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/beer.png">&nbsp;</li>');
                                              
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
                                              //自動scroll到最下方
                                              var $div = $('#tripList');
                                              $div.scrollTop($div[0].scrollHeight);
                                              $("#delNight" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                              
                                              //每次觸發先判斷前方是否有finishTime

                                      	 	var n = $('.startTime').length-1;
                                      	 	debugger
                                      	 	var min = $('.finishTime:eq(' + (n-1) +')').val();
                                      	 	if($('.finishTime:eq(' + (n-1) +')').val() != ""){
				                                	$('.startTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	$('.finishTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	debugger
                          					} else{
                          						$('.time_element').timepicker({'timeFormat': 'H:i'});
                          						debugger
                          					}
                                      	 	
                                        	  $('.startTime').on('change',function(e){
                                      	 		var startTimeArr = new Array();
                                      	 		for(var i=0; i<$('.startTime').length; i++){
                                      	 			startTimeArr[i] = $('.startTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個startTime
                                      	 		var n = startTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除對應的finishTime
                                      	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
                                      	 		var min = $('.startTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定對應的finishTime限制
                                      	 		$('.finishTime:eq(' + n +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.startTime').length-1; i>n; i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       	 	$('.finishTime').on('change',function(e){
                                      	 		var finishTimeArr = new Array();
                                      	 		for(var i=0; i<$('.finishTime').length; i++){
                                      	 			finishTimeArr[i] = $('.finishTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個finishTime
                                      	 		var n = finishTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除下一個startTime
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
                                      	 		var min = $('.finishTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定下一個startTime限制
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       		//避免事件蔓延
                                     	 	$('.startTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                     	 	$('.finishTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                       	 	
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
                        	  var pos;
                          	if(this.id.length < 17){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 17){
                          		pos = this.id.substring(15, 17);
                          	} else{
                          		pos = this.id.substring(15, 18);
                          	}
                          	debugger
                              clearTimeout(niTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(nmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventNight" +num).addEventListener("mouseout", function(){
                        	  var pos;
                          	if(this.id.length < 17){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 17){
                          		pos = this.id.substring(15, 17);
                          	} else{
                          		pos = this.id.substring(15, 18);
                          	}
                          	debugger
                              niTimeout[pos] = setTimeout(function(){
                              	debugger
                              if(typeof(iWindow[pos]) != "undefined"){
                              	iWindow[pos].close();
                              }
                              	isOpen = false;
                              	}, 300);
                          });
                      });
                  });
                  
                  nightMark[i].addListener('mouseout', function(){
                      var pos = nightMark.indexOf(this);
                      
                    //恢復marker的z-index
                  	this.setZIndex(1);
                      
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
                  	
                  //設定滑入的z-index為最上層
                	this.setZIndex(999);
                  	
                  	if(iWindow[num])
                  		iWindow[num].close();
                  	debugger
                      //建立info window物件,在content中傳入closeTimeout變數作為下一層infowindow clearTimeout使用
                      content[num] = "<div id='mouseEventHotel" +num+ "'><h8>" + hotelList[num].sponame +
                       "&nbsp;&nbsp;&nbsp;</h8><a href='javascript:void(0)' id='addHotel" +num+ "'><img src='image/add.png'></a></div>" + 
                       "<script>var hmTimeout=new Array(); hmTimeout[" +num+ "]=" + hmTimeout[num] + "var hiTimeout=new Array(); hiTimeout=[" +num+ "]=" + hiTimeout[num] + "&lt;/script&gt;";
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
                              var pos;
                          	  if(this.id.length < 10){
                          		pos = this.id.charAt(this.id.length-1);
                          	  } else if(this.id.length == 10){
                          		pos = this.id.substring(8, 10);
                          	  } else{
                          		pos = this.id.substring(8, 11);
                          	  }
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

                                              $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/hotel.png">&nbsp;</li>');
                                              
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
                                              //自動scroll到最下方
                                              var $div = $('#tripList');
                                              $div.scrollTop($div[0].scrollHeight);
                                              $("#delHotel" +pos).on("click", delSpot);
                                              
                                              debugger
                                              if(tripList[index-1].length > 1){
                                              	direction();
                                              }
                                              debugger
                                              
                                              //每次觸發先判斷前方是否有finishTime

                                      	 	var n = $('.startTime').length-1;
                                      	 	debugger
                                      	 	var min = $('.finishTime:eq(' + (n-1) +')').val();
                                      	 	if($('.finishTime:eq(' + (n-1) +')').val() != ""){
				                                	$('.startTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	$('.finishTime').timepicker({
													    'minTime': min,
													    'timeFormat': 'H:i'
													});
				                                	debugger
                          					} else{
                          						$('.time_element').timepicker({'timeFormat': 'H:i'});
                          						debugger
                          					}
                                      	 	
                                        	  $('.startTime').on('change',function(e){
                                      	 		var startTimeArr = new Array();
                                      	 		for(var i=0; i<$('.startTime').length; i++){
                                      	 			startTimeArr[i] = $('.startTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個startTime
                                      	 		var n = startTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除對應的finishTime
                                      	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
                                      	 		var min = $('.startTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定對應的finishTime限制
                                      	 		$('.finishTime:eq(' + n +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.startTime').length-1; i>n; i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       	 	$('.finishTime').on('change',function(e){
                                      	 		var finishTimeArr = new Array();
                                      	 		for(var i=0; i<$('.finishTime').length; i++){
                                      	 			finishTimeArr[i] = $('.finishTime')[i];
                                      	 		}
                                      	 		debugger
                                      	 		//找出是第幾個finishTime
                                      	 		var n = finishTimeArr.indexOf(e.target);
                                      	 		debugger
                                      	 		//先移除下一個startTime
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
                                      	 		var min = $('.finishTime:eq(' + n +')').val();
                                      	 		debugger
                                      	 		//設定下一個startTime限制
                                      	 		$('.startTime:eq(' + (n+1) +')').timepicker({
                                      	 	    	'minTime': min,
                                      	 	    	'timeFormat': 'H:i'
                                      	 		});
                                      	 		//再移除下面全部的startTime及finishTime,並設定限制
                                      	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
                                      	 			$('.startTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.finishTime:eq(' + i +')').timepicker('remove');
                                      	 			$('.startTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 			$('.finishTime:eq(' + i +')').timepicker({
                                      		 	    	'minTime': min,
                                      		 	    	'timeFormat': 'H:i'
                                      		 		});
                                      	 		}
                                      	   });
                                       	 	
                                       		//避免事件蔓延
                                     	 	$('.startTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                     	 	$('.finishTime').on('click',function(e){
                                     	 		e.stopPropagation();
                                     	 	});
                                       	 	
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
                        	  var pos;
                          	if(this.id.length < 17){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 17){
                          		pos = this.id.substring(15, 17);
                          	} else{
                          		pos = this.id.substring(15, 18);
                          	}
                          	debugger
                              clearTimeout(hiTimeout[pos]); //要先clearTimeout(避免infoWindow滑出滑入時被setTimeout關閉)
                              clearTimeout(hmTimeout[pos]); //清除marker的關閉infoWindow setTimeout
                          });

                          document.getElementById("mouseEventHotel" +num).addEventListener("mouseout", function(){
                        	  var pos;
                          	if(this.id.length < 17){
                          		pos = this.id.charAt(this.id.length-1);
                          	} else if(this.id.length == 17){
                          		pos = this.id.substring(15, 17);
                          	} else{
                          		pos = this.id.substring(15, 18);
                          	}
                          	debugger
                              hiTimeout[pos] = setTimeout(function(){
                              	debugger
                              if(typeof(iWindow[pos]) != "undefined"){
                              	iWindow[pos].close();
                              }
                              	isOpen = false;
                              	}, 300);
                          });
                      });
                  });
                  
                  hotelMark[i].addListener('mouseout', function(){
                      var pos = hotelMark.indexOf(this);
                      
                    //恢復marker的z-index
                  	this.setZIndex(1);
                      
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
				
				//避免事件蔓延
				e.stopPropagation();
			    
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
								
								
								//每次觸發先判斷前方是否有finishTime

                        	 	var min = $('.finishTime:eq(' + (seq-1) +')').val();
                        	 	if($('.finishTime:eq(' + (seq-1) +')').val() != ""){
                                	
                        	 		$('.startTime:eq(' + seq +')').timepicker('remove');
                        	 		$('.finishTime:eq(' + seq +')').timepicker('remove');
                        	 		
                        	 		$('.startTime:eq(' + seq +')').timepicker({
									    'minTime': min,
									    'timeFormat': 'H:i'
									});
                                	$('.finishTime:eq(' + seq +')').timepicker({
									    'minTime': min,
									    'timeFormat': 'H:i'
									});
                                	debugger
            					}
								
								
								
                                if(tripList[index-1].length > 1){
                                	direction();
                                } else{
                                	drcDisplay.set("directions", null);
        							for(var i=0; i < newMarker.length; i++){
      								  newMarker[i].setMap(null);
      					              newMarker[i] = null;
      					              debugger
      					          }
      					    		 newMarker = [];
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
                      	  $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/place.png">&nbsp;</li>');
                          break;
                      case "美食":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/ice-cream.png">&nbsp;</li>');
                          break;
                      case "博物館":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/museum.png">&nbsp;</li>');
                          break;
                      case "夜生活":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/beer.png">&nbsp;</li>');
                          break;
                      case "飯店":
                          $("#tripList").append('<li class="list-group-item list-group-item-action"><img class="liImg" src="image/hotel.png">&nbsp;</li>');
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
				  
				//每次觸發先判斷前方是否有finishTime

          	 	var n = $('.startTime').length-1;
          	 	debugger
          	 	var min = $('.finishTime:eq(' + (n-1) +')').val();
          	 	if($('.finishTime:eq(' + (n-1) +')').val() != ""){
                  	$('.startTime').timepicker({
						    'minTime': min,
						    'timeFormat': 'H:i'
						});
                  	$('.finishTime').timepicker({
						    'minTime': min,
						    'timeFormat': 'H:i'
						});
                  	debugger
					} else{
						$('.time_element').timepicker({'timeFormat': 'H:i'});
						debugger
					}
				  
				//時間限制處理
              	  $('.startTime').on('change',function(e){
            	 		var startTimeArr = new Array();
            	 		for(var i=0; i<$('.startTime').length; i++){
            	 			startTimeArr[i] = $('.startTime')[i];
            	 		}
            	 		debugger
            	 		//找出是第幾個startTime
            	 		var n = startTimeArr.indexOf(e.target);
            	 		debugger
            	 		//先移除對應的finishTime
            	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
            	 		var min = $('.startTime:eq(' + n +')').val();
            	 		debugger
            	 		//設定對應的finishTime限制
            	 		$('.finishTime:eq(' + n +')').timepicker({
            	 	    	'minTime': min,
            	 	    	'timeFormat': 'H:i'
            	 		});
            	 		//再移除下面全部的startTime及finishTime,並設定限制
            	 		for(var i=$('.startTime').length-1; i>n; i--){
            	 			$('.startTime:eq(' + i +')').timepicker('remove');
            	 			$('.finishTime:eq(' + i +')').timepicker('remove');
            	 			$('.startTime:eq(' + i +')').timepicker({
            		 	    	'minTime': min,
            		 	    	'timeFormat': 'H:i'
            		 		});
            	 			$('.finishTime:eq(' + i +')').timepicker({
            		 	    	'minTime': min,
            		 	    	'timeFormat': 'H:i'
            		 		});
            	 		}
            	   });
             	 	
             	 	$('.finishTime').on('change load',function(e){
            	 		var finishTimeArr = new Array();
            	 		for(var i=0; i<$('.finishTime').length; i++){
            	 			finishTimeArr[i] = $('.finishTime')[i];
            	 		}
            	 		debugger
            	 		//找出是第幾個finishTime
            	 		var n = finishTimeArr.indexOf(e.target);
            	 		debugger
            	 		//先移除下一個startTime
            	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
            	 		var min = $('.finishTime:eq(' + n +')').val();
            	 		debugger
            	 		//設定下一個startTime限制
            	 		$('.startTime:eq(' + (n+1) +')').timepicker({
            	 	    	'minTime': min,
            	 	    	'timeFormat': 'H:i'
            	 		});
            	 		//再移除下面全部的startTime及finishTime,並設定限制
            	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
            	 			$('.startTime:eq(' + i +')').timepicker('remove');
            	 			$('.finishTime:eq(' + i +')').timepicker('remove');
            	 			$('.startTime:eq(' + i +')').timepicker({
            		 	    	'minTime': min,
            		 	    	'timeFormat': 'H:i'
            		 		});
            	 			$('.finishTime:eq(' + i +')').timepicker({
            		 	    	'minTime': min,
            		 	    	'timeFormat': 'H:i'
            		 		});
            	 		}
            	   });
             	 	
             	 	
             	 	//避免事件蔓延
             	 	$('.startTime').on('click',function(e){
             	 		e.stopPropagation();
             	 	});
             	 	$('.finishTime').on('click',function(e){
             	 		e.stopPropagation();
             	 	});
				  
				  
              }
        	   makeSeq();
           }
    		  
    	   function makeSeq(){
    			$(".seq").on("click",function(e){
        			
    				//避免事件蔓延
    				e.stopPropagation();
    				
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
                        			tripList[index-1].splice(seq, 1);  //從陣列中移除
                        		}
        						$("#tripList li:eq(" + seq + ")").remove();  //從行程表中移除
        						
        						
        						//每次觸發先判斷前方是否有finishTime

                        	 	var min = $('.finishTime:eq(' + (seq-1) +')').val();
                        	 	if($('.finishTime:eq(' + (seq-1) +')').val() != ""){
                                	
                        	 		$('.startTime:eq(' + seq +')').timepicker('remove');
                        	 		$('.finishTime:eq(' + seq +')').timepicker('remove');
                        	 		
                        	 		$('.startTime:eq(' + seq +')').timepicker({
									    'minTime': min,
									    'timeFormat': 'H:i'
									});
                                	$('.finishTime:eq(' + seq +')').timepicker({
									    'minTime': min,
									    'timeFormat': 'H:i'
									});
                                	debugger
            					}
        						
        						
        						
        						//當天行程大於1才繪製路線
        						if(tripList[index-1].length > 1){
                                	direction();
                                }else {
        							drcDisplay.set("directions", null);
        							for(var i=0; i < newMarker.length; i++){
        								  newMarker[i].setMap(null);
        					              newMarker[i] = null;
        					              debugger
        					          }
        					    	 newMarker = [];
                                }
        						
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
    
//  		$('#save').on('click',function(){
//  			var xhr = new XMLHttpRequest();
//  			xhr.onload = function(){
// 				if(xhr.readyState == 4){
// 					if(xhr.status == 200){
// 						var abc = xhr.responseText;
// 						console.log("-----"abc);
// 						debugger
// 						alert("儲存成功!");
// 					} else{
// 						alert(xhr.status);
// 					}
// 				}
// 			}
<%-- 			xhr.open("POST", "<%= request.getContextPath() %>/frontend/tde/tde", true); --%>
// 			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
// 			xhr.send("action=save");
//  		})   
    
 	</script>
    
    
    
    
	
	<!-- 時間javascript初始化(主要為重載入使用 -->
	<script src="jquery-timepicker/jquery.timepicker.min.js"></script>
	<script>
 	 	$(this).load(function(){
 	 		$('.time_element').timepicker({'timeFormat': 'H:i'});
 	 	});
 	 	
 	 	
 	 	$('.startTime').on('change load',function(e){
	 		var startTimeArr = new Array();
	 		for(var i=0; i<$('.startTime').length; i++){
	 			startTimeArr[i] = $('.startTime')[i];
	 		}
	 		debugger
	 		//找出是第幾個startTime
	 		var n = startTimeArr.indexOf(e.target);
	 		debugger
	 		//先移除對應的finishTime
	 		$('.finishTime:eq(' + n +')').timepicker('remove');	
	 		var min = $('.startTime:eq(' + n +')').val();
	 		debugger
	 		//設定對應的finishTime限制
	 		$('.finishTime:eq(' + n +')').timepicker({
	 	    	'minTime': min,
	 	    	'timeFormat': 'H:i'
	 		});
	 		//再移除下面全部的startTime及finishTime,並設定限制
	 		for(var i=$('.startTime').length-1; i>n; i--){
	 			$('.startTime:eq(' + i +')').timepicker('remove');
	 			$('.finishTime:eq(' + i +')').timepicker('remove');
	 			$('.startTime:eq(' + i +')').timepicker({
		 	    	'minTime': min,
		 	    	'timeFormat': 'H:i'
		 		});
	 			$('.finishTime:eq(' + i +')').timepicker({
		 	    	'minTime': min,
		 	    	'timeFormat': 'H:i'
		 		});
	 		}
	   });
 	 	
 	 	$('.finishTime').on('change',function(e){
	 		var finishTimeArr = new Array();
	 		for(var i=0; i<$('.finishTime').length; i++){
	 			finishTimeArr[i] = $('.finishTime')[i];
	 		}
	 		debugger
	 		//找出是第幾個finishTime
	 		var n = finishTimeArr.indexOf(e.target);
	 		debugger
	 		//先移除下一個startTime
	 		$('.startTime:eq(' + (n+1) +')').timepicker('remove');	
	 		var min = $('.finishTime:eq(' + n +')').val();
	 		debugger
	 		//設定下一個startTime限制
	 		$('.startTime:eq(' + (n+1) +')').timepicker({
	 	    	'minTime': min,
	 	    	'timeFormat': 'H:i'
	 		});
	 		//再移除下面全部的startTime及finishTime,並設定限制
	 		for(var i=$('.finishTime').length-1; i>(n+1); i--){
	 			$('.startTime:eq(' + i +')').timepicker('remove');
	 			$('.finishTime:eq(' + i +')').timepicker('remove');
	 			$('.startTime:eq(' + i +')').timepicker({
		 	    	'minTime': min,
		 	    	'timeFormat': 'H:i'
		 		});
	 			$('.finishTime:eq(' + i +')').timepicker({
		 	    	'minTime': min,
		 	    	'timeFormat': 'H:i'
		 		});
	 		}
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
	<script src='js/jquery.circliful.min.js'></script>
	<script src="js/jquery-ui.js" ></script>
	
	<script type="text/javascript">
	
	$('#tripList').on('click', 'li', function(e){
		var sponame = e.currentTarget.childNodes[2].innerText;
		
		if(typeof(sponame) == "undefined"){
			sponame = e.currentTarget.childNodes[2].data.trim();
		}
		
		debugger
		
		$.ajax({
			 type: "POST",
			 url: "<%= request.getContextPath() %>/frontend/tde/GetSpoContentAjax",
			 data: {"sponame": sponame},
			 dataType: "json",
			 async: true,
			 success: function (data){
				console.log(data);
				var spoVO = JSON.parse(data[0]);
				debugger
				$('#place').text(spoVO.sponame);
				//確認資料庫是否有圖
				if(data[1] == null){
					$('#checkPic').attr('style','display:none');
					debugger
				} else{
					$('#spopic').attr('src','data:image/jpg;base64,' + data[1]);
					$('#checkPic').attr('style','display:block');
					debugger
				}
				debugger
				
				//確認資料庫是否有介紹
				if(typeof(spoVO.spocontent) == "undefined"){
					$('#rating').attr('style','display:none');
					$('#checkContent').attr('style','display:none');
				} else{
					var rating = spoVO.spocontent.substring(0,3);
					$('#rating').text(rating);
					$('#rating').attr('style','display:block');
					if(spoVO.spocontent.length > 10){
						$('#content').text(spoVO.spocontent.substring(3,spoVO.spocontent.length-1));
						$('#checkContent').attr('style','display:block');
					} else{
						$('#checkContent').attr('style','display:none');
					}
				}
				
				$('#addr').text(spoVO.spoaddr);
				debugger
				
		     },
           error: function(){alert("AJAX發生錯誤")}
       })
		
		$('#collapse').animate({right:'15px'}, 800);
		$('#collapse').attr('style','display:block');

	});
	
	$('.ion-ios-close').on('click', function(){
		$('#collapse').attr('style','display:none');
	});
	
	</script>
</body>

</html>