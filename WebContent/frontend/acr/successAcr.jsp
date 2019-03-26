<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.acr.model.*"%>
<%@ page import="java.util.*"%>

<%
String memno=(String)session.getAttribute("memno");
pageContext.setAttribute("memno",memno);

String acrprice = request.getParameter("acrprice");

AcrService acrSvc = new AcrService();
List<AcrVO> Acrlist = acrSvc.getMemAll(memno);
pageContext.setAttribute("Acrlist",Acrlist);
%>

<!-------------------------------- 引入標頭 ------------------------------------->

<jsp:include page="/frontend/navbar.jsp" />


<style>
.btn.btn-a, .btn.btn-b {
    padding: 1rem 3rem;
    letter-spacing: 0;
    }
 .btn{
     font-weight: 600;
     white-space: normal;
 }
</style>

  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">代幣儲值成功</h1>
           <br>
		   <span class="color-text-a">完成一筆<%=acrprice%>的儲值</span><br>
            
         <c:forEach var="myacr" items="${Acrlist}" varStatus="s">
		 <c:choose>
		 <c:when test="${s.last}">
		 <span class="color-text-a">您目前的儲值總額為：${myacr.acrtotal}</span><br>
		 </c:when>
		 </c:choose>
		 </c:forEach>
            
            <span class="color-text-a">期待您的下次光臨</span><br><br>
             <span class="color-text-a"><a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">返回代購商品繼續購物</a></span>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Agents Grid Star /-->
  <section class="agents-grid grid">
    <div class="container">
      <div class="row">
      <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
      
      </div>
    </div>
  </section>
  <!--/ Agents Grid End /-->

<jsp:include page="/frontend/footer.jsp" />
  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>


</body>
</html>

