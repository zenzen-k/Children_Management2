<%@page import="info.ClassroomBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="home_top.jsp"%>


<%
	String c_no = request.getParameter("c_no");
	ArrayList<ClassroomBean> clist = cdao.getAllClassroom(skno);
	ClassroomBean cb = cdao.getClassByCno(Integer.parseInt(c_no));
	ArrayList<UsersBean> ulist = udao.getAllUser(skno);
%>

<title>Home / Management / ClassroomUpdate</title>
<div class="pagetitle">
	<h1>교실관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">교실관리</a></li>
			<li class="breadcrumb-item active">교실수정</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">교실 수정하기</h5>
					
					<form method="post" action="croom_updateProc.jsp">
					<input type="hidden" name="c_no" value="<%=c_no%>">
					
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">교실명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputText" name="c_name" value="<%=cb.getC_name()%>">
							</div>
						</div>
						
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">연령선택</legend>
							<div class="col-sm-10">
								<%
								for(int i=3; i<=5; i++){
								%>
								<input class="form-check-input" type="radio" name="c_age" id="gridRadios1" value="<%=i%>" <%if(i == cb.getC_age()){%>checked<%}%>>
								<label class="form-check-label" for="gridRadios1" style="margin-right: 80">만 <%=i%>세</label>
								<%
								}
								%>
							</div>
						</fieldset>
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