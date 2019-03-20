<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.tod.model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
    <title>修改自由行訂單</title>
    
    <style>
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
          <h1><i class="fa fa-edit"></i> 修改自由行訂單</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-7">
          <div class="tile">
            <h3 class="tile-title">自由行訂單</h3>
            <div class="tile-body">
              <form id="form" method="post" name="form" action="tod">

				<c:if test="${not empty errorMsgs.error}">
					<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
				</c:if>
				
				
				<%
					if(((LinkedHashMap<String,String>)request.getAttribute("errorMsgs")).isEmpty()){
						TodVO todVO = (TodVO)request.getAttribute("todVO");
						String todremark = todVO.getTodremark();  //name=故宮門票price=200name=台北101門票price=500name=悠遊卡3日車票price=300
						System.out.println("todremark:" + todremark);
						Map<String,String> pdt = new LinkedHashMap<String,String>();
						if(todremark != null){
							String[] strs = todremark.split("name");
							for(int i = 0; i < strs.length; i++){
								if(i != 0){
									String[] strs2 = strs[i].split("price");
									pdt.put(strs2[0].substring(1, strs2[0].length()), strs2[1].substring(1, strs2[1].length()));
									System.out.println(pdt);
								}
							}
						}
						pageContext.setAttribute("pdt", pdt);
					}
				%>
				
				<c:if test="${not empty pdt}">
				<c:forEach var="keys" items="${pdt.keySet()}" varStatus="s">
				
		          <div class="tile">
		            <div class="tile-title-w-btn">
		              <div class="title">
		              	<label class="control-label">商品名稱</label>
		              	<input class="form-control" type="text" name="pdtName" placeholder="Enter product name" value="${keys}">  <b>${errorMsgs.pdtName}</b>
		              </div>
		              
		              <c:if test="${s.index == 0}">
		              	<div class="btn btn-primary icon-btn addPdt"><i class="fa fa-plus"></i></div>
		              </c:if>
		              <c:if test="${s.index != 0}">
		              	<div class="btn-group">
		              	<div class="btn btn-primary icon-btn addPdt"><i class="fa fa-plus"></i></div>
		                <div class="btn btn-primary icon-btn delPdt"><i class="fa fa-trash"></i></div>
		               </div>
		              </c:if>
		              
		            
		            </div>
		            <div class="tile-title-w-btn">
			           <div class="tile-body">
			            <label class="control-label">商品金額</label>
			            <input class="form-control" type="number" name="pdtPrice" placeholder="Enter product price" value="${pdt.get(keys)}">  <b>${errorMsgs.pdtPrice}</b>
			           </div>
		            </div>
		          </div>
		          
		          </c:forEach>
				  </c:if>
				  
				<c:if test="${empty pdt}">
				<c:forEach var="pdtName" items="${paramValues.pdtName}" varStatus="s">
				<c:set var="length" value="${fn:length(paramValues.pdtName)}"/> 
				<c:if test="${s.index != (length-1)}">
				
		          <div class="tile">
		            <div class="tile-title-w-btn">
		              <div class="title">
		              	<label class="control-label">商品名稱</label>
		              	<input class="form-control" type="text" name="pdtName" placeholder="Enter product name" value="${pdtName}">
		              </div>
		              
		              <c:if test="${s.index == 0}">
		              	<div class="btn btn-primary icon-btn addPdt"><i class="fa fa-plus"></i></div>
		              </c:if>
		              <c:if test="${s.index != 0}">
		              	<div class="btn-group">
		              	<div class="btn btn-primary icon-btn addPdt"><i class="fa fa-plus"></i></div>
		                <div class="btn btn-primary icon-btn delPdt"><i class="fa fa-trash"></i></div>
		               </div>
		              </c:if>
		              
		            
		            </div>
		            <div class="tile-title-w-btn">
			           <div class="tile-body">
			            <label class="control-label">商品金額</label>
			            <input class="form-control" type="number" name="pdtPrice" placeholder="Enter product price" value="${paramValues.pdtPrice[s.index]}">
			           </div>
		            </div>
		          </div>
		          
		          </c:if>
		          </c:forEach>
				  </c:if>
				  
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
			            <input class="form-control" type="number" name="pdtPrice" placeholder="Enter product price">
			           </div>
		            </div>
		          </div>
		        
				
				<div id="endpoint"></div>

                <div class="form-group">
                  <label class="control-label">訂單總報價</label>
                  <input class="form-control" type="number" name="todquo" value="${todVO.todquo}" placeholder="Enter total price"> <b>${errorMsgs.todquo}</b>
                </div>
                <div class="form-group">
                  <label class="control-label">訂單截止日</label>
                  <input class="form-control" type="text" name="todddl" value="${todVO.todddl}" placeholder="Enter deadline">  <b>${errorMsgs.todddl}</b>
                </div>
                <div class="form-group">
                    <label for="exampleSelect">訂單狀態</label>
                    <select class="form-control" id="exampleSelect" name="todstat">
                    	<option value="0" ${todVO.todstat == 0?"selected":""}>待付款</option>
	              		<option value="1" ${todVO.todstat == 1?"selected":""}>已付款待出貨</option>
	              		<option value="2" ${todVO.todstat == 2?"selected":""}>已出貨</option>
	              		<option value="3" ${todVO.todstat == 3?"selected":""}>取消訂單</option>
	              		<option value="4" ${todVO.todstat == 4?"selected":""}>逾期未付款</option>
	              		<option value="5" ${todVO.todstat == 5?"selected":""}>待退款</option>
	              		<option value="6" ${todVO.todstat == 6?"selected":""}>已退款</option>
                    </select>
                  </div>
            <div class="tile-footer">
              <input type="hidden" name="reqURL" value="${reqURL}">
              <input type="hidden" name="whichPage" value="${whichPage}">
              <input type="hidden" name="todno" value="${todVO.todno}">
              <input type="hidden" name="action" value="update">
              <a class="btn btn-primary" href="javascript:document.form.submit()"><i class="fa fa-fw fa-lg fa-check-circle"></i>送出</a>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="javascript:history.back(-1)"><i class="fa fa-fw fa-lg fa-times-circle"></i>取消</a>
            </div>
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
</html>