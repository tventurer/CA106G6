<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tod.model.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>checkOrderTod</title>
  </head>
  <body class="app sidebar-mini rtl">
  
  <jsp:include page="/backend/backbar.jsp"/>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> 顯示購買明細</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="tile">
            <div><h3 class="tile-title">${todVO.todno}購買明細</h3></div>
            
            <c:if test="${not empty errorMsg}">
            	<font style="color:red">請修正以下錯誤:  ${errorMsgs.error}</font>
            </c:if>
            
<%
	TodVO todVO = (TodVO)request.getAttribute("todVO");
	if(todVO != null){   //沒寫NullpointerException
		String todpurchase = todVO.getTodpurchase();  //name=故宮門票price=200name=台北101門票price=500name=悠遊卡3日車票price=300
		System.out.println("todpurchase:" + todpurchase);
		Map<String,String> pdt = new LinkedHashMap<String,String>();
		if(todpurchase != null){
			String[] strs = todpurchase.split("name");
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
            
            
            <table class="table table-hover">
              <thead>
                <tr>
                  <th></th>
                  <th>商品名稱</th>
                  <th>價格</th>
                </tr>
              </thead>
              <tbody>
              
          		<c:forEach var="keys" items="${pdt.keySet()}" varStatus="s">
              
                <tr>
                  <td>${s.count}</td>
	              <td>${keys}</td>
	              <td class="amount">${pdt.get(keys)}</td>
                </tr>
                
                </c:forEach>
              
              </tbody>
            </table>
            <hr>
            
            <div class="row justify-content-end">
    			<div class="col-3">
    				<h3><b>total:$<span id="dollar">0</span></b></h3>
    			</div>
    		</div>
            
          </div>
        </div>
      </div>
    </main>

  </body>
  
  <script>
  var amount = $('.amount');
  var total = 0;
  debugger
  for(var i=0; i<amount.length; i++){
	  total = total + parseInt(amount[i].innerText);
	  debugger
  }
  $('#dollar').text(total);
  </script>
</html>