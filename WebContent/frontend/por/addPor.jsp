<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.por.model.*"%>


<%
  PorVO porVO = (PorVO) request.getAttribute("porVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script language=javascript>
    var purpric,a,total;
 //送出選擇的PURID
      function updateData(v)
      {
    	var value=v.options[v.selectedIndex].value;
        $("#purname").empty(); //把'數字' 清空
        $("#purcontent").empty();
        $("#purpricing").empty();
        $("#porsum").empty();
        
        if (value!="") //真的選了選項才丟去server side
        {
          jQuery.post("showPur.jsp","type="+value,updateNumber);
        }
      }
      function updateNumber(data)
      {
        var numberData=jQuery.trim(data).split("\n");//用 \n 來做分資料分割
        for (i=0;i<numberData.length;i++)
        {
        	
          tdid=numberData[i].split("-")[0];//用 - 來做分資料分割取出id
          tdtext=numberData[i].split("-")[1];//用 - 來做分資料分割取出td顯示內容
          if($.trim(tdid)==$.trim("porsum")){
        	  if(tdtext==0){
        		  $("#"+tdid).append("<option value='"+tdtext+"'>無存貨</option>");
        	  }else{
        		  for(a=1;a<=tdtext;a++){
            		  $("#"+tdid).append("<option value='"+a+"'>"+a+"</option>");
            	  }
        	  }
          }else{
           document.getElementById(tdid).innerHTML=tdtext;
          }
        }//for (i=0;i<numberData.length;i++)
        	//偵測數量並計算價格
  		    purpric=$("#purpricing").text();
  		    a=$("#porsum").val();
  		    total=purpric*a;
  		    $("#showprice").html(total);
  		    $("#porprice").val(total);
      }
    //偵測使用者選擇的數量並計算價格
      $(document).ready(function(){
    	  $("#porsum").change(function(){
    		  purpric=$("#purpricing").text();
      		  a=$("#porsum").val();
      		  total=purpric*a;
      		$("#showprice").html(total);
      		$("#porprice").val(total);
    	  });
    	});
      
    </script>
<title>代購商品訂單新增 - addPor.jsp</title>
<style>
  table#table-1 {
	background-color: #8B9BAB;
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
  #title-1{
  color:white;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>代購商品訂單新增 - addPor.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/icondo.jpg" width="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="por" name="form1">
<table>
	<tr>
		<td>買家會員編號:</td>
		<td><input type="TEXT" name="memno" size="45" 
			 value="<%= (porVO==null)? "MEM000001" : porVO.getMemno()%>" /></td>
	</tr>
	
 <jsp:useBean id="purSvc" scope="page" class="com.pur.model.PurService"/>
	<tr>
		<td>代購商品編號:</td>
		<td>
	   <select size="1" name="purid" onchange="updateData(this)">
	   <option value="">請選擇</option>
         <c:forEach var="purVO" items="${purSvc.all}" > 
          <option value="${purVO.purid}">${purVO.purid}
         </c:forEach>   
       </select>
	</tr>
	<tr>
		<td>商品名稱:</td>
		<td id="purname"></td>
	</tr>
	<tr>
		<td>商品描述:</td>	
		<td id="purcontent"></td>
	</tr>
	<tr>
		<td>商品單價:</td>
		<td id="purpricing"></td>
	</tr>
	<tr>
		<td>商品數量:</td>
		<td><select size="1" name="porsum" id="porsum">
       </select>
		</td>
	</tr>
	<tr>
		<td>商品總價:</td>
		<td id="showprice"></td>
	</tr>
	<tr>
		<td>收貨地址:</td>
		<td><input type="TEXT" name="poraddress" size="45"
			 value="<%= (porVO==null)? "臺灣" : porVO.getPoraddress()%>" /></td>
	</tr>
	<tr>
	<tr>
		<td>連絡電話:</td>
		<td><input type="TEXT" name="portel" size="45"
			 value="<%= (porVO==null)? "0970685214" : porVO.getPortel()%>" /></td>
	</tr>
	
</table>
<br>
<input type="hidden" name="porprice" id="porprice" value="0">
<input type="hidden" name="porstatus" value="0">
<input type="hidden" name="porlogistics" value="0">
<input type="submit" value="送出新增"></FORM>
</body>
</html>