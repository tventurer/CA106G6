<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ptp.model.*"%>
<html>
<head>
<title>IBM Pcd: Home</title>

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
   <tr><td><h3>IBM Pcd: Home</h3><br><h4>( MVC )
   套裝行程訂單的首頁</h4></td>
  </tr>
   
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

<ul>
  <li><a href='listAllPcd.jsp'>列出</a> all 套裝訂單內容.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" >
        <b>輸入套裝訂單編號 (如PCD000001):</b>
        <input type="text" name="pcdno">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd">
       <b>選擇套裝訂單編號:</b>
       <select size="1" name="pcdno">
         <c:forEach var="pcdVO" items="${pcdSvc.all}" > 
          <option value="${pcdVO.pcdno}">${pcdVO.pcdno}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd">
       <b>選擇會員編號:</b>
       <select size="1" name="pcdno">
         <c:forEach var="pcdVO" items="${pcdSvc.all}" > 
          <option value="${pcdVO.pcdno}">${pcdVO.memno}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  
</ul>


<h3>套裝訂單管理</h3>

<ul>
  <li><a href='join3.jsp'>新增</a>一個套裝訂單.</li>
</ul>

</body>
</html>