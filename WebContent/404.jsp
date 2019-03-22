<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
</head>
<body>
<h1>404 Page Not Found 找不到網頁!! 這是正常現象請勿驚慌</h1>
<h1>原因: ${param.errorMsgs}</h1>
<h1><a href="<%=request.getContextPath()%>/index.jsp">回首頁</a></h1>
</body>
</html>