<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="home_top.jsp"%>

<title>Home / Management / ClassroomInsert</title>
<div class="pagetitle">
	<h1>교실관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">교실관리</a></li>
			<li class="breadcrumb-item active">교실등록</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">교실 등록하기</h5>
					<form method="post" action="croom_insertProc.jsp">
						<div class="row mb-3">
							<label for="inputEmail3" class="col-sm-2 col-form-label">교실명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputText" name="c_name">
							</div>
						</div>
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">연령선택</legend>
							<div class="col-sm-10">
								<input class="form-check-input" type="radio" name="c_age" id="gridRadios1" value="3" checked>
								<label class="form-check-label" for="gridRadios1" style="margin-right: 80">만 3세</label>
								<input class="form-check-input" type="radio" name="c_age" id="gridRadios1" value="4">
								<label class="form-check-label" for="gridRadios1" style="margin-right: 80">만 4세</label>
								<input class="form-check-input" type="radio" name="c_age" id="gridRadios1" value="5">
								<label class="form-check-label" for="gridRadios1">만 5세</label>
								
							</div>
						</fieldset>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<button type="reset" class="btn btn-secondary">Reset</button>
						</div>
					</form>
					<!-- End Horizontal Form -->

				</div>
			</div>

		</div>
	</div>
</section>


<%@ include file="home_bottom.jsp"%>