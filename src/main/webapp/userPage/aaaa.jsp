<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!-- 첨에 이볅ㄱ해야개한ㄷ  -->


<%@ include file="home_top.jsp" %>

<title>Home / Management / ClassroomUpdate</title>
<div class="pagetitle">
	<h1>교실관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">Management</a></li>
			<li class="breadcrumb-item active">Classroom</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<%@ include file="home_bottom.jsp" %>



<%@ include file="../userPage/home_top.jsp"%>

<title>Home / ChildManagement / ChildRetreive</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item active">유아조회</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<%@ include file="../userPage/home_bottom.jsp"%>