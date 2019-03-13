<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pur.model.*"%>

<%
  PurVO purVO = (PurVO) request.getAttribute("purVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>代購商品新增 - addPur.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
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
		 <h3>代購商品新增 - addPur.jsp</h3></td><td>
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

<FORM METHOD="post" ACTION="pur" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>賣家會員編號:</td>
		<td><input type="TEXT" name="memno" size="45" 
			 value="<%= (purVO==null)? "MEM000002" : purVO.getMemno()%>" /></td>
	</tr>
	<tr>
		<td>代購商品名稱:</td>
		<td><input type="TEXT" name="purname" size="45"
			 value="<%= (purVO==null)? "亞太限定樂高" : purVO.getPurname()%>" /></td>
	</tr>
	<tr>
		<td>商品描述:</td>
		<td><textarea name="purcontent" id="purcontent" rows="4" cols="42"><%= (purVO==null)? "僅限中國和部分亞太國家限定發售的合組「LEGO 80102 舞龍」(Dragon Dance)日本太回火熱搶購中" : purVO.getPurcontent()%></textarea></td>
	</tr>
	<tr>
		<td>商品類別:</td>
		<td><select size="1" name="pursort">
		<%String pursort[]={"生活居家","生活休閒","國際菸草","各國酒類","玩具遊戲","毛小孩專屬","經典品牌","行家收藏","運動用品","美妝保養"};
		for(int i = 0; i<pursort.length; i++){
				out.print("<option value='" + i + "'>"+ pursort[i]+ "</option>");
		}%>
		</select></td>
	</tr>
	<tr>
		<td>參考網址:</td>
		<td><input type="TEXT" name="pururl" size="45" value="<%= (purVO==null)? "https://api.dropbuy.global/deeplink/recommendationdetail/8189" : purVO.getPururl()%>" /></td>
	</tr>
	<tr>
		<td>購買國家:</td>
		<td><input type="TEXT" name="purcountry" size="45"
			 value="<%= (purVO==null)? "日本" : purVO.getPurcountry()%>" /></td>
	</tr>
	<tr>
		<td>收貨國家:</td>
		<td><input type="TEXT" name="purdelivery" size="45"
			 value="<%= (purVO==null)? "臺灣" : purVO.getPurdelivery()%>" /></td>
	</tr>
	<tr>
	<tr>
		<td>參考售價:</td>
		<td><input type="TEXT" name="purreprice" size="45"
			 value="<%= (purVO==null)? "2885" : purVO.getPurreprice()%>" /></td>
	</tr>
	<tr>
		<td>訂單定價:</td>
		<td><input type="TEXT" name="purpricing" size="45"
			 value="<%= (purVO==null)? "3000" : purVO.getPurpricing()%>" /></td>
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
			if(i==0){
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
			if(i==0){
				out.print("<input type='radio' name='purstatus' value='" + i + "' checked>"+ purstatus[i]);
			}else{
				out.print("<input type='radio' name='purstatus' value='" + i + "'>"+ purstatus[i]);
			}
		}%>
		</td>
	</tr>
	<tr>
		<td>商品圖片:</td>
		<td><input type="file" name="purpic" id="purpic" size="45"
			 value="<%= (purVO==null)? "" : purVO.getPurpic()%>" />
			 <img id="purpicimg" src="#"  width="100px"  height="100px"  style="display:none" />
		</td>
	</tr>
	<tr>
		<td>預計出貨時間:</td>
		<td><input name="purextime" id="f_date2" type="text"></td>
	</tr>
	<tr>
		<td>商品數量:</td>
		<td><input type="TEXT" name="purstock" size="45"
			 value="<%= (purVO==null)? "1" : purVO.getPurstock()%>" /></td>
	</tr>
	<tr>
	<tr>
		<td>評價限制:</td>
		<td><select size="1" name="purlimit">
		<%
		for(int i = 1; i < 11; i++){
			out.print("<option value='" + i + "'>"+i+ "</option>");
		}
		%>
		</select></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
       $("#purpicimg").removeAttr("style");
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
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>