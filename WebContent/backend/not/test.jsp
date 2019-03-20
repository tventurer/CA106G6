<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
  Map map = (Map) application.getAttribute("ctxMSM");
%>
<%=session.getAttribute("notification") %>
</body>
</html>