<%@page import="info.ClassroomBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="info.ClassroomDao"%>
<%@page import="info.KindergartenBean"%>
<%@page import="info.KindergartenDao"%>
<%@page import="info.UsersBean"%>
<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="home_top.jsp"%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/script.js"></script>

<style>
	#inv {
	  display: none;
	  width: 100%;
	  margin-top: 0.25rem;
	  font-size: 0.875em;
	  color: #dc3545;
	}
</style>

<%
	ClassroomBean cb = cdao.getClassByCno(ub.getC_no());
	
	KindergartenBean kb = kdao.getKinderByKno(skno);
%>

<title>Home / Profile</title>

<div class="pagetitle">
	<h1>Profile</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item active">내 프로필</li>
		</ol>
	</nav>
</div> 
<!-- End Page Title -->

<section class="section profile">
	<div class="row">
		<div class="col-xl-4">

			<div class="card">
				<div
					class="card-body profile-card pt-4 d-flex flex-column align-items-center">

					<h2><%=ub.getU_name()%> (<%=sid%>)</h2>
					<h3><%=sename%> 
						<%
						if(ub.getC_no() >1){
							out.print("(" + cb.getC_name() + ")");
						}
						%>
					</h3>
				</div>
			</div> <!-- 프로필기본 -->

		</div>

		<div class="col-xl-8">

			<div class="card">
				<div class="card-body pt-3">
					<!-- Bordered Tabs -->
					<ul class="nav nav-tabs nav-tabs-bordered">

						<li class="nav-item">
							<button class="nav-link active" data-bs-toggle="tab"
								data-bs-target="#profile-overview">내 정보</button>
						</li>

						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-edit">정보 수정</button>
						</li>

						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-change-password">비밀번호 변경</button>
						</li>

					</ul>
					<div class="tab-content pt-2">

						<div class="tab-pane fade show active profile-overview" id="profile-overview">

							<h5 class="card-title">내 정보</h5>
							
							<div class="row">
								<div class="col-lg-3 col-md-4 label ">이름</div>
								<div class="col-lg-9 col-md-8"><%=ub.getU_name() %></div>
							</div>
							
							<div class="row">
								<div class="col-lg-3 col-md-4 label">생년월일</div>
								<div class="col-lg-9 col-md-8"><%=ub.getU_rrn1()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">소속 유치원</div>
								<div class="col-lg-9 col-md-8"><%=kb.getK_name()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">직급</div>
								<div class="col-lg-9 col-md-8"><%=sename%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">담당교실</div>
								<div class="col-lg-9 col-md-8"><%=cb.getC_name()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">핸드폰번호</div>
								<div class="col-lg-9 col-md-8"><%=ub.getU_hp1()%> - <%=ub.getU_hp2()%> - <%=ub.getU_hp3()%></div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Email</div>
								<div class="col-lg-9 col-md-8"><%=ub.getEmail()%></div>
							</div>

						</div>

						<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

							<!-- Profile Edit Form -->
							<form action="<%=path%>/user/updateProc.jsp" method="post">
								<div class="row mb-3">
									<label for="fullName" class="col-md-4 col-lg-3 col-form-label">이름</label>
									<div class="col-md-8 col-lg-9">
										<input name="u_name" type="text" class="form-control"
											id="fullName" value="<%=ub.getU_name() %>" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label for="birth" class="col-md-4 col-lg-3 col-form-label">생년월일</label>
									<div class="col-md-8 col-lg-9">
										<input name="u_rrn1" type="text" class="form-control"
											id="birth" value="<%=ub.getU_rrn1() %>" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label for="fullName" class="col-md-4 col-lg-3 col-form-label">직급 
									<font size="2">*유치원 관리자에게 문의</font></label>
									<div class="col-md-8 col-lg-9">
										<input name="e_name" type="text" class="form-control"
											id="fullName" value="<%=sename%>" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label for="fullName" class="col-md-4 col-lg-3 col-form-label">담당교실 
									<font size="2">*유치원 관리자에게 문의</font></label>
									<div class="col-md-8 col-lg-9">
										<input name="c_name" type="text" class="form-control"
											id="fullName" value="<%=cb.getC_name() %>" disabled>
									</div>
								</div>

								<div class="row mb-3">
									<label for="yourPhone" class="col-md-4 col-lg-3 col-form-label">전화번호</label>
									<div class="col-md-8 col-lg-9">
										<input type="text" name="u_hp1" class="form-control" id="yourPhone" style="display: inline; width: 30%" 
										maxlength="4" onkeydown="keyNone()" value="<%=ub.getU_hp1() %>">
					                    -
					                    <input type="text" name="u_hp2" class="form-control" id="yourPhone" style="display: inline; width: 30%" 
					                    maxlength="4" onkeydown="keyNone()" value="<%=ub.getU_hp2() %>">
					                    -
					                    <input type="text" name="u_hp3" class="form-control" id="yourPhone" style="display: inline; width: 30%" 
					                    maxlength="4" onkeydown="keyNone()" value="<%=ub.getU_hp3() %>">
					                    <div id="inv" class="msgNone invalid-msgPhone"></div>
									</div>
								</div>

								<div class="row mb-3">
									<label for="yourEmail" class="col-md-4 col-lg-3 col-form-label">Email</label>
									<div class="col-md-8 col-lg-9">
										<input type="email" name="email" class="form-control" id="yourEmail" value="<%=ub.getEmail()%>" onkeydown="keyNone()" >
										<div id="inv" class="msgNone invalid-msgEmail"></div>
									</div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary" onclick="return ch()">수정하기</button>
								</div>
							</form>
							<!-- End Profile Edit Form -->

						</div>

						<div class="tab-pane fade pt-3" id="profile-change-password">
							<!-- Change Password Form -->
							<form action="<%=path%>/user/updatePwProc.jsp" method="post">
								<div class="row mb-3">
									<label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">기존 비밀번호 입력</label>
									<div class="col-md-8 col-lg-9">
										<input name="pw" type="password" class="form-control" id="currentPassword">
									</div>
									<div id="inv" class="msgNone invalid-msgPw"></div>
								</div>

								<div class="row mb-3">
									<label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호</label>
									<div class="col-md-8 col-lg-9">
										<input name="newpw" type="password" class="form-control" id="newPassword" placeholder="영문자+숫자 8~16자" onkeydown="keyNone()">
									</div>
									<div id="inv" class="msgNone invalid-msgNewpw"></div>
								</div>

								<div class="row mb-3">
									<label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호 확인</label>
									<div class="col-md-8 col-lg-9">
										<input name="newpw2" type="password" class="form-control" id="renewPassword" placeholder="영문자+숫자 8~16자" onkeyup="keyNPw2()">
									</div>
									<div id="inv" class="msgNone invalid-msgNewpw2"></div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary" onclick="return pwch()">변경하기</button>
								</div>
							</form>
							<!-- End Change Password Form -->

						</div>

					</div>
					<!-- End Bordered Tabs -->

				</div>
			</div>

		</div>
	</div>
</section>

<%@ include file="home_bottom.jsp"%>