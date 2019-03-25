<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/datetimepicker/jquery.datetimepicker.css" />
<title>新增自由行訂單</title>
    
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
width:  300px;
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
height: 151px;
}
b {
color: red;	
}
</style>
    
  </head>
  <body class="app sidebar-mini rtl">
   
   <jsp:include page="/backend/backbar.jsp"/>
   
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 新增自由行訂單</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        
        
         <div class="col-md-6">
          <div class="tile">
            <div><h3 class="tile-title">行程明細</h3></div>
            
            <c:if test="${not empty errorMsg}">
            	<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
            </c:if>
            
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>天數</th>
                  <th>順序</th>
                  <th>景點名稱</th>
                  <th>起始時間</th>
                  <th>終止時間</th>
                </tr>
              </thead>
              <tbody>
              	<jsp:useBean id="tdeSvc" class="com.tde.model.TdeService"/>
              	<jsp:useBean id="spoSvc" class="com.spo.model.SpoService"/>
          		<c:forEach var="tdeList" items="${tdeSvc.getAllByTri(param.trino)}" varStatus="s">
              
                <tr>
                  <td>第${tdeList.tdedate.substring(1,2)}天</td>
	              <td>${tdeList.tdeseq}</td>
	              <td>${spoSvc.getOneSpo(tdeList.spono).sponame}</td>
	              <td>
	              <fmt:formatDate type="both" value="${tdeList.tdestart}" pattern="yyyy-MM-dd HH:mm" />
	              </td>
	              <td>
	              <fmt:formatDate type="both" value="${tdeList.tdefinish}" pattern="yyyy-MM-dd HH:mm" />
	              </td>
                </tr>
                
                </c:forEach>
              
              </tbody>
            </table>
            
          </div>
        </div>
        
        
        
        <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">自由行訂單</h3>
            <div class="tile-body">
              <form id="form" method="post" name="form" action="tod">

				<c:if test="${not empty errorMsgs.error}">
					<font style="color:'red'">請修正以下錯誤:  ${errorMsgs.error}</font>
				</c:if>
				
				
		          <div class="tile">
		            <div class="tile-title-w-btn">
		              <div class="title">
		              	<label class="control-label">商品名稱</label>
		              	<input class="form-control" type="text" name="pdtName" placeholder="Enter product name" value="${param.pdtName}">  <b>${errorMsgs.pdtName}</b>
		              </div>
		              <div class="btn btn-primary icon-btn addPdt"><i class="fa fa-plus"></i></div>
		            </div>
		            <div class="tile-title-w-btn">
			           <div class="tile-body">
			            <label class="control-label">商品金額</label>
			            <input class="form-control" type="number" name="pdtPrice" placeholder="Enter product price" value="${param.pdtPrice}" min="0">  <b>${errorMsgs.pdtPrice}</b>
			           </div>
		            </div>
		          </div>

		          <div class="tile" id="clone" style="display:none">
		            <div class="tile-title-w-btn">
		              <div class="title">
		              	<label class="control-label">商品名稱</label>
		              	<input class="form-control" type="text" name="pdtName" placeholder="Enter product name">
		              </div>
		              <div class="btn-group">
		              	<div class="btn btn-primary icon-btn addPdt"><i class="fa fa-plus"></i></div>
		                <div class="btn btn-primary icon-btn delPdt"><i class="fa fa-trash"></i></div>
		               </div>
		            </div>
		            <div class="tile-title-w-btn">
			           <div class="tile-body">
			            <label class="control-label">商品金額</label>
			            <input class="form-control" type="number" name="pdtPrice" placeholder="Enter product price" min="0">
			           </div>
		            </div>
		          </div>
		        
				
				<div id="endpoint"></div>

                <div class="form-group">
                  <label class="control-label">訂單截止日</label>
                  <input class="form-control" id="todddl" type="text" name="todddl" value="${param.todddl}" placeholder="Enter deadline">  <b>${errorMsgs.todddl}</b>
                </div>
            </div>
            <div class="tile-footer">
              <input type="hidden" name="come" value="${param.come}">
              <input type="hidden" name="memno" value="${param.memno}">
              <input type="hidden" name="trino" value="${param.trino}">
              <input type="hidden" name="whichPage" value="${param.whichPage}">
              <input type="hidden" name="action" value="insert">
              <a class="btn btn-primary" href="javascript:document.form.submit()"><i class="fa fa-fw fa-lg fa-check-circle"></i>送出</a>
<!--               &nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="javascript:history.back(-1)"><i class="fa fa-fw fa-lg fa-times-circle"></i>取消</a> -->
            </form>
            </div>
          </div>
        </div>

       </div>
        
    </main>

	<script type="text/javascript">
		
		$("#form").on("click", ".addPdt", function(){
			var newPdt = $("#clone").clone();
  			newPdt.attr("style", "display:''");
			$("#endpoint").before(newPdt);
		});

		$("#form").on("click", ".delPdt", function(){
			debugger
			$(this).closest(".tile").remove();
		});

		
	</script>

  </body>
<script src="<%= request.getContextPath() %>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#todddl').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
		   minDate: '-1970-01-01'			    
	   })
	  },
	  timepicker:false
	 });
});
</script>
</html>