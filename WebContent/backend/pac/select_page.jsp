<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Pac: Home</title>

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
   <tr><td><h3>IBM Pac: Home</h3><h4>( MVC )</h4></td><td>
		 <h4><img src="images/003.jpg" width="100" height="100" border="0"></h4>
	</td></tr>
   
</table>

<p>This is the Home page for IBM Pac: Home</p>

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
  <li><a href='listAllPac.jsp'>列出</a> all 套裝行程.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" >
        <b>輸入套裝行程編號 (如PAC000001):</b>
        <input type="text" name="pacno">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac">
       <b>選擇套裝行程編號:</b>
       <select size="1" name="pacno">
         <c:forEach var="pacVO" items="${pacSvc.all}" > 
          <option value="${pacVO.pacno}">${pacVO.pacno}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" >
       <b>選擇套裝行程名稱:</b>
       <select size="1" name="pacno">
         <c:forEach var="pacVO" items="${pacSvc.all}" > 
          <option value="${pacVO.pacno}">${pacVO.pacname}
         </c:forEach>   
<!--          這邊的第一個pacname甚麼意思 -->
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>套裝行程管理</h3>

<ul>
  <li><a href='addPac.jsp'>新增</a>一個套裝行程 .</li>
</ul>

</body>
</html>