<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*" %>
<jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META HTTP-EQUIV="Refresh" CONTENT="5; URL=<%=request.getContextPath()%>/backend/mpm/AllMyPM.jsp">
<title>訊息成功送出</title>
</head>
<body>
<h1>您的訊息已經成功傳送給${memSvc.getOneMem(param.receiver).memacc}</h1>
<h1>5秒後回訊息一覽或<a href="<%=request.getContextPath()%>/backend/mpm/AllMyPM.jsp">按我前往</a></h1>
</body>
</html>