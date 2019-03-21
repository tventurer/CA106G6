<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
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
<html lang="en">
  <head>
    <title>T-Venturer - Administrator</title>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/b/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/b/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header"><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
    <a class="app-header__logo" href="<%=request.getContextPath()%>/backend/emp/empIndex.jsp">T-Venturer</a>
      <!-- Sidebar toggle button-->
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        
<!--         鈴鐺圖示 -->
        <!--Notification Menu-->
<!--         <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Show notifications"><i class="fa fa-bell-o fa-lg"></i></a> -->
<!--           <ul class="app-notification dropdown-menu dropdown-menu-right"> -->
<!--             <li class="app-notification__title">You have 4 new notifications.</li> -->
<!--             <div class="app-notification__content"> -->
<!--               <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span> -->
<!--                   <div> -->
<!--                     <p class="app-notification__message">Lisa sent you a mail</p> -->
<!--                     <p class="app-notification__meta">2 min ago</p> -->
<!--                   </div></a></li> -->
<!--               <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span> -->
<!--                   <div> -->
<!--                     <p class="app-notification__message">Mail server not working</p> -->
<!--                     <p class="app-notification__meta">5 min ago</p> -->
<!--                   </div></a></li> -->
<!--               <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span> -->
<!--                   <div> -->
<!--                     <p class="app-notification__message">Transaction complete</p> -->
<!--                     <p class="app-notification__meta">2 days ago</p> -->
<!--                   </div></a></li> -->
<!--               <div class="app-notification__content"> -->
<!--                 <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span> -->
<!--                     <div> -->
<!--                       <p class="app-notification__message">Lisa sent you a mail</p> -->
<!--                       <p class="app-notification__meta">2 min ago</p> -->
<!--                     </div></a></li> -->
<!--                 <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span> -->
<!--                     <div> -->
<!--                       <p class="app-notification__message">Mail server not working</p> -->
<!--                       <p class="app-notification__meta">5 min ago</p> -->
<!--                     </div></a></li> -->
<!--                 <li><a class="app-notification__item" href="javascript:;"><span class="app-notification__icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span> -->
<!--                     <div> -->
<!--                       <p class="app-notification__message">Transaction complete</p> -->
<!--                       <p class="app-notification__meta">2 days ago</p> -->
<!--                     </div></a></li> -->
<!--               </div> -->
<!--             </div> -->
<!--             <li class="app-notification__footer"><a href="#">See all notifications.</a></li> -->
<!--           </ul> -->
<!--         </li> -->
        <!-- User Menu-->
        
<!--         齒輪圖示 -->
<!--         <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a> -->
<!--           <ul class="dropdown-menu settings-menu dropdown-menu-right"> -->
<!--             <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li> -->
<!--             <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li> -->
<!--             <li><a class="dropdown-item" href="page-login.html"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li> -->
<!--           </ul> -->
<!--         </li> -->



      </ul>
		<style type="text/css">
			.app-header__logo{
				background-color:#009688;
				width:200px;
			}
		</style>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img type="image/gif" class="app-sidebar__user-avatar" src="<%=request.getContextPath()%>/backend/emp/emp?empno=<%=empVO.getEmpno()%>" width="100px" alt="User Image">
        <div>
          <p class="app-sidebar__user-name"><%=empVO.getEmpname()%></p>
          <p class="app-sidebar__user-designation"><%=empVO.getEmpposi()%></p>
        </div>
      </div>
      <ul class="app-menu">  
      
      
      
      
      
          
<!----------------------------------------- 會員 --------------------------------------------------------->      
        <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">會員管理</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="app-menu__item" href="<%=request.getContextPath()%>/backend/acr/listAllAcr.jsp"><i class="fa fa-credit-card" aria-hidden="true"></i><span class="app-menu__label">&nbsp;&nbsp;&nbsp;會員儲值紀錄</span></a></li>
          </ul>        
        </li>
<!----------------------------------------- 後台人員 --------------------------------------------------------->        
<!--         <li class="treeview"><a class="app-menu__item active" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">後台人員管理</span><i class="treeview-indicator fa fa-angle-right"></i></a> -->
<!--           <ul class="treeview-menu"> -->
<!--             <li><a class="treeview-item" href="bootstrap-components.html"><i class="icon fa fa-circle-o"></i> Bootstrap Elements</a></li> -->
<!--             <li><a class="treeview-item" href="https://fontawesome.com/v4.7.0/icons/" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Font Icons</a></li> -->
<!--             <li><a class="treeview-item" href="ui-cards.html"><i class="icon fa fa-circle-o"></i> Cards</a></li> -->
<!--             <li><a class="treeview-item" href="widgets.html"><i class="icon fa fa-circle-o"></i> Widgets</a></li> -->
<!--           </ul>         -->
<!--         </li> -->
<!----------------------------------------- 旅人文章 --------------------------------------------------------->        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">旅人文章管理</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="bootstrap-components.html"><i class="icon fa fa-circle-o"></i> Bootstrap Elements</a></li>
            <li><a class="treeview-item" href="https://fontawesome.com/v4.7.0/icons/" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Font Icons</a></li>
            <li><a class="treeview-item" href="ui-cards.html"><i class="icon fa fa-circle-o"></i> Cards</a></li>
            <li><a class="treeview-item" href="widgets.html"><i class="icon fa fa-circle-o"></i> Widgets</a></li>
          </ul>
        </li>
<!----------------------------------------- 代購 --------------------------------------------------------->       
 		<li><a class="app-menu__item " href="<%=request.getContextPath()%>/backend/pre/listAllPre.jsp"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><span class="app-menu__label">&nbsp;&nbsp;&nbsp;代購商品檢舉審核</span></a></li>
<!----------------------------------------- 自由行 --------------------------------------------------------->        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">自由行管理</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/tri/listAllTri.jsp"><i class="icon fa fa-circle-o"></i> 行程列表</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/tri/listAllByTristat.jsp"><i class="icon fa fa-circle-o"></i> 待報價行程</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/tod/listAllTod.jsp"><i class="icon fa fa-circle-o"></i> 訂單列表</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/tod/listAllByTodstat.jsp"><i class="icon fa fa-circle-o"></i> 待處理訂單</a></li>
            <li><a class="treeview-item" href="form-notifications.html"><i class="icon fa fa-circle-o"></i> 景點管理</a></li>
          </ul>
        </li>
<!----------------------------------------- 套裝行程 --------------------------------------------------------->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">套裝行程管理</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="table-basic.html"><i class="icon fa fa-circle-o"></i> Basic Tables</a></li>
            <li><a class="treeview-item" href="table-data-table.html"><i class="icon fa fa-circle-o"></i> Data Tables</a></li>
          </ul>
        </li>
<!----------------------------------------- 機加酒 --------------------------------------------------------->
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">機加酒管理</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/pah/addpah.jsp"><i class="icon fa fa-circle-o"></i>商品上架</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/pah/listallpah.jsp"><i class="icon fa fa-circle-o"></i>商品列表</a></li>
            <li><a class="treeview-item" href="<%=request.getContextPath()%>/backend/pho/listallrefund.jsp"><i class="icon fa fa-circle-o"></i>客戶訂單管理</a></li>
          </ul>
        </li>
      </ul>
    </aside>
    
    
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