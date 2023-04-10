<%@page import="info.EmpBean"%>
<%@page import="info.ClassroomBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="home_top.jsp"%>


<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	int c_no = Integer.parseInt(request.getParameter("c_no"));
	int e_no = Integer.parseInt(request.getParameter("e_no"));
	String u_name = request.getParameter("u_name");
	String c_name = request.getParameter("c_name");
	String e_name = request.getParameter("e_name");
	
	ArrayList<ClassroomBean> clists = cdao.getAllClassroom(skno);
	ArrayList<EmpBean> elist = edao.getAllEmp();
%>

<title>Home / Management / TeachersUpdate</title>
<div class="pagetitle">
	<h1>교사관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/usersMng.jsp">교사관리</a></li>
			<li class="breadcrumb-item active">교사수정</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">교사 수정하기</h5>
					
					<form method="post" action="users_updateProc.jsp">
					<input type="hidden" name="id" value="<%=id%>">
					
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">교사명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputText" name="u_name" value="<%=u_name%>" disabled>
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">담당 교실 선택</label>
							<div class="col-sm-10">
								<div class="col-sm-10">
									<select class="form-select" name="c_no">
										<option value="1">선택안함</option> <!-- 1이면 미정 -->
										<%
										for(ClassroomBean c : clists){
										%>
										<option value="<%=c.getC_no()%>" <%if(c.getC_no()==c_no){%>selected<%}%>><%=c.getC_name()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">직급 선택</label>
							<div class="col-sm-10">
								<div class="col-sm-10">
									<select class="form-select" name="e_no">
										<%
										for(EmpBean eb : elist){
										%>
										<option value="<%=eb.getE_no()%>" <%if(eb.getE_no()==e_no){%>selected<%}%>><%=eb.getE_name()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
						</div>
						
						<div class="text-center">
							<button type="submit" class="btn btn-primary">수정하기</button>
							<button type="reset" class="btn btn-secondary">되돌리기</button>
						</div>
					</form>
					<!-- End Horizontal Form -->

				</div>
			</div>

		</div>
	</div>
</section>


<%@ include file="home_bottom.jsp"%>