<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>

<%
	request.setCharacterEncoding("UTF-8");

	String s_no = request.getParameter("s_no");
	String c_no = request.getParameter("c_no");
	String s_name = request.getParameter("s_name");
	String s_birth = request.getParameter("s_birth");
	
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	UsersBean ub2 = udao.getUserInfo(sid);
%>

<title>Home / ChildManagement / Observations</title>
<div class="pagetitle">
	<h1>관찰일지</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/observations.jsp">관찰일지</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/observations_Board.jsp?s_no=<%=s_no%>&s_name=<%=s_name%>&s_birth=<%=s_birth%>&c_no=<%=c_no%>">관찰일지게시판</a></li>
			<li class="breadcrumb-item active">관찰일지작성</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-10" style="margin: auto;">

			<div class="card">
				<div class="card-body">
				
					<h5 class="card-title">관찰일지 작성</h5>
					<form name="obform" method="post" action="observations_WriteProc.jsp">
						
						<input type="hidden" name="s_no" value="<%=s_no%>">
						<input type="hidden" name="c_no" value="<%=c_no%>">
						<input type="hidden" name="writerid" value="<%=sid%>">
						<input type="hidden" name="writer" value="<%=ub2.getU_name()%>">
						
						<div class="row mb-3">
							<label for="name" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="name" name="s_name" value="<%=s_name%>" readonly>
							</div>
							<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="birth" name="s_birth" value="<%=s_birth%>" readonly>
							</div>
						</div>
						<div class="row mb-3">
							<label for="title" class="col-sm-2 col-form-label">관찰상황</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="title" name="o_title">
							</div>
							<label for="date" class="col-sm-2 col-form-label">관찰일자</label>
							<div class="col-sm-4">
								<input type="date" class="form-control" id="date" name="odate" value="<%=sdf.format(now)%>">
							</div>
						</div>
						<div class="row mb-3">
							<label for="title" class="col-sm-2 col-form-label">내용작성</label>
							<div class="col-sm-12">
                    			<textarea class="form-control" id="otext" name="o_content" style="height: 350px; resize: none;" onkeyup="byteLength()"></textarea>
                    			<span id="byteLen"></span>/4000 byte
							</div>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" onclick="return obcheck()">등록하기</button>
							<button type="reset" class="btn btn-secondary">취소하기</button>
						</div>
					</form>

				</div>
			</div>

		</div>
	</div>
</section>


<%@ include file="../userPage/home_bottom.jsp"%>