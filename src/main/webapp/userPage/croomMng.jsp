<%@page import="info.ClassroomBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="home_top.jsp"%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userPage/script.js"></script>

<%
	ArrayList<ClassroomBean> clist = cdao.getAllClassroom(skno);
%>

<title>Home / Management / Classroom</title>
<div class="pagetitle">
	<h1>교실관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item active">교실관리</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">교실조회</h5>
					<button type="button" class="btn btn-outline-primary" style="float: right;" onclick="delSelct()">선택삭제</button>
					<button type="button" class="btn btn-outline-primary" style="float: right; margin-right: 20" onclick="location.href='croom_Insert.jsp'">교실등록</button>
					<!-- Table with stripped rows -->
					
					<form name="f" action="croom_deleteProc.jsp">
					<table class="table " style="text-align: center;"><!-- datatable -->
						<thead>
							<tr>
								<th scope="col">
									<input class="form-check-input me-1" type="checkbox" name="allchk" onclick="delAll()">
								</th>
								<th scope="col">No</th>
								<th scope="col">교실명</th>
								<th scope="col">담당교사</th>
								<th scope="col">연령</th>
								<th scope="col">수정</th>
							</tr>
						</thead>
						<tbody>
							<%for(int i=0; i<clist.size(); i++){%>
								<tr>
									<td>
										<input class="form-check-input me-1" type="checkbox" name="rowchk" value="<%=clist.get(i).getC_no()%>">
									</td>
									<th><%=i+1%></th>
									<td><%=clist.get(i).getC_name()%></td>
									<td>
									<%
									ArrayList<UsersBean> ulist = udao.getUnameByCno(clist.get(i).getC_no());
									if(ulist.size() == 0){
										out.print("교사 미배정");
									}else{
										for(UsersBean ubl : ulist){
											out.print(ubl.getU_name() + "(" + ubl.getId() + ")");
										}
									}
									%>
									</td>
									<td>만 <%=clist.get(i).getC_age()%>세</td>
									<td>
										<button type="button" class="btn btn-outline-danger btn-sm">수정</button>
									</td>
								</tr>
							<%}%>
						</tbody>
					</table>
					</form>
					<!-- End Table with stripped rows -->

				</div>
			</div>

		</div>
	</div>
</section>

<%@ include file="home_bottom.jsp"%>