<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>通知測試</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/backend/not/not" method="post">
  <table>
    <tr>
      <td>愛的告白</td>		
	</tr>
	<tr>
	  <td>
        to?<br>
	    <input type="text" name="receiver" size="45">
	  </td>
	</tr>
	<tr>
	  <td><textarea name="notcontent" rows="10" cols="80"></textarea></td>
	</tr>
	<tr>
	  <td>
	    <input type="hidden" name="action" value="insert">
	    <input type="submit" value="送出">
	  </td>
	</tr>
  </table>
</form>
</body>
</html>