<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pos.model.*" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.bpt.model.*" %>
<%@ page import="com.bpc.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
  PosService posSvc = new PosService();
  PosVO posVO = posSvc.getOnePos(request.getParameter("posno"));
  request.setAttribute("posVO", posVO);
%>

<c:if test="${posVO == null}">
  <c:redirect url="/404.jsp"><c:param name="errorMsgs" value="查無文章編號"/></c:redirect>
</c:if>

<%  
  BpcService bpcSvc = new BpcService();
  List<BpcVO> bpclist = bpcSvc.getListByPosno(posVO.getPosno());
  request.setAttribute("bpclist", bpclist);
%>
<jsp:useBean id="memSvc" class="com.mem.model.MemService" scope="page"/>
<jsp:useBean id="bptSvc" class="com.bpt.model.BptService" scope="page"/>
<html>
<head>
<meta charset="UTF-8">
<title>文章資料 - listOnePos.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
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

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>文章資料 - listOnePos.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/pos/AllPost.jsp"><img src="<%=request.getContextPath()%>/backend/pos/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>發表人</th>
		<th>文章分類</th>
		<th>標題</th>
		<th>內文</th>
		<th>發表時間</th>		
	</tr>
	<tr>
		<td>
		  ${memSvc.getOneMem(posVO.memno).memacc}
		  <c:if test="${(memno != null) && (posVO.memno != memno)}">
		    <br><a href="<%=request.getContextPath()%>/backend/mpm/NewPM.jsp?receiver=${posVO.memno}">發私人訊息給他</a>
		  </c:if>
		</td>
		<td>${bptSvc.getOneBpt(posVO.tagno).tagcontent}</td>
		<td>${posVO.postitle}</td>
		<td>${posVO.poscontent}</td>
		<td>${posVO.postime}</td>
	</tr>
</table>
<c:if test="${memno != null}">
<form action="<%=request.getContextPath()%>/frontend/bpc/bpc" method="post">
  <table>
    <tr>
      <td>我要留言</td>		
	</tr>
	<tr>
	  <td><textarea name="bpccontent" rows="10" cols="80"></textarea></td>
	</tr>
	<tr>
	  <td>
	    <input type="hidden" name="posno" value="${posVO.posno}">
	    <input type="hidden" name="action" value="insert">
	    <input type="submit" value="送出">${errorMsgs.bpccontent}${errorMsgs.notlogin}
	  </td>
	</tr>
  </table>
</form>
</c:if>
<table>
	<tr>
		<th>會員帳號</th>
		<th>留言內容</th>
		<th>發表時間</th>
		<th>刪除</th>		
	</tr>
	
	<c:forEach var="bpcVO" items="${bpclist}">
		
		<tr>
			<td>${memSvc.getOneMem(bpcVO.memno).memacc}</td>
			<td>${bpcVO.bpccontent}</td>
			<td>${bpcVO.bpctime}</td>
			<td>
			  <c:if test="${bpcVO.memno == memno}">
			    <form action="<%=request.getContextPath()%>/frontend/bpc/bpc" method="post">
			      <input type="hidden" name="action" value="delete">
			      <input type="hidden" name="bpcno" value="${bpcVO.bpcno}">
			      <input type="hidden" name="posno" value="${posVO.posno}">
			      <input type="submit" value="刪除"/>
			    </form>
			  </c:if>
			</td>
		</tr>
	</c:forEach>
	
</table>
</body>
<% session.removeAttribute("errorMsgs"); %>
</html>