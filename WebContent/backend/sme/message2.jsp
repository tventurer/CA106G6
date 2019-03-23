<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
    <head>
        <title >Chat Room</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    <link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
		
 	</head>
    
    <body onload="connect();" onunload="disconnect();" class="bg-secondary">
	    
	    
		<div class="container">
			<div="row">
				<div="col-12">
	    			<h2 id="statusOutput" class="text-warning" >1212121</h2>
			        <textarea id="messagesArea" readonly id="textbox" style="width:100%;height:400px;margin-top:3%;margin-bottom:1%"></textarea>				
				</div>
			</div>
		</div>
        <div class="container">
			<div="row">
				<div="col-12">
					<input id="myStatus" style="width:100%;height:35px" type="text" placeholder="狀態" />
		            <input style="width:80%;height:70px;margin-top:2%" id="message" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/>
		            <input style="width:9%;height:70px" type="submit" id="sendMessage" class="btn btn-secondary" value="送出" onclick="sendMessage();"/>
		            <input style="width:9%;height:70px" type="button" class="btn btn-light" value="叮咚" onclick="shake();"/>
		    	</div>
			</div>
		</div>
    </body>
    
    
<script>
    
    var MyPoint = "/MyEchoServer";
    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
    
	var webSocket;
	
	function connect() {		
		// 建立 websocket 物件
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
			var statusOutput = document.getElementById("statusOutput");
	        var jsonObj = JSON.parse(event.data);
	        
	        	
				var message = "訪客 : " + jsonObj.message + "\r\n";
		        messagesArea.value = messagesArea.value + message;
		        messagesArea.scrollTop = messagesArea.scrollHeight;	        	
	        	
	        	var mystatus = jsonObj.myStatus;
	        	statusOutput.innerHTML = jsonObj.empno + "(" + jsonObj.status + ")";
	        	
		};

		webSocket.onclose = function(event) {
		};
	}
	
	
	
	function sendMessage() {
		<%
			String empno = request.getParameter("empno");
			String memno = request.getParameter("memno");				
		%>
	    
	    var inputMessage = document.getElementById("message");
		var inputStatus = document.getElementById("myStatus");
	    var message = inputMessage.value.trim();
	    var status = inputStatus.value.trim();
	    
	    if (message === ""){
	        alert ("訊息請勿空白!");
	        inputMessage.focus();	
	    }else{
	    	<%
	    		if(empno!=null){
	    	%>
			        var jsonObj = {"message" : message,"status" : status,"empno" : '<%=empno%>'};	    			
	    	<%  }  %>
	    	<%
    			if(memno!=null){
	    	%>
			        var jsonObj = {"message" : message,"status" : status,"memno" : "<%=memno%>"};	    			
	    	<%  }  %>
	        webSocket.send(JSON.stringify(jsonObj));
	        inputMessage.value = "";
	        inputMessage.focus();
	    }
	}

		
	
	
	
// 	視窗震動
function shake(){
	
	 var loop = 0; //統計震動次數
	 var timer; //定時器引用
	 var offx; //水平偏移量
	 var offy; //垂直偏移量
	 var dir; //控制震動方向
	 
	 timer = setInterval(function(){
	  var myStatus = document.getElementById("myStatus");
	  var messagesArea = document.getElementById("messagesArea");
	  var message = document.getElementById("message");
	  if (loop > 100)
	  {
	   clearInterval(timer); //震動次數超過100就停止定時器
	  }
	  dir = Math.random()*10 > 5 ? 1 : -1; //獲得震動方向
	  offx = Math.random()*3*dir;
	  offy = Math.random()*3*dir;
	  myStatus.style.marginTop = offx+"px";
	  myStatus.style.marginLeft = offy+"px";
	  messagesArea.style.marginTop = offx+"px";
	  messagesArea.style.marginLeft = offy+"px";
	  message.style.marginTop = offx+"px";
	  message.style.marginLeft = offy+"px";
	  loop++;
	 },10) //每隔10毫秒震動一次
	 
	 
}
    
</script>
</html>
