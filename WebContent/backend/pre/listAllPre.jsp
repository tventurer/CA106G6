<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pre.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.pur.model.*"%>
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
PreService preSvc = new PreService();
List<PreVO> list = preSvc.getAll();
pageContext.setAttribute("list",list);

String[] prelabel = {"賣場描述或圖片中含有不當內容","詐騙","賣場販售仿冒品","導向此平台已外交易","其他"};
pageContext.setAttribute("prelabel",prelabel);

%>

<!DOCTYPE html>
<html  lang="zh-TW">
  <head>
    <title>T-Venturer - Administrator</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/b/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />

 <style type="text/css">
  .app-header__logo{
  background-color:#009688;
  width:200px;
  }
  </style>
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header">
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <a class="app-header__logo" href="index.html">T-Venturer</a>
      
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        <!--右上方的小鈴鐺-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell-o fa-lg"></i></a>
          <ul class="app-notification dropdown-menu dropdown-menu-right">
            <li class="app-notification__title">你有四個新訊息</li>
            <div class="app-notification__content">
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Lisa 寄給你一封e-mail</p>
                    <p class="app-notification__meta">2 分鐘前</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Mail 伺服器無法運作</p>
                    <p class="app-notification__meta">5 分鐘前</p>
                  </div></a></li>
              <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                  <div>
                    <p class="app-notification__message">Transaction complete</p>
                    <p class="app-notification__meta">2 days ago</p>
                  </div></a></li>
              <div class="app-notification__content">
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Lisa sent you a mail</p>
                      <p class="app-notification__meta">2 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Mail server not working</p>
                      <p class="app-notification__meta">5 min ago</p>
                    </div></a></li>
                <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                    <div>
                      <p class="app-notification__message">Transaction complete</p>
                      <p class="app-notification__meta">2 days ago</p>
                    </div></a></li>
              </div>
            </div>
            <li class="app-notification__footer"><a href="#">See all notifications.</a></li>
          </ul>
        </li>
        
        <!-- 右上方的小人頭 登出地-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/empLogin.jsp"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
    
    <!-- 左邊總選單-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img type="image/gif" class="app-sidebar__user-avatar" src="<%=request.getContextPath()%>/backend/emp/emp?empno=<%=empVO.getEmpno()%>" width="100px" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><%=empVO.getEmpname()%></p>
          <p class="app-sidebar__user-designation"><%=empVO.getEmpposi()%></p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item" href="<%=request.getContextPath()%>/backend/emp/empIndex.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">後臺管理首頁</span></a></li>
       <li><a class="app-menu__item" href="<%=request.getContextPath()%>/backend/acr/listAllAcr.jsp"><i class="fa fa-credit-card" aria-hidden="true"></i><span class="app-menu__label">&nbsp;&nbsp;&nbsp;會員儲值紀錄</span></a></li>
       <li><a class="app-menu__item active" href="<%=request.getContextPath()%>/backend/pre/listAllPre.jsp"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><span class="app-menu__label">&nbsp;&nbsp;&nbsp;代購商品檢舉審核</span></a></li>
      </ul>
    </aside>
    
    <!-- 管理頁面主要顯示的部分 -->
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;代購商品檢舉審核</h1>
          <p>代購商品檢舉，管理員可在此處審核</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="#">代購商品檢舉審核</a></li>
        </ul>
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
    <!-- Essential javascripts for application to work-->
    <script src="<%=request.getContextPath()%>/style/b/js/jquery-3.2.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/style/b/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/style/b/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/style/b/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="<%=request.getContextPath()%>/style/b/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/b/js/plugins/chart.js"></script>
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
  <!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

</html>