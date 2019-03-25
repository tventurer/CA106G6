<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pac.model.*"%>

<%
  PacVO pacVO = (PacVO) request.getAttribute("pacVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
  String requestURL = request.getParameter("requestURL");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�M�˦�{�ק� - update_pac_input.jsp</title>
<script src="<%=request.getContextPath()%>/ckeditor4/ckeditor.js"></script>
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
  
  form>input,form>select{
  	padding:5px 10px;border:1px solid #888888;border-radius:5px;
  }
</style>

</head>
<body  class="app sidebar-mini rtl">
<jsp:include page="/backend/backbar.jsp" />
<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> �ק��{</h1>
          
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
      <div class="row">
        <div class="col-md-6">
          <div class="tile">
            <div class="tile-body">
              <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" name="form1" enctype="multipart/form-data">
				<div class="form-group">
                  <label class="control-label">��{�W��:</label>
                  <input type="TEXT" name="pacname" size="45" 
			 		value="<%= (pacVO==null)? "  �n�h�W�r" : pacVO.getPacname()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">�޲z���s��:   <%= pacVO.getEmpno()%></label>
                 
                  <input type="hidden" name="empno" size="45"
					 value="<%= pacVO.getEmpno()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">�ȹC��a:</label>
                  <input type="TEXT" name="paccountry" size="45"
						 value="<%= (pacVO==null)? "��a" : pacVO.getPaccountry()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">�ȹC����:</label>
                  <input type="TEXT" name="paccity" size="45"
						 value="<%= (pacVO==null)?"����" : pacVO.getPaccity()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">�ȹC�Ѽ�:</label>
				  <input type="TEXT" name="pactotalday" size="45"
			 			 value="<%= (pacVO==null)? "6" : pacVO.getPactotalday()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">�ζO����:</label>
				  <input type="TEXT" name="pacprice" size="45"
			 			 value="<%= (pacVO==null)? "88000" : pacVO.getPacprice()%>" />
			   </div>
			   
			    <div class="form-group">
                  <label class="control-label">�wú�q��:</label>
				  <input type="TEXT" name="pacdeposit" size="45"
			 			 value="<%= (pacVO==null)? "6666" : pacVO.getPacdeposit()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">�S�����:</label>
				  <input type="TEXT" name="pacdiv" size="45"
			 			 value="<%= (pacVO==null)? "�S�����" : pacVO.getPacdiv()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">��{���e:</label>
                  <TEXTAREA name="paccontent" rows="10" cols="80">${pacVO.paccontent}</textarea>
                  <script>
					CKEDITOR.replace( 'paccontent' );
				  </script>
                </div>
               <div class="form-group row">
                  <label class="control-label col-md-3">��{�S���1</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar1" size="45"
						 value="<%= (pacVO==null)?"�п�ܹϤ�": pacVO.getPactchar1()%>" id="photo"/>
						 <img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacVO.getPactchar1()"  width="100" height="100">
                  </div>
               </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">��{�S���2</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar2" size="45"
						 value="<%= (pacVO==null)?"�п�ܹϤ�": pacVO.getPactchar2()%>" id="photo"/>
						 <img id="preview" src="<%=request.getContextPath()%>/DBGifReader?pacVO.getPactchar2()"  width="100" height="100">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label">�`�N�ƶ�:</label>
                  <textarea name="pacremark" class="form-control" rows="4" placeholder="ckEdit"><%=(pacVO==null)?"�`�N�ƶ�": pacVO.getPacremark()%></textarea>
                </div>
                <div class="form-group">
                  <div class="form-check">
                    <label class="form-check-label">
                 	    ��{���p:<select name="pacstatus">
								<option value=0>�i�X��
								<option value=1>���A�X��
					 		</select> 
                    </label>
                  </div>
                </div>
     </table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="pacno" value="<%=pacVO.getPacno()%>">
<input type="hidden" name="empno" value="<%=pacVO.getEmpno()%>">
<input type="submit" value="�e�X�ק�"></FORM>

<!-- <input type="hidden" name="action" value="updateX"> -->
<%-- <input type="hidden" name="pacno" value="<%=pacVO.getPacno()%>"> --%>
<%-- <input type="hidden" name="empno" value="<%=pacVO.getEmpno()%>"> --%>
<%-- <input type="hidden" name="requestURL" value="<%=requestURL%>"> --%>
<!-- <input type="submit" value="�睊�e�X�ק�"></FORM> -->
  </main>
</body>

</html>