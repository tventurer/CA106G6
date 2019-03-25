<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
    var MyPoint = "<%=request.getContextPath()%>/frontend/not/${memno}";
    var host = window.location.host;
    var path = window.location.pathname;
    
    var endPointURL = "ws://" + window.location.host + MyPoint;
	var webSocket;
	
	function connect() {
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
		};
		
		webSocket.onmessage = function(event) {
			var howmanyunread = document.getElementById("howmanyunread");
			var i = parseInt(document.getElementById("howmanyunread").value);
			
			howmanyunread.innerHTML = ++i;
		};
		
		webSocket2.onclose = function(event) {
		};
		
	
	}
</script>
</body>
</html>