<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String searchC_no = request.getParameter("searchC_no");
%>
<jsp:useBean id="pb" class="children.PhysicalDevBean"/>
<jsp:setProperty property="*" name="pb"/>

<title>Home / ChildManagement / ChildRetreive</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">유아조회</a></li>
			<li class="breadcrumb-item active">신체발달수정</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->


<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				
					<h5 class="card-title">신체 발달 수정</h5>
					<form method="post" action="physicalUpdateProc.jsp?searchC_no=<%=searchC_no%>">
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">학번<font size="2"> *수정불가</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="s_no" value="<%=pb.getS_no()%>" readonly style="color: red">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">학기<font size="2"> *수정불가</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_age" value="<%=pb.getP_age()%>" readonly style="color: red">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">검사일</label>
							<div class="col-sm-10">
								<input type="date" name="pdate" value="<%=pb.getPdate()%>">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">몸무게</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="weight" value="<%=pb.getWeight()%>">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">키</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="height" value="<%=pb.getHeight()%>">
							</div>
						</div>
						
						<div class="text-center">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="reset" class="btn btn-secondary">취소</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="../userPage/home_bottom.jsp"%>