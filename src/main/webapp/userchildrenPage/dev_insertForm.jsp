<%@page import="children.StudentBean"%>
<%@page import="children.DevelopmentalBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.DevelopmentalDao"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<%
	Date now = new Date();
	int mon = now.getMonth();
	int year = now.getYear() + 1900;
	
	//System.out.println("mon : " + mon);
	String semester = "";
	if(mon>=2 && mon<=7){
		semester = "1";
	}else{
		semester = "2";
	}
	
	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	ArrayList<DevelopmentalBean> dlist = ddao.getDevByUser(sid);
	
	ArrayList<StudentBean> slist = sdao.getStuCnameByCno(skno, scno);
	
	
	//교사이름
	UsersBean ub2 = udao.getUserInfo(sid);
%>
<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>
<script>
	var flug = 0;
	
	function plus() {
		//alert(1);
		document.getElementById('scopPlus').innerHTML += '<div class="row mb-3" id="plusScop"><label for="scope" class="col-sm-2 col-form-label">영역</label><div class="col-sm-4"><input type="text" class="form-control" id="scope" name="scope"></div></div>';
		document.getElementById('scopPlus').innerHTML += '<div class="row mb-3" id="plusComent"><label for="title" class="col-sm-2 col-form-label">내용작성</label><div class="col-sm-12"><textarea class="form-control" id="d_content" name="d_content" style="height: 200px; resize: none;"></textarea></div></div>';
		
		flug++;
	}
	
	function del() {
		if(flug == 0){
			alert("영역 최소 한개는 작성해야 합니다.");
		}else{
			var slen = $('#plusScop').length;
			var clen = $('#plusComent').length;
			
			$("#plusScop").eq(slen-1).remove();
			$("#plusComent").eq(clen-1).remove();
			
			flug--;
		}
	}
	
	function save() {
		check();
		document.devform.action="dev_insertProc.jsp?approve=작성중";
		document.devform.submit();
	}
	function subm() {
		check();
		document.devform.action="dev_insertProc.jsp?approve=승인대기";
		document.devform.submit();
	}
	
	function check() {

	}
			
</script>

<title>Home / ChildManagement / developmental</title>
<div class="pagetitle">
	<h1>발달평가</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/developmental.jsp">발달평가</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/dev_insert.jsp">발달평가작성</a></li>
			<li class="breadcrumb-item active">발달평가추가</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->


<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=year%>년 <%=semester%>학기 발달평가 작성</h5>
			
			<form action="dev_insertProc.jsp" method="post" name="devform">
				
				<input type="hidden" name="writerid" value="<%=ub2.getId()%>">
				<input type="hidden" name="c_age" value="<%=slist.get(0).getC_age()%>">
				<input type="hidden" name="semester" value="<%=semester%>">
			
			
				<div class="row mb-3">
					<label for="student" class="col-sm-2 col-form-label">학생선택</label>
					<div class="col-sm-4">
						<select name="s_no" id="student" class="form-select">
							<%
							for(StudentBean sb : slist){
							%>
								<option value="<%=sb.getS_no()%>"><%=sb.getS_name()%>(<%=sb.getS_no()%>)</option>
							<%
							}
							%>
						</select>
					</div>
					<label for="cname" class="col-sm-2 col-form-label">교실</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="cname" name="c_name" value="<%=slist.get(0).getNote()%>" readonly>
					</div>
				</div>
						
				<div class="row mb-3">
					<label for="seme" class="col-sm-2 col-form-label">관찰일</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="seme" name="sem" value="만 <%=slist.get(0).getC_age()%>세 <%=semester%>학기" readonly>
					</div>
					<label for="uname" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="uname" name="writer" value="<%=ub2.getU_name()%>" readonly>
					</div>
				</div>
				
				<div class="col-sm-12">
					<input type="button" class="btn btn-primary" value="영역추가" style="float: right; margin-left: 20px;" onclick="plus()">
					<input type="button" class="btn btn-primary" value="영역삭제" style="float: right;" onclick="del()">
				</div>
				
				<div class="row mb-3">
					<label for="scope" class="col-sm-2 col-form-label">영역</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="scope" name="scope" >
					</div>
				</div>
				
				<div class="row mb-3">
					<label for="title" class="col-sm-2 col-form-label">내용작성</label>
					<div class="col-sm-12">
               			<textarea class="form-control" id="d_content" name="d_content" style="height: 200px; resize: none;"></textarea>
					</div>
				</div>
				
				<div id="scopPlus"></div>
				
				<input type="button" class="btn btn-primary" value="저장하기" onclick="save()">
				<input type="button" class="btn btn-primary" value="제출하기" onclick="subm()">
			</form>
			
		</div>
	</div>
</div>

<%@ include file="../userPage/home_bottom.jsp"%>