<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mem.model.*"%>
<%
  String memno = (String) session.getAttribute("memno");
  MemVO memVO = new MemService().getOneMem(memno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${memVO.memrealname}你好! 您的信箱${memVO.mememail}已經通過驗證!</h1>
</body>
</html>