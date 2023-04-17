<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<script>
	function check() {
		if(scform.s_title.value==""){
			alert("행사명을 작성하세요");
			scform.s_title.focus();
			return false;
		}
		
		if(scform.s_date.value==""){
			alert("행사 시작 날짜를 선택하세요");
			scform.s_date.focus();
			return false;
		}
		if(scform.e_date.value==""){
			result = confirm("행사 기간이 하루가 맞습니까?");
			if(!result){
				alert("행사 마지막 날짜를 선택하세요");
				scform.e_date.focus();
				return false;
			}
		}
	}
</script>

<title>Home / ChildManagement / Schedule</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/schedule/schedule.jsp">행사관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/schedule/schedule.jsp">행사일정</a></li>
			<li class="breadcrumb-item active">행사등록</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->
<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">행사일정 등록하기</h5>
					
					
					<form method="post" action="schedule_insertProc.jsp" name="scform">
						<div class="row mb-3">
							<label for="inputText" class="col-sm-1 col-form-label">행사명입력</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="s_title" name="s_title">
							</div>
						</div>
							<label class="col-sm-2 col-form-label">행사기간선택<br><br></label>
							<div class="col-sm-10">
								시작날짜 : 
								<input type="date" name="s_date" id="s_date"> ~ 
								종료날짜(없으면 미선택) : 
								<input type="date" name="e_date" id="e_date">
							</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" onclick="return check()">등록하기</button>
							<button type="button" class="btn btn-secondary" onclick="history.go(-1)">돌아가기</button>
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>
</section>


<%@ include file="../userPage/home_bottom.jsp"%>