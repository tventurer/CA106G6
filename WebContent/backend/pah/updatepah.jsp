<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pah.model.*"%>

<%
  PahVO pahvo = (PahVO)request.getAttribute("pahvo");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改機加酒商品</title>
</head>
<body>
	
	<table id="table-1">
		<tr><td>
			 <h3>機加酒修改 </h3>
			 <h4><a href="<%= request.getContextPath() %>/frontend/pah/select_page.jsp">想回首頁?????????????????????????????????????</a></h4>
			 <h4><a href="<%= request.getContextPath() %>/frontend/pah/listallpah.jsp">想繼續改?????????????????????????????????????</a></h4>
		</td></tr>
	</table>
	
	<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol" enctype="multipart/form-data">
	<table>
		<tr>
			<td>機加酒編號:</td>
			<td>${pahvo.pahno}</td>
		</tr>
		<tr>
			<td>機加酒標題</td>
			<td><input type="text" name="pahname" size="45" value="${pahvo.pahname}"></td>
		</tr>
		<tr>
			<td>機加酒簡介</td>
			<td><input type="text" name="pahintro" size="45" value="<%=pahvo.getPahintro()%>"></td>
		</tr>
		<tr>
			<td>機加酒內容</td>
			<td><input type="text" name="pahcontent" size="45" value="${pahvo.pahcontent}"></td>
		</tr>
		<tr>
			<td>價格</td>
			<td><input type="text" name="pahprice" size="45" value="${pahvo.pahprice}"></td>
		</tr>
		<tr>
			<td>國家</td>
			<td><input type="text" name="pahcountry" size="45" value="${pahvo.pahcountry}"></td>
		</tr>
		<tr>
			<td>數量</td>
			<td><input type="text" name="pahnum" size="45" value="${pahvo.pahnum}"></td>
		</tr>
		<tr>
			<td>出發日期</td>
			<td><input type="text" name="pahstdate" class="f_date1" size="45" value="${pahvo.pahstdate}"></td>
		</tr>
		<tr>
			<td>回程日期</td>
			<td><input type="text" name="pahenddate" class="f_date1" size="45" value="${pahvo.pahenddate}"></td>
		</tr>
		<tr>
			<td>下架日期</td>
			<td><input type="text" name="pahdown" class="f_date2" size="45" value="${pahvo.pahdown}"></td>
		</tr>
		
		<tr>
			<td>商品狀態</td>
			<td><select size="1" name="pahstatus">
				<option value="0" >上架中
				<option value="1" >下架中
			</select></td>
		</tr>
		
		<tr>
			<td>照片</td>
			<td><input type="file" name="pahpc1" size="45" value="${pahvo.pahpc1}"></td>
		</tr>
		<tr>
			<td>照片</td>
			<td><input type="file" name="pahpc2" size="45" value="${pahvo.pahpc2}"></td>
		</tr>
		<tr>
			<td>照片</td>
			<td><input type="file" name="pahpc3" size="45" value="${pahvo.pahpc3}"></td>
		</tr>
		<tr>
			<td>照片</td>
			<td><input type="file" name="pahpc4" size="45" value="${pahvo.pahpc4}"></td>
		</tr>
		<tr>
			<td>照片</td>
			<td><input type="file" name="pahpc5" size="45" value="${pahvo.pahpc5}"></td>
		</tr>
		<tr>
			<td>管理員編號</td>
			<td><input type="text" name="empno" size="45" value="${pahvo.empno}"></td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="pahno" value="<%=pahvo.getPahno()%>">
	<input type="submit" value="送出修改">

</form>


</body>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('.f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
           timepicker:false,       //timepicker:true,
 	       step: 10,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '', // value:   new Date(),
        });
        
        $.datetimepicker.setLocale('zh');
        $('.f_date2').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 10,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '', // value:   new Date(),
        });
         
        
        
         
</script>
</html>