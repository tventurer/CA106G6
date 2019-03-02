<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pac.model.*"%>

<%
  PacVO pacVO = (PacVO) request.getAttribute("pacVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�M�˦�{�ק� - update_pac_input.jsp</title>

<style>
  table#table-1 {
	background-color: Yellow;
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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�M�˦�{�ק� - update_pac_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/pac/pac" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>�M�˽s��:<font color=red><b>*</b></font></td>
		<td><%=pacVO.getPacno()%></td>
	</tr>
	<tr>
		<td>�޲z���s��:<font color=red><b>*</b></font></td>
		<td><%= pacVO.getEmpno()%></td>
	</tr>
	<tr>
		<td>�M�˦W��:</td>
		<td><input type="TEXT" name="pacname" size="45"
			 value="<%= pacVO.getPacname()%>" /></td>
	</tr>
	<tr>
		<td>�ȹC��a:</td>
		<td><input type="TEXT" name="paccountry" size="45"
			 value="<%= pacVO.getPaccountry()%>" /></td>
	</tr>
	<tr>
		<td>�ȹC����:</td>
		<td><input type="TEXT" name="paccity" size="45"
			 value="<%= pacVO.getPaccity()%>" /></td>
	</tr>
	<tr>
		<td>�ȹC�Ѽ�:</td>
		<td><input type="TEXT" name="pactotalday" size="45"
			 value="<%= pacVO.getPactotalday()%>" /></td>
	</tr>
	<tr>
		<td>�ζO����:</td>
		<td><input type="TEXT" name="pacprice" size="45"
			 value="<%= pacVO.getPacprice()%>" /></td>
	</tr>
	
	<tr>
		<td>�wú�q��:</td>
		<td><input type="TEXT" name="pacdeposit" size="45"
			 value="<%= pacVO.getPacdeposit()%>" /></td>
	</tr>
	<tr>
		<td>�S�����:</td>
		<td><input type="TEXT" name="pacdiv" size="45"
			 value="<%= pacVO.getPacdiv()%>" /></td>
	</tr>
	
	<tr>
		<td>��{���e:</td>
		<td><input type="TEXT" name="paccontent" size="45"
			 value="<%= pacVO.getPaccontent()%>" /></td>
	</tr>
	<tr>
		<td>��{�S��1:</td>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1">
		<input type="file" name="pactchar1" size="45" value="<%= pacVO.getPactchar1()%>" id="photo"/>
			 <img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1" style="display:none;" width="100" height="100">	
			 </td>
	</tr>
	<tr>
		<td>��{�S��2:</td>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=2"><br>
		<input type="file" name="pactchar2" size="45" value="<%= (pacVO==null)? pacVO.getPactchar2() : pacVO.getPactchar2()%>" id="photo"/>
			<img id="preview" src="#" style="display:none;" width="100" height="100">	 
		</td>
	</tr>
	
	<tr>
		<td>�`�N�ƶ�:</td>
		<td>
			<input type="TEXT" name="pacremark" size="45"
				 value="<%= pacVO.getPacremark()%>" /></td>
	</tr>
	<tr>
		<td>��{���p:</td>
		<td>
			<select name="pacstatus">
				<option value=0>�i�X��
				<option value=1>���A�X��
			</select> 
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.pac.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>����:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="pacno" value="<%=pacVO.getPacno()%>">
<input type="hidden" name="empno" value="<%=pacVO.getEmpno()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>

</html>