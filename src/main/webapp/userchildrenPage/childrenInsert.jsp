<%@page import="children.FamilyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="info.ClassroomBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<%
	ArrayList<ClassroomBean> clist = cdao.getAllClassroom(skno);
%>

<!-- js -->
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>


<title>Home / Management / ClassroomInsert</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">유아조회</a></li>
			<li class="breadcrumb-item active">학생추가</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">학생 등록하기</h5>
					<form name="f" method="post" action="childrenInsertProc.jsp" enctype="multipart/form-data">
						<table class="table">
								<tr>
									<td rowspan="7" width="20%">
						                <input class="form-control" type="file" id="formFile" name="imgname">
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active" width="15%">학생번호</th>
									<td colspan="3">
										<input type="text" name="s_no" value="학생번호는 자동으로 입력됩니다." class="form-control" disabled>
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active">입학일</th>
									<td>
										<input type="date" name="entran" class="form-control" id="ent">
									</td>
									<th scope="col" class="table-active"  width="15%">이름</th>
									<td>
										<input type="text" name="s_name" class="form-control">
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active">교실</th>
									<td>
										<select name="c_no" class="form-select">
											<%for(ClassroomBean cb : clist){ %>
											<!-- 띄어쓰기 구분자로 값 두개 넘기기! -->
											<option value="<%=cb.getC_no()%> <%=cb.getC_age()%>"><%=cb.getC_name()%> (만 <%=cb.getC_age()%>세)</option>
											<%
											}
											%>
										</select>
									</td>
									<th scope="col" class="table-active">생년월일</th>
									<td>
										<input type="date" name="s_birth" class="form-control" id="bir">
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active">성별</th>
									<td>
										<input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="남" checked>
										<label class="form-check-label" for="gridRadios1" style="margin-right: 20">남자</label>
										<input class="form-check-input" type="radio" name="gender" id="gridRadios1" value="여">
										<label class="form-check-label" for="gridRadios1">여자</label>
									</td>
									<th scope="col" class="table-active">방과후교실</th>
									<td>
										<input class="form-check-input" type="radio" name="after" id="gridRadios1" value="참여">
										<label class="form-check-label" style="margin-right: 20">참여</label>
										<input class="form-check-input" type="radio" name="after" id="gridRadios1" value="미참여" checked>
										<label class="form-check-label">미참여</label>
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active">주소</th> 
									<td colspan="3">
										<%@ include file="../user/searchAddr.jsp" %>
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active">특이사항</th>
									<td colspan="3">
										<input type="text" name="note" size="100" class="form-control" value="없음">
									</td>
								</tr>
								
						</table>
						
						<!-- 가족정보 -->
						<h5 class="card-title">긴급연락처</h5>
						<%
							String[] fam = {"부", "모", "조부", "조모", "친척", "기타"};
						%>
						<table class="table">
								<tr>
									<th scope="col" class="table-active" width="15%">가족관계</th>
									<td>
										<select name="f_relations" class="form-select">
											<% for(int i=0; i<fam.length; i++){ %>
											<option value="<%=fam[i]%>"><%=fam[i]%></option>
											<% } %>
										</select>
									</td>
									<th scope="col" class="table-active" width="15%">이름</th>
									<td>
										<input type="text" name="f_name" class="form-control">
									</td>
								</tr>
								<tr>
									<th scope="col" class="table-active">생년월일</th>
									<td>
										<input type="date" name="f_birth" class="form-control" >
									</td>
									<th scope="col" class="table-active">연락처</th>
									<td>
										<input type="text" name="f_hp1" class="form-control" style="display: inline; width: 30%" maxlength="4"> - 
										<input type="text" name="f_hp2" class="form-control" style="display: inline; width: 30%" maxlength="4"> - 
										<input type="text" name="f_hp3" class="form-control" style="display: inline; width: 30%" maxlength="4">
									</td>
								</tr>
						</table>
						
						
						<div class="text-center">
							<button type="submit" class="btn btn-primary" onclick="return childCheck()">등록하기</button>
							<button type="reset" class="btn btn-secondary">취소하기</button>
						</div>
					</form>
					<!-- End Horizontal Form -->

				</div>
			</div>

		</div>
	</div>
</section>

<script>
	//new Date().toISOString()
	//substring : 0을 포함해서 10보다 작은 문자열을 추려내서 새로운 문자열을 반환
	document.getElementById('ent').value = new Date().toISOString().substring(0, 10);
	document.getElementById('bir').value = new Date().toISOString().substring(0, 10);
</script>


<%@ include file="../userPage/home_bottom.jsp"%>