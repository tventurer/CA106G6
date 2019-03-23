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
					<input id="myStatus" style="width:100%;height:35px" type="text" placeholder="���A" />
		            <input style="width:80%;height:70px;margin-top:2%" id="message" type="text" placeholder="�T��" onkeydown="if (event.keyCode == 13) sendMessage();"/>
		            <input style="width:9%;height:70px" type="submit" id="sendMessage" class="btn btn-secondary" value="�e�X" onclick="sendMessage();"/>
		            <input style="width:9%;height:70px" type="button" class="btn btn-light" value="�m�N" onclick="shake();"/>
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
		// �إ� websocket ����
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
		};

		webSocket.onmessage = function(event) {
			var messagesArea = document.getElementById("messagesArea");
			var statusOutput = document.getElementById("statusOutput");
	        var jsonObj = JSON.parse(event.data);
	        
	        	
				var message = "�X�� : " + jsonObj.message + "\r\n";
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
	        alert ("�T���ФŪť�!");
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

		
	
	
	
// 	�����_��
function shake(){
	
	 var loop = 0; //�έp�_�ʦ���
	 var timer; //�w�ɾ��ޥ�
	 var offx; //���������q
	 var offy; //���������q
	 var dir; //����_�ʤ�V
	 
	 timer = setInterval(function(){
	  var myStatus = document.getElementById("myStatus");
	  var messagesArea = document.getElementById("messagesArea");
	  var message = document.getElementById("message");
	  if (loop > 100)
	  {
	   clearInterval(timer); //�_�ʦ��ƶW�L100�N����w�ɾ�
	  }
	  dir = Math.random()*10 > 5 ? 1 : -1; //��o�_�ʤ�V
	  offx = Math.random()*3*dir;
	  offy = Math.random()*3*dir;
	  myStatus.style.marginTop = offx+"px";
	  myStatus.style.marginLeft = offy+"px";
	  messagesArea.style.marginTop = offx+"px";
	  messagesArea.style.marginLeft = offy+"px";
	  message.style.marginTop = offx+"px";
	  message.style.marginLeft = offy+"px";
	  loop++;
	 },10) //�C�j10�@��_�ʤ@��
	 
	 
}
    
</script>
</html>
