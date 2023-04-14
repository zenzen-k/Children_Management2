<%@page import="children.ObserveBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.ObserveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>

<title>Home / ChildManagement / Observations</title>
<div class="pagetitle">
	<h1>관찰일지</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/observations.jsp">관찰일지</a></li>
			<li class="breadcrumb-item active">관찰일지게시판</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<%
	request.setCharacterEncoding("UTF-8");

	String s_no = request.getParameter("s_no");
	String c_no = request.getParameter("c_no");
	String s_name = request.getParameter("s_name");
	String s_birth = request.getParameter("s_birth");
	
	ObserveDao odao = ObserveDao.getInstance();
	ArrayList<ObserveBean> olist = null;
	int count = odao.getCountBySno(s_no);
	if(count > 0){
		olist = odao.getAllObserveBySno(s_no);
	}
	
%>


<section class="section">
	<div class="row">
		<div class="col-lg-12">

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						<%=s_name%>(<%=s_no%>, <%=s_birth%>) 관찰일지
						<input class="btn btn-outline-primary" type="button" value="글쓰기" style="float: right;"
						onclick="location.href='observations_Write.jsp?s_no=<%=s_no%>&s_name=<%=s_name%>&s_birth=<%=s_birth%>&c_no=<%=c_no%>'">
					</h5>
					
					<!-- 게시판 테이블 시작 -->
					<%if(count == 0){%>
						<table>
							<tr>
								<td align="center">
									저장된 글이 없습니다.
								</td>
							</tr>
						</table>
					
					<%}else{%>
						<table class="table datatable">
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">관찰일</th>
								</tr>
							</thead>
							<tbody>	
								<%
								for(int i=0; i<olist.size(); i++){
								%>
								<tr>
									<td align="center"><%=count--%></td>
									<td align="center">
										<a href="observations_Update.jsp?s_no=<%=s_no%>&s_name=<%=s_name%>&s_birth=<%=s_birth%>&c_no=<%=c_no%>&o_no=<%=olist.get(i).getO_no()%>"><%=olist.get(i).getO_title()%></a>
									</td>
									<td align="center"><%=olist.get(i).getWriter()%>(<%=olist.get(i).getWriterid()%>)</td>
									<td align="center"><%=olist.get(i).getOdate()%></td>
								</tr>
								<%
								}
								%>
							</tbody>	
						</table>
					<%}//if%>
				</div>
			</div>
			
		</div>
	</div>
</section>

<%@ include file="../userPage/home_bottom.jsp"%>