<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64" %>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style type="text/css">
	#img1{
		align: right;
		width: 200px;
		height: 200px;
	}
</style>

<title>修改行程</title>
</head>
<body>
	<h1 align="center">修改行程</h1>
	
	<c:if test="${not empty errorMsgs}">
		請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</c:if>
	
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-6">

<% 
	String action;
	if(request.getAttribute("memno") == null){
		action = "tri?whichPage=" + (String)request.getAttribute("whichPage");
	} else{
		action = "tri?whichPage=" + (String)request.getAttribute("whichPage") + "&memno=" + (String)request.getAttribute("memno");
	}
%>

				<form method="post" action=<%= action %>>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">行程編號</label>
						<div class="col-sm-10">
							<div class="col-form-label" >${triVO.trino}</div>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">行程名稱</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="triname" value="${triVO.triname}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">開始日期</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="tribegdate" value="${triVO.tribegdate}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">結束日期</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="trienddate" value="${triVO.trienddate}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">人數</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" name="tripeonum" value="${triVO.tripeonum}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">狀態</label>
						<div class="col-sm-10">
							<select name="tristat" class="form-control">
								<option value="0" ${triVO.tristat == 0?"selected":""}>規劃中</option>
								<option value="1" ${triVO.tristat == 1?"selected":""}>審核中</option>
								<option value="2" ${triVO.tristat == 2?"selected":""}>查看訂單</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">備註</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="triremark">${triVO.triremark}</textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12">
							<input type="hidden" name="action" value="update">
							<input type="hidden" name="trino" value="${triVO.trino}">
							<center>
								<button type="submit" class="btn btn-primary">送出</button>
								<button type="reset" class="btn btn-primary">清除</button>
							</center>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

<!-- 圖片上傳javascript -->
<script type="text/javascript">
function readURL(input){
	var reader = new FileReader();
	reader.onload = function (e) {
		switch(input.name){
		case "spopic":
					$("#img1").attr('src', e.target.result).css("display","");
					break;
				}
			}
	reader.readAsDataURL(input.files[0]);
}
</script>

</html>