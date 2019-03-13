<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(首頁)會員交易歷史紀錄</title>

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
   <tr><td><h3>(首頁)會員交易歷史紀錄</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Acr: Home</p>

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
  <li><a href='listAllAcr.jsp'>List</a> all Acrs.  <br><br></li>
  
   <li>
     <FORM METHOD="post" ACTION="acr" >
       <b>輸入會員編號(如MEM000001):</b>
       <input type="text" name="memno">
       <input type="hidden" name="action" value="getMemall_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  <li>
    <FORM METHOD="post" ACTION="acr" >
        <b>輸入交易編號 (如ACR000001):</b>
        <input type="text" name="acrid">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="acrSvc" scope="page" class="com.acr.model.AcrService" />
   
  <li>
     <FORM METHOD="post" ACTION="acr" >
       <b>選擇交易編號:</b>
       <select size="1" name="acrid">
         <c:forEach var="acrVO" items="${acrSvc.all}" > 
          <option value="${acrVO.acrid}">${acrVO.acrid}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
 
</ul>


<h3>員工管理</h3>

<ul>
  <li><a href='addAcr.jsp'>Add</a> a new Acr.</li>
</ul>

</body>

</html>