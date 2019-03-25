<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pcd.model.*"%>
<%@ page import="com.pac.model.*"%>
<%@ page import="com.ptp.model.*"%>

<%
  PcdVO pcdVO = (PcdVO) request.getAttribute("pcdVO"); //EmpServlet.java (Concroller) �s�Jreq��pcdVO���� (�]�A�������X��pcdVO, �]�]�A��J��ƿ��~�ɪ�pcdVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�q��ק� - update_pcd_input.jsp</title>

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
<body  class="app sidebar-mini rtl">
<jsp:include page="/backend/backbar.jsp" />
<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> �ק�q��</h1>
        </div>
      </div>
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
 				  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�M�˭q��s��:<td><font color=red><b>*</b></font></label>
                    <label><%=pcdVO.getPcdno()%></label>
                  </div> 
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�X�Τ��e�s��:</label>
                    <input class="form-control form-control-lg" name="ptpno" id="inputLarge" type="text" value="<%= pcdVO.getPtpno()%>">
                  </div> 
                  <jsp:useBean id="pacSvc" scope="page" class="com.pac.model.PacService"/>
				  <jsp:useBean id="pcdSvc" scope="page" class="com.pcd.model.PcdService"/>
				  <jsp:useBean id="ptpSvc" scope="page" class="com.ptp.model.PtpService"/>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�X�Φ�{�W��:</label>
                    <label><font color=blue>${pacSvc.getOnePac(ptpSvc.getOnePtp(pcdVO.ptpno).pacno).pacname}</font></label>
                  </div> 
                  
                 
				  <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�|���s��:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="memno"
					 	value="<%= pcdVO.getMemno()%>">
                  </div>
                   <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�ѥ[�H��:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdtripmen"
					 	value="<%= pcdVO.getPcdtripmen()%>">
                  </div>
	
	 <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">ú�O���:</label>
                    <input class="form-control form-control-lg f_date1" id="inputLarge" type="text" name="pcdordday"
					 	 value="<%= pcdVO.getPcdordday()%>" />
                  </div>
	
	 <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">ú�O���B:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdmoney"
					 	value="<%= pcdVO.getPcdmoney()%>">
                  </div>
	
	     
                  <div class="form-group">
                    <label for="exampleSelect1">ú�O���A:</label>
                    <select class="form-control" name="pcdstatus" id="exampleSelect1">
                    <%
                    String[] pcdstatus ={"��ú�O","ú�M","�wú�q��","�����q��"};
                    for(int i = 0; i<pcdstatus.length;i++){
                    	if(pcdVO.getPcdstatus()==i){
                    		out.println("<option value="+i+" selected='selected'>"+pcdstatus[i]+"</option>");
                    	}else{
                    		out.println("<option value="+i+">"+pcdstatus[i]+"</option>");
                    	}
                    }
                    %>
                    </select>
                  </div>
                  
	<div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">���n�p���H���:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdsecphone"
					 	pattern="^09\d\d\d\d\d\d\d\d$"  value="<%= pcdVO.getPcdsecphone()%>" />
                  </div>
      <div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�ѹΤH�����:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdfamdata"
					 	value="<%= pcdVO.getPcdfamdata()%>" />
                  </div>            
	
	<div class="form-group">
                    <label class="col-form-label col-form-label-lg" for="inputLarge">�ݨD�Ƶ�:</label>
                    <input class="form-control form-control-lg" id="inputLarge" type="text" name="pcdmark"
					 	 value="<%= (pcdVO.getPcdmark()==null) ? "�L" : pcdVO.getPcdmark()%>" />
                  </div>
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