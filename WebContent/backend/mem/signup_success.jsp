<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Refresh" CONTENT="5; URL=${fromwhere}">
<title>註冊成功</title>
</head>
<body>

	<br>
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='orange' align='center' valign='middle' height='20'>
			 <td>   
			       <h3> 註冊成功的頁面 - signup_success.jsp           </h3> 
				     <h3> 歡迎:<font color=red> ${memrealname} </font>您好</h3>
				     <h3>註冊成功</h3>
			 </td>
		</tr>
	</table>
	<b> <br>
	<br>                五秒後回到原頁面或是<a href="${fromwhere}">按我前往</a>
	</b>
	
</body>
</html>