<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav class="nav-footer">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
              </li>
              <li class="list-inline-item">
                <a href="<%=request.getContextPath()%>/frontend/pur/purIndex.jsp">代購商品</a>
              </li>
              <li class="list-inline-item">
                <a href="<%=request.getContextPath()%>/pah/pahcontrol?action=listPahBySelect">機加酒</a>
              </li>
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/frontend/tri/tripIndex.jsp">自由行</a>
              </li>
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/backend/ptp/pacHead.jsp">套裝行程</a>
              </li>
              <li class="list-inline-item">
                <a href="<%= request.getContextPath() %>/frontend/pos/AllPost.jsp">旅人文章</a>
              </li>
            </ul>
          </nav>
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; CA106G6_TVenturer<br><br>
              &copy; Copyright
              <span class="color-a">EstateAgency</span> All Rights Reserved.
            </p>
          </div>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
            -->
            Designed by <p>BootstrapMade</p>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!--/ Footer End /-->

</body>
</html>
