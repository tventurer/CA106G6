<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.acr.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    List<AcrVO> list =  (List) request.getAttribute("acrVO");
    pageContext.setAttribute("list",list);

%>
<c:forEach var="acrVO" items="${list}" >
<c:set var="memid" scope="page" value="${acrVO.memno}" />
<%
String memid = (String) pageContext.getAttribute("memid");
MemService memSvc = new MemService();
MemVO memVO = memSvc.getOneMem(memid);
String memmail = memVO.getMememail();
pageContext.setAttribute("memmail",memmail);

%>
</c:forEach>
              <h4>會員：${memmail}</h4>
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
				    <th>交易編號</th>
					<th>交易金額</th>
					<th>轉入/轉出</th>
					<th>交易時間</th>
					<th>匯款目的地</th>
					<th>餘額</th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach var="acrVO" items="${list}" >
                  <tr>
                    <td>${acrVO.acrid}</td>
					<td>${acrVO.acrprice < 0 ? 0-acrVO.acrprice : acrVO.acrprice}</td>
					<td>${acrVO.acrsource eq 0?"轉出":"轉入"}</td>
					<td><fmt:formatDate value="${acrVO.acrtime}"  timeStyle="short" type="both"/></td>
					<td>${acrVO.acrend}</td>
					<td>${acrVO.acrtotal}</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>