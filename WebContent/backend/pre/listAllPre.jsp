<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pre.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.pur.model.*"%>
<%
PreService preSvc = new PreService();
List<PreVO> list = preSvc.getAll();
pageContext.setAttribute("list",list);

String[] prelabel = {"賣場描述或圖片中含有不當內容","詐騙","賣場販售仿冒品","導向此平台已外交易","其他"};
pageContext.setAttribute("prelabel",prelabel);

%>

<!DOCTYPE html>
<html lang="zh-TW">
  <head>
<!-- 引入標頭 -->
  </head>
  <body class="app sidebar-mini rtl">
<jsp:include page="/backend/backbar.jsp"/>
 
    
    <!-- 管理頁面主要顯示的部分 -->
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;代購商品檢舉審核</h1>
          <p>代購商品檢舉，管理員可在此處審核</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">

          <div class="tile">	
            <div class="tile-body">
        <div class="col-sm-12 ">
        <div id="sampleTable_filter" class="dataTables_filter">
        <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
				    <th>檢舉編號</th>
					<th>檢舉人</th>
					<th>檢舉商品</th>
					<th>檢舉標籤</th>
					<th>檢舉原因</th>
					<th>檢舉日期</th>
					<th>檢舉狀態</th>
					<th>審核檢舉</th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach var="preVO" items="${list}" >
                  <tr>
                    <td>${preVO.preid}</td>
                    
                    <c:set var="prememno" scope="page" value="${preVO.memno}" />
                    <%
						String prememno = (String) pageContext.getAttribute("prememno");
						MemService memSvc = new MemService();
						MemVO memVO = memSvc.getOneMem(prememno);
						String memmail = memVO.getMememail();
						pageContext.setAttribute("memmail",memmail);
					%>
					<td>${memmail}</td>
					
					<c:set var="prepurid" scope="page" value="${preVO.purid}" />
					<%
						String prepurid = (String) pageContext.getAttribute("prepurid");
						PurService purSvc = new PurService();
						PurVO purVO = purSvc.findByPrimaryKey(prepurid);
						String purname = purVO.getPurname();
						pageContext.setAttribute("purname",purname);
						pageContext.setAttribute("purid",prepurid);
					%>
					<td><a href="<%=request.getContextPath()%>/frontend/pur/purListOne.jsp?purid=${purid}">${purname}</a></td>
					
					<c:forEach var="myprelabel" items="${prelabel}" varStatus="s">
					<c:choose>
					<c:when test="${preVO.prelabel == s.index}">
					<td>${myprelabel}</td>
					</c:when>
					</c:choose>
					</c:forEach>
					
					<td>${preVO.precause}</td>
					<td><fmt:formatDate value="${preVO.pretime}"  timeStyle="short" type="both"/></td>
					<td>${preVO.prestatus eq 0?"未處理":"已處理"}</td>
					<td>
						<c:if test="${preVO.prestatus == 0 }">
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/pre/pre" style="margin-bottom: 0px;">
					        <input type="hidden" name="action" value="up_preresult">
					        <input type="hidden" name="preid" value="${preVO.preid}">
					        <input type="hidden" name="purid" value="${purid}">
							<button type="submit" name="preresult" class="btn btn-default" value=0>未違規</button>
							<button type="submit" name="preresult" class="btn btn-default" value=1>違規</button>
							</FORM>
						</c:if>
						<c:if test="${preVO.prestatus == 1 }">
							${preVO.preresult eq 0?"未違規":"違規"}
						</c:if>
						
					</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
        </div>
        <br>
        
        </div>

            </div>
          </div>
        </div>
      </div>
    </main>
  </body>

</html>