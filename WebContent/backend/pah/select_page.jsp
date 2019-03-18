<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select 機加酒</title>
</head>
<body>

<table id="table-1">
   <tr><td><h3>Select 機加酒</h3><h4>( MVC )</h4></td></tr>
</table>
	
<h3>資料查詢:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<!-- 查詢一筆機加酒 -->
<ul>
	<%-- 全部查詢 --%>
	<li><a href="<%= request.getContextPath() %>/frontend/pah/listgroupwpah.jsp">檢視</a>all 機加酒 <br><br></li>
	<%-- 單一查詢 --%>
	<li>
		<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol">
			<b>輸入機加酒編號: (PAH000001)</b>
			<input type="text" name="pahno">
			<input type="hidden" name="action" value="findByPk">
			<input type="submit" value="送出">
		</form>
	</li>
	
</ul>
<!-- 新增機加酒 -->
<ul>
  <li><a href='<%= request.getContextPath() %>/frontend/pah/addpah.jsp'>Add</a> a new Emp.</li>
</ul>
<!-- 國家選擇 -->
<ul><li>
	<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol">
		<jsp:useBean id="pahCountryList" scope="page" class="com.pah.model.PahService"/>
				<h2>機加酒國家</h2>
				<select size="1" name="pahcountry">
					<c:forEach var="country" items="${pahCountryList.country}">
						<option value="${country}" name="pahcountry">${country}
					</c:forEach>
				</select>
			
			<input type="hidden" value="getcountry" name="action">
			<input type="submit" value="送出國家">
	</form>
</li></ul>

<ul>
	<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol">
		<h3>請輸入價格區間</h3>
		<h3>從<input type="text" name="higher">
		~<input type="text" name="lower">元</h3>
		<input type="hidden" value="getPrice" name="action">
		<input type="submit" value="查詢價格">
	</form>
</ul>


<ul>
	<form method="post" action="<%= request.getContextPath() %>/pah/pahcontrol">
		<h3>開始日期</h3>
		<input type="text" id="start_date" name="firstDate" class="f_date1">
		<h3>結束日期</h3>
		<input type="text" id="end_date" name="lateDate" class="f_date1">
		<input type="hidden" value="getDate" name="action">
		<input type="submit" value="日期查詢">
	</form>
</ul>


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
         
        
        $.datetimepicker.setLocale('zh'); // kr ko ja en
        $(function(){
        	 $('#start_date').datetimepicker({
        	  format:'Y-m-d',
        	  onShow:function(){
        	   this.setOptions({
        	    maxDate:$('#end_date').val()?$('#end_date').val():false
        	   })
        	  },
        	  timepicker:false
        	 });
        	 
        	 $('#end_date').datetimepicker({
        	  format:'Y-m-d',
        	  onShow:function(){
        	   this.setOptions({
        	    minDate:$('#start_date').val()?$('#start_date').val():false
        	   })
        	  },
        	  timepicker:false
        	 });
        });   
         
</script>
</html>