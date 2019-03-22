<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>驗證信已送出</h1>
<p>提醒您驗證信只有最新的一封有效</p>
<h1><a href="<%=request.getContextPath()%>/frontend/mem/MyPage.jsp?memno=${memno}">回個人首頁</a></h1>
</body>
</html>