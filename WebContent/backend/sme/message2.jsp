<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title >Chat Room</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    <link rel="stylesheet"
			href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
			
		<style>
			input{			
				border-radius:7px;
			}
		</style>
		
 	</head>
    
    <body onload="connect();" onunload="disconnect();" style="background-color:#FFF7E8">
	    
	 	
	 	<div class="container-fluid">
	 		<div class="row">
				<div class="col-12" style="background-color:#9999FF">
					<h5>傳送即時訊息</h5>
				</div>
			</div>
		</div>
	    
	     
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="col-4">
							<h5 class="text-success" style="text-align:center">會員的心情:</h5>					
						</div>
						<div class="col-8">
			    			<h5 id="MEMstatus" class="text-success" ></h5>					
						</div>
		    		</div>
		    		<div class="row">
						<div class="col-4">
							<h5 class="text-success" style="text-align:center">管理員的心情:</h5>					
						</div>
						<div class="col-8">
		    				<h5 id="EMPstatus" class="text-success" ></h5>
		    			</div>
					</div>
			        <textarea id="messagesArea" readonly id="textbox" style="width:100%;height:400px;border-radius:15px"></textarea>				
				</div>
			</div>
		</div>
		
		<br>
		
        <div class="container">
			<div class="row">
				<div class="col-12">
					<input id="myStatus" style="width:90%;height:35px" type="text" placeholder="狀態" />
		            <input style="width:5%;height:35px;background-image:url(images/din.png)" type="button" onclick="beshake();"/>
		    	</div>
			</div>
			<br>
			<div class="row">
				<div class="col-12">
		            <input style="width:80%;height:70px" id="message" type="text" placeholder="訊息" onkeydown="if (event.keyCode == 13) sendMessage();"/>
		            <input style="width:15%;height:70px" type="submit" id="sendMessage" class="btn btn-light" value="傳送" onclick="sendMessage();"/>
				</div>
			</div>
		</div>
    </body>
    
    
<script>
    
    var MyPoint = "/MyEchoServer0325";
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
			
	        var jsonObj = JSON.parse(event.data);

			if(jsonObj.gogo===true){
				
				shake();
				
			}else{
				
				var messagesArea = document.getElementById("messagesArea");
				var MEMstatus = document.getElementById("MEMstatus");
				var EMPstatus = document.getElementById("EMPstatus");
				var mystatus = document.getElementById("mystatus");
		        
		        if(jsonObj.empno!=null){
					var message = "客服員("+ jsonObj.empno +")說: " + jsonObj.message + "\r\n";
					EMPstatus.innerHTML = jsonObj.mystatus;
					MEMstatus.innerHTML = jsonObj.MEMstatus;
		        }else if(jsonObj.memno!=null){
		        	var message = " 客戶 ("+ jsonObj.memno +")說: " + jsonObj.message + "\r\n";
		        	EMPstatus.innerHTML = jsonObj.EMPstatus;
		        	MEMstatus.innerHTML = jsonObj.mystatus;
		   		 }	
		        
		        
		        messagesArea.value = messagesArea.value + message;
		        messagesArea.scrollTop = messagesArea.scrollHeight;	        	
				
			}
	        	
	        	
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
	    var inputmyStatus = document.getElementById("myStatus");
	    var inMEMstatus = document.getElementById("MEMstatus");
		var inEMPstatus = document.getElementById("EMPstatus");
	    var message = inputMessage.value.trim();
	    var myStatus = inputmyStatus.value.trim();
	    var MEMstatus = inMEMstatus.innerHTML;
	    var EMPstatus = inEMPstatus.innerHTML;
	    
	    if (message === ""){
	        alert ("訊息請勿空白!");
	        inputMessage.focus();	
	    }else{
	    	<%
	    		if(empno!=null){
	    	%>
			        var jsonObj = {"message" : message,"mystatus" : myStatus,"empno" : '<%=empno%>',"MEMstatus" : MEMstatus};	    			
	    	<%  }  %>
	    	<%
    			if(memno!=null){
	    	%>
			        var jsonObj = {"message" : message,"mystatus" : myStatus,"memno" : '<%=memno%>',"EMPstatus" : EMPstatus};	    			
	    	<%  }  %>
	        webSocket.send(JSON.stringify(jsonObj));
	        inputMessage.value = "";
	        inputMessage.focus();
	    }
	}

		

	
	// 	送出搖動
	function beshake(){
		var jsonObj = {"gogo" : true};
		webSocket.send(JSON.stringify(jsonObj));
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
		  offx = Math.random()*10*dir;
		  offy = Math.random()*10*dir;
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
