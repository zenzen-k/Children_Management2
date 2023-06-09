<%@page import="info.ScheduleDao"%>
<%@page import="children.AttendManageDao"%>
<%@page import="children.PhysicalDevDao"%>
<%@page import="children.FamilyDao"%>
<%@page import="children.StudentDao"%>
<%@page import="info.UsersBean"%>
<%@page import="info.EmpDao"%>
<%@page import="info.KindergartenDao"%>
<%@page import="info.ClassroomDao"%>
<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//경로
	String path = request.getContextPath();

	//세션
	int seno = (Integer)session.getAttribute("seno"); // 직급번호
	int skno = (Integer)session.getAttribute("skno");
	int scno = (Integer)session.getAttribute("scno");
	String sid = (String)session.getAttribute("sid"); 
	String sename = (String)session.getAttribute("sename");
	
	//다오객체
	UsersDao udao = UsersDao.getInstance();
	ClassroomDao cdao = ClassroomDao.getInstance();
	KindergartenDao kdao = KindergartenDao.getInstance();
	EmpDao edao = EmpDao.getInstance();
	StudentDao sdao = StudentDao.getInstance();
	FamilyDao fdao = FamilyDao.getInstance();
	PhysicalDevDao pdao = PhysicalDevDao.getInstance();
	AttendManageDao adao = AttendManageDao.getInstance();
	ScheduleDao scdao = ScheduleDao.getInstance();
	
	//
	UsersBean ub = udao.getUserInfo(sid);
	
	//
	String str = null;
	if(scno==0)
		str = "전체";
	else
		str = "반별";
%>

<head>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%=path%>/images/favicon-32x32.png" rel="icon">
  <link href="<%=path%>/images/apple-icon-180x180.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=path%>/bootstrap/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=path%>/bootstrap/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=path%>/bootstrap/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=path%>/bootstrap/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="<%=path%>/bootstrap/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="<%=path%>/bootstrap/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=path%>/bootstrap/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=path%>/bootstrap/assets/css/style.css" rel="stylesheet">

</head>

<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="<%=path%>/userPage/home.jsp" class="logo d-flex align-items-center">
        <img src="<%=path%>/images/mainlogo.png" alt="">
        <span class="d-none d-lg-block">kids manager</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2"><%=sid%> (<%=sename %>)님</span>
          </a><!-- End Profile Image Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=ub.getU_name()%></h6>
              <span><%=sename %></span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=path%>/userPage/user_profile.jsp">
                <i class="bi bi-person"></i>
                <span>내 프로필</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="<%=path%>/logout.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>로그아웃</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- ==== End Header ===== -->

  <!-- ======= 메뉴바!!! ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="<%=path%>/userPage/home.jsp">
          <i class="bi bi-grid"></i>
          <span>Home</span>
        </a>
      </li><!-- End Dashboard Nav -->
	
	
	<% if(seno == 501) { %>
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>유치원관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=path%>/userPage/croomMng.jsp">
              <i class="bi bi-circle"></i><span>교실관리</span>
            </a>
          </li>
          <li>
            <a href="<%=path%>/userPage/usersMng.jsp">
              <i class="bi bi-circle"></i><span>교사관리</span>
            </a>
          </li>
          <li>
            <a href="<%=path%>/userPage/approval.jsp">
              <i class="bi bi-circle"></i><span>가입승인</span>
            </a>
          </li>
          <li>
            <a href="<%=path%>/userPage/devApproval.jsp">
              <i class="bi bi-circle"></i><span>평가관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->
	<% } %>
	
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-person"></i><span>학생관리</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">
              <i class="bi bi-circle"></i><span>유아 전체 조회</span>
            </a>
          </li>
          <li>
            <a href="<%=path%>/userchildrenPage/attendManage.jsp">
              <i class="bi bi-circle"></i><span>출석관리(<%=str%>)</span>
            </a>
          </li>
          <li>
            <a href="<%=path%>/userchildrenPage/observations.jsp">
              <i class="bi bi-circle"></i><span>관찰일지(<%=str%>)</span>
            </a>
          </li>
          <li>
            <a href="<%=path%>/userchildrenPage/developmental.jsp">
              <i class="bi bi-circle"></i><span>발달평가(<%=str%>)</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->
	
      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=path%>/schedule/schedule.jsp">
          <i class="bi bi-layout-text-window-reverse"></i><span>행사관리</span><!-- <i class="bi bi-chevron-down ms-auto"></i> -->
        </a>
      </li><!-- End Tables Nav -->

      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=path%>/userPage/user_profile.jsp">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="<%=path%>/userPage/FAQ.jsp">
          <i class="bi bi-question-circle"></i>
          <span>F.A.Q</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->
  
  <main id="main" class="main">