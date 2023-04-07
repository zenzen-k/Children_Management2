<%@page import="info.JoinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="home_top.jsp"%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userPage/script.js"></script>

<%
	ArrayList<JoinBean> jlist = udao.getAllTeachers(skno);
%>

<title>Home / Management / Teacher</title>
<div class="pagetitle">
	<h1>교실관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item active">교사관리</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">교사조회</h5>
					<!-- Table with stripped rows -->
					
					<table class="table " style="text-align: center;"><!-- datatable -->
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">교사이름</th>
								<th scope="col">담당교실</th>
								<th scope="col">연령</th>
								<th scope="col">직급</th>
								<th scope="col">수정</th>
							</tr>
						</thead>
						<tbody>
							<%
							if(jlist.size()==0){
								out.print("<tr><td colspan='6'> 등록된 교사가 없습니다. </td></tr>");
							}else{
								for(int i=0; i<jlist.size(); i++){%>
									<tr>
										<th><%=i+1%></th>
										<td><%=jlist.get(i).getU_name()%></td>
										<td><%=jlist.get(i).getC_name()%></td>
										<td><%=jlist.get(i).getC_age()%></td>
										<td><%=jlist.get(i).getE_name()%></td>
										<td>
											<button type="button" class="btn btn-outline-danger btn-sm"
											 onclick="location.href='users_update.jsp?id=<%=jlist.get(i).getId()%>&c_no=<%=jlist.get(i).getC_no()%>&e_no=<%=jlist.get(i).getE_no()%>&u_name=<%=jlist.get(i).getU_name()%>&c_name=<%=jlist.get(i).getC_name()%>e_name=<%=jlist.get(i).getE_name()%>'">
											 수정</button>
										</td>
									</tr>
								<%
								}
							}%>
						</tbody>
					</table>
					<!-- End Table with stripped rows -->

				</div>
			</div>

		</div>
	</div>
</section>

<%@ include file="home_bottom.jsp"%>