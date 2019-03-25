<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.tod.model.*"%>
<%@ page import="com.pah.model.*"%>
<%@ page import="com.ptp.model.*"%>
<%@ page import="java.util.*"%>
<%
	String empno = (String)session.getAttribute("empno");

    Object account = session.getAttribute("account");                  // 從 session內取出 (key) account的值
    if (account == null) {                                             // 如為 null, 代表此user未登入過 , 才做以下工作
      session.setAttribute("location", request.getRequestURI());       //*工作1 : 同時記下目前位置 , 以便於login.html登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
      response.sendRedirect(request.getContextPath()+"/empLogin.jsp");   //*工作2 : 請該user去登入網頁(login.html) , 進行登入
      return;
    }
EmpService empSvc = new EmpService();
EmpVO empVO = empSvc.getOneEmp(empno);

%>

<!DOCTYPE html>
<html  lang="zh-TW">
  <head>
 <style type="text/css">
  .app-header__logo{
  background-color:#009688;
  width:200px;
  }
  </style>
  </head>
  <body class="app sidebar-mini rtl">
   <!-- 引入標頭 -->
<jsp:include page="/backend/backbar.jsp"/>
        
    
    <!-- 管理頁面主要顯示的部分 -->
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-user-secret" aria-hidden="true"></i>
		  	後臺管理首頁
		  </h1>
          <p>旅遊浪潮以客為尊、物超所值</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
            <div class="info">
            <%
            	MemService memSvc = new MemService();
            	List<MemVO> Memlist = memSvc.getAll();
            	Integer memnember = Memlist.size();
            %>
              <h4>會員</h4>
              <p><b><%=memnember %></b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small info coloured-icon"><i class="icon fa fa-thumbs-o-up fa-3x"></i>
            <div class="info">
            <%
            TodService todSvc = new TodService();
        	List<TodVO> Todlist = todSvc.getAll();
        	Integer todnember = Todlist.size();
            %>
              <h4>景點</h4>
              <p><b><%=todnember %>筆自由行訂單</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small warning coloured-icon"><i class="icon fa fa-files-o fa-3x"></i>
            <div class="info">
            <%
            	PahService pahSvc = new PahService();
            	List<PahVO> Pahlist = pahSvc.getall();
            	Integer pahnember = Pahlist.size();
            %>
              <h4>機加酒</h4>
              <p><b><%=pahnember %>個機加酒商品</b></p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="widget-small danger coloured-icon"><i class="icon fa fa-star fa-3x"></i>
            <div class="info">
             <%
            	PtpService ptpSvc = new PtpService();
            	List<PtpVO> Ptplist = ptpSvc.getAll();
            	Integer ptpnember = Ptplist.size();
            %>
              <h4>套裝行程</h4>
              <p><b><%=ptpnember %>個出團</b></p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
        	<img src="<%=request.getContextPath()%>/style/b/bgr.jpg" style="width:100%">
        </div>
      </div>
    </main>
    
    <script type="text/javascript">
      var data = {
      	labels: ["January", "February", "March", "April", "May"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [65, 59, 80, 81, 56]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86]
      		}
      	] 
      };
      var pdata = [
      	{
      		value: 300,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "Complete"
      	},
      	{
      		value: 50,
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "In-Progress"
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>