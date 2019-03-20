<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pur.model.*"%>

<%
  PurVO purVO = (PurVO) request.getAttribute("purVO"); //PurServlet.java (Concroller) 存入req的purVO物件 (包括幫忙取出的purVO, 也包括輸入資料錯誤時的purVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>代購商品資料修改 - update_pur_input.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<style>
input[type="file"] {
    position: fixed;
    right: 100%;
    bottom: 100%;
}
.custom-file-upload {
    border: 1px solid #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
}
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
		 <h3>代購商品資料修改 - update_pur_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/catimage.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="pur" name="form1"  enctype="multipart/form-data">
<table>
	<tr>
		<td>代購商品編號:<font color=red><b>*</b></font></td>
		<td><%=purVO.getPurid()%></td>
	</tr>
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td><%=purVO.getMemno()%></td>
	</tr>
	<tr>
		<td>代購商品名稱:</td>
		<td><input type="TEXT" name="purname" size="45" value="<%=purVO.getPurname()%>" /></td>
	</tr>
	<tr>
		<td>商品描述:</td>
		<td><textarea name="purcontent" id="purcontent" rows="4" cols="42"><%=purVO.getPurcontent()%></textarea></td>
	</tr>
<tr>
		<td>商品類別:</td>
		<td><select size="1" name="pursort">
		<%String pursort[]={"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
		for(int i = 0; i<pursort.length; i++){
			if(purVO.getPursort()==i){
				out.print("<option value='" + i + "' selected='selected' >"+ pursort[i]+ "</option>");
			}else{
				out.print("<option value='" + i + "'>"+ pursort[i]+ "</option>");
			}
		}%>
		</select></td>
	</tr>
	<tr>
		<td>參考網址:</td>
		<td><input type="TEXT" name="pururl" size="45" row="2"
			 value="<%=purVO.getPururl()%>" /></td>
	</tr>
	<tr>
		<td>購買國家:</td>
		<td><input type="TEXT" name="purcountry" size="45"
			 value="<%=purVO.getPurcountry()%>" /></td>
	</tr>
	<tr>
		<td>收貨國家:</td>
		<td><input type="TEXT" name="purdelivery" size="45"
			 value="<%=purVO.getPurdelivery()%>" /></td>
	</tr>
	<tr>
	<tr>
		<td>參考售價:</td>
		<td><input type="TEXT" name="purreprice" size="45"
			 value="<%=purVO.getPurreprice()%>" /></td>
	</tr>
	<tr>
		<td>訂單定價:</td>
		<td><input type="TEXT" name="purpricing" size="45"
			 value="<%=purVO.getPurpricing()%>" /></td>
	</tr>
	<tr>
		<td>下架時間:</td>
		<td><input name="purobtained" id="f_date1" type="text"></td>
	</tr>
	
	<tr>
		<td>提供收據:</td>
		<td>
		<%String purreceipt[]={"不提供","提供"};
		for(int i = 0; i <purreceipt.length; i++){
			if(purVO.getPurreceipt()==i){
				out.print("<input type='radio' name='purreceipt' value='" + i + "'checked>"+ purreceipt[i]);
			}else{
				out.print("<input type='radio' name='purreceipt' value='" + i + "'>"+ purreceipt[i]);
			}
		}%>
		</td>
	</tr>
	
	<tr>
		<td>代購狀態:</td>
		<td>
		<%String purstatus[]={"未上架","上架中","已下架","檢舉下架"};
		for(int i = 0; i <purstatus.length; i++){
			if(purVO.getPurstatus()==i){
				out.print("<input type='radio' name='purstatus' value='" + i + "' checked>"+ purstatus[i]);
			}else{
				out.print("<input type='radio' name='purstatus' value='" + i + "'>"+ purstatus[i]);
			}
		}%>
		</td>
	</tr>
	<tr>
		<td>商品圖片:</td>
		<td>
		<label for="purpic" class="custom-file-upload">
        <i class="fa fa-cloud-upload"></i> 更換圖片
 		</label>
		<input id="purpic" name="purpic" type="file" value="<%=purVO.getPurpic()%>"/>
		<img id="purpicimg" src="<%=request.getContextPath()%>/frontend/pur/pur?purid=${purVO.purid}" width="100px">
		</td>
	</tr>
	<tr>
		<td>預計出貨時間:</td>
		<td><input name="purextime" id="f_date2" type="text"></td>
	</tr>
	<tr>
		<td>商品數量:</td>
		<td><input type="TEXT" name="purstock" size="45"
			 value="<%=purVO.getPurstock()%>" /></td>
	</tr>
	<tr>
	<tr>
		<td>評價限制:</td>
		<td><select size="1" name="purlimit">
		<%
		for(int i = 1; i < 11; i++){
			if(purVO.getPurlimit()==i){
				out.print("<option value='" + i + "' selected='selected'>"+i+"</option>");
			}else{
				out.print("<option value='" + i + "'>"+i+"</option>");
			}
		}
		%>
		</select></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="purid" value="<%=purVO.getPurid()%>">
<input type="hidden" name="memno" value="<%=purVO.getMemno()%>">
<input type="submit" value="送出修改"></FORM>
</body>
<% 
  java.sql.Timestamp purobtained = null;
  try {
	  purobtained = purVO.getPurobtained();
   } catch (Exception e) {
	   purobtained = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>

<% 
   java.sql.Timestamp purextime = null;
  try {
	   purextime = purVO.getPurextime();
   } catch (Exception e) {
	   purextime = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
<script>

$("#purpic").change(function(){

  readURL(this);

});



function readURL(input){
	
  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {
    	
       $("#purpicimg").attr('src', e.target.result);
       
    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({//下架時間
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=purobtained%>' 
		   // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
        $('#f_date2').datetimepicker({//預計出貨時間
 	       theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 	       value: '<%=purextime%>'  
 	       // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
            //startDate:	            '2017/07/10',  // 起始日
            //minDate:               '-1970-01-01', // 去除今日(不含)之前
            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
         });
        
        </script>
</html>