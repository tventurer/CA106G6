<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  session.invalidate();
%>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<h1>您已成功登出!</h1>
	<h1>5秒後回首頁或<a href="<%=request.getContextPath()%>/index.jsp">按我前往</a></h1>
</body>
</html>