<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>

<%
  PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO"); //EmpServlet.java (Concroller) �s�Jreq��pcdVO���� (�]�A�������X��pcdVO, �]�]�A��J��ƿ��~�ɪ�pcdVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�M�˦�{�ק� - update_pcd_input.jsp</title>

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
		 <h3>�M�˦�{�ק� - update_pcd_input.jsp</h3>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pcd/pcd" name="form1">
<table>
	<tr>
		<td>�M�˭q��s��:<font color=red><b>*</b></font></td>
		<td><%=pcdVO.getPcdno()%></td>
	</tr>	
	<tr>
		<td>�X�Τ��e�s��:</td>
		<td><input type="TEXT" name="ptpno" size="30" 
			 value="<%= pcdVO.getPtpno()%>" /></td>
	</tr>
	<tr>
		<td>�X�Φ�{�W��:</td>
		<td><input type="TEXT" name="pacname" size="30" 
			 value="�q�X�����W��" /></td>
	</tr>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="memno" size="30"
			 value="<%= pcdVO.getMemno()%>" /></td>
	</tr>
	<tr>
		<td>�ѥ[�H��:</td>
		<td><input type="TEXT" name="pcdtripmen" size="30"
			 value="<%= pcdVO.getPcdtripmen()%>" /></td>
	</tr>
	<tr>
		<td>ú�O���:</td>
		<td><input type="TEXT" name="pcdordday" class="f_date1" size="30"
			 value="<%= pcdVO.getPcdordday()%>" /></td>
	</tr>
	<tr>
		<td>ú�O���B:</td>
		<td><input type="TEXT" name="pcdmoney" size="30"
			 value="<%= pcdVO.getPcdmoney()%>" /></td>
	</tr>
	<tr>
		<td>ú�O���A:</td>
		<td>
			<select name="pcdstatus">
				<option value=0>��ú�O
				<option value=1>ú�M
				<option value=2>�wú�q��
				<option value=3>�����q��
			</select> 
	</tr>
	<tr>
		<td>���n�p���H���:</td>
		<td><input type="TEXT" name="pcdsecphone" size="30"
			 value="<%= pcdVO.getPcdsecphone()%>" /></td>
	</tr>
	
	<tr>
		<td>�ѹΤH�����:</td>
		<td><input type="TEXT" name="pcdfamdata" size="30"
			 value="<%= pcdVO.getPcdfamdata()%>" /></td>
	</tr>
	<tr>
		<td>�ݨD�Ƶ�:</td>
		<td><input type="TEXT" name="pcdmark" size="30"
			 value="<%= (pcdVO.getPcdmark()==null) ? "" : pcdVO.getPcdmark()%>" /></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="pcdno" value="<%=pcdVO.getPcdno()%>">
<input type="submit" value="�e�X�ק�"></FORM>
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
   		theme: 'pink',              //theme: 'dark',
   		timepicker:false,       //timepicker:true,
   		step: 60,                //step: 60 (�o�Otimepicker���w�]���j60����)
  		format:'Y-m-d',         //format:'Y-m-d H:i:s',
   
   		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
   		//startDate:	            '2017/07/10',  // �_�l��
   		//minDate:               '-1970-01-01', // �h������(���t)���e
  		//maxDate:               '+1970-01-01'  // �h������(���t)����
});



</script>

</html>