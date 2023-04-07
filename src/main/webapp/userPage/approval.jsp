<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="home_top.jsp"%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userPage/script.js"></script>

<%
	// 가입 미승인된 유저 목록을 불러온다.
	ArrayList<UsersBean> ulist = udao.getApprovalForUser(skno);
%>

<title>Home / Management / Classroom</title>
<div class="pagetitle">
	<h1>교실관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item active">가입승인</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">가입승인</h5>
					<button type="button" class="btn btn-outline-primary" style="float: right;" onclick="delSelct()">선택승인</button>
					<!-- Table with stripped rows -->
					
					<form name="f" action="approval_Proc.jsp">
					<table class="table " style="text-align: center;"><!-- datatable -->
						<thead>
							<tr>
								<th scope="col">
									<input class="form-check-input me-1" type="checkbox" name="allchk" onclick="delAll()">
								</th>
								<th scope="col">No</th>
								<th scope="col">아이디</th>
								<th scope="col">교사이름</th>
								<th scope="col">직급</th>
								<th scope="col">연락처</th>
							</tr>
						</thead>
						<tbody>
							<%// 가입승인이 없으면 
							if(ulist.size() == 0){
								out.print("<tr><td colspan='6'> 가입신청한 교사가 없습니다. </td></tr>");
							}else{
								for(int i=0; i<ulist.size(); i++){
							%>
								<tr>
									<td>
										<input class="form-check-input me-1" type="checkbox" name="rowchk" value="<%=ulist.get(i).getId()%>">
									</td>
									<td><%=i+1%></td> 
									<td><%=ulist.get(i).getId()%></td>
									<td><%=ulist.get(i).getU_name()%></td>
									<td><%=edao.getEnameByEnum(ulist.get(i).getE_no())%></td>
									<td><%=ulist.get(i).getU_hp1()%> - <%=ulist.get(i).getU_hp2()%> - <%=ulist.get(i).getU_hp3()%></td>
								</tr>
							<%
								}
							}
							%>
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