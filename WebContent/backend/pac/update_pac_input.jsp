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
      <div class="row justify-content-center">
        <div class="col-md-8" >
          <div class="tile">
            <div class="tile-body">
              <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pac/pac" name="form1" enctype="multipart/form-data">
				<div class="form-group">
                  <label class="control-label">��{�W��:</label>
                  <input type="TEXT" class="form-control form-control-lg" name="pacname" size="45" 
			 		value="<%= (pacVO==null)? "  �n�h�W�r" : pacVO.getPacname()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label"><h3>�޲z���s��:<%= pacVO.getEmpno()%></h3></label>
                 
                  <input "form-control form-control-lg" type="hidden" name="empno" size="45"
					 value="<%= pacVO.getEmpno()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">�ȹC��a:</label>
                  <input type="TEXT" class="form-control form-control-lg" name="paccountry" size="45"
						 value="<%= (pacVO==null)? "��a" : pacVO.getPaccountry()%>" />
                </div>
                <div class="form-group">
                  <label class="control-label">�ȹC����:</label>
                  <input class="form-control form-control-lg" type="TEXT" name="paccity" size="45"
						 value="<%= (pacVO==null)?"����" : pacVO.getPaccity()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">�ȹC�Ѽ�:</label>
				  <input class="form-control form-control-lg" type="TEXT" name="pactotalday" size="45"
			 			 value="<%= (pacVO==null)? "6" : pacVO.getPactotalday()%>" />
			   </div>
                <div class="form-group">
                  <label class="control-label">�ζO����:</label>
				  <input class="form-control form-control-lg" type="TEXT" name="pacprice" size="45"
			 			 value="<%= (pacVO==null)? "88000" : pacVO.getPacprice()%>" />
			   </div>
			   
			    <div class="form-group">
                  <label class="control-label">�wú�q��:</label>
				  <input class="form-control form-control-lg" type="TEXT" name="pacdeposit" size="45"
			 			 value="<%= (pacVO==null)? "6666" : pacVO.getPacdeposit()%>" />
			   </div>
			   <div class="form-group">
                  <label class="control-label">�S�����:</label>
				  <input class="form-control form-control-lg" type="TEXT" name="pacdiv" size="45"
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
                    <input type="file" name="pactchar1" id="pactchar1" size="45"
			 value="<%= (pacVO==null)? "" : pacVO.getPactchar1()%>"/>
						 <img id="preview1" src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=1"  alt="" width="100" height="auto">
                  </div>
               </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">��{�S���2</label>
                  <div class="col-md-8">
                    <input type="file" name="pactchar2" id="pactchar2" size="45"
						 value="<%= (pacVO==null)?"�п�ܹϤ�": pacVO.getPactchar2()%>"/>
						 <img id="preview2" src="<%=request.getContextPath()%>/DBGifReader?pacno=${pacVO.pacno}&photo=2"  alt=""  width="100" height="auto">
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="control-label">�`�N�ƶ�:</label>
                  <TEXTAREA name="pacremark" rows="10" cols="80"><%=(pacVO==null)?"�`�N�ƶ�": pacVO.getPacremark()%></textarea>
                  <script>
					CKEDITOR.replace( 'pacremark' );
				  </script>
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
  <script>

$("#pactchar1").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#preview1").attr('src', e.target.result);
       $("#preview1").removeAttr("style");
    }

    reader.readAsDataURL(input.files[0]);

  }

}


$("#pactchar2").change(function(){

	readURL2(this);

	});
	
function readURL2(input){
	
	  if(input.files && input.files[0]){

	    var reader = new FileReader();

	    reader.onload = function (e) {
	    	
	       $("#preview2").attr('src', e.target.result);
	       $("#preview2").removeAttr("style");
	    }

	    reader.readAsDataURL(input.files[0]);

	  }

	}



</script>
</body>

</html>