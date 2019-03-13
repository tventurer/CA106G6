<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(首頁)訂單列表</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>(首頁)訂單列表</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Pur: Home</p>

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

<ul>
  <li><a href='listAllPor.jsp'>List</a> all Pors.  <br><br></li>
  
   <li>
     <FORM METHOD="post" ACTION="pur" >
       <b>輸入訂單編號(如POR000001):</b>
       <input type="text" name="purid">
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  <li>
    <FORM METHOD="post" ACTION="pur" >
        <b>輸入賣家會員編號 (如MEM000001):</b>
        <input type="text" name="memno">
        <input type="hidden" name="action" value="getOneMem_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
 <li>
    <FORM METHOD="post" ACTION="pur" >
        <b>輸入買家會員編號 (如MEM000001):</b>
        <input type="text" name="memno">
        <input type="hidden" name="action" value="getOneMem_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
  
  <jsp:useBean id="porSvc" scope="page" class="com.por.model.PorService" />
  <li>
     <FORM METHOD="post" ACTION="por" >
       <b>選擇訂單編號:</b>
       <select size="1" name="porid">
         <c:forEach var="porVO" items="${porSvc.all}" > 
          <option value="${porVO.porid}">${porVO.porid}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
 
</ul>


<h3>訂單管理</h3>

<ul>
  <li><a href='addPor.jsp'>Add</a> a new Por.</li>
</ul>

</body>

</html>