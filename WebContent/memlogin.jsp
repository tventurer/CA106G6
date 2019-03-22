<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/MemLoginHandler" method="post">
		
			<table border=1>
				<tr>
					<td colspan=2>
						<p align=center>
							輸入<b>(測試登入)</b>:<br> 
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>email:</b>
					</td>
					<td>
						<p>
							<input type=text name="mememail" value="" size=15>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>password:</b>
					</td>
					<td>
						<p>
							<input type=password name="password" value="" size=15>
					</td>
				</tr>


				<tr>
					<td colspan=2 align=center>
							<input type=hidden name="action" value="login">
							<input type=submit value="登入">
						<button type="submit" formaction="<%=request.getContextPath()%>/frontend/mem/memsignup.jsp" name="action" value="signup">註冊</button>
					</td>
				</tr>
			</table>
	</form>
	<h1>${denied}</h1>
	

	
</body>
</html>