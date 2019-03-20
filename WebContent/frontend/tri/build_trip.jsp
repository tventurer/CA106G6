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

<title>建立行程</title>
</head>
<jsp:include page="/frontend/navbar.jsp"/>
<body>
	<h1 align="center">建立行程</h1>

	<c:if test="${not empty errorMsgs}">
		請修正以下錯誤:
	<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach>
	</ul>
	</c:if>
<section class="section-property section-t8">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-5">

				<form method="post" action="tri">
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">行程名稱</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="triname"
								value="${triVO.triname}">
						</div>
					</div>
					<jsp:useBean id="spoSvc" class="com.spo.model.SpoService"/>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">選擇國家</label>
						<div class="col-sm-10">
							<select name="con" class="form-control">
								<option value="台灣">台灣</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">選擇城市</label>
						<div class="col-sm-10">
							<select name="city" class="form-control">
								<option value="台北市" ${city == "台北市"?"selected":""}>台北市</option>
								<option value="桃園市" ${city == "桃園市"?"selected":""}>桃園市</option>
								<option value="新北市" ${city == "新北市"?"selected":""}>新北市</option>
								<option value="台中市" ${city == "台中市"?"selected":""}>台中市</option>
								<option value="高雄市" ${city == "高雄市"?"selected":""}>高雄市</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">選擇出發日期</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="tribegdate"
								value="${triVO.tribegdate}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">選擇回程日期</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" name="trienddate"
								value="${triVO.trienddate}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">行程人數</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" name="tripeonum" min="1" max="10"
								value="${triVO.tripeonum}">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12">
							<input type="hidden" name="action" value="insert">
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
</section>

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

</html>