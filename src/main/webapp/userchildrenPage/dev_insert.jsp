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
%>
<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>

<title>Home / ChildManagement / developmental</title>
<div class="pagetitle">
	<h1>발달평가</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/developmental.jsp">발달평가</a></li>
			<li class="breadcrumb-item active">발달평가작성</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->


<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=year%>년 <%=semester%>학기 발달평가 작성</h5>
				<%if(scno == 0){
					out.print("관리자는 평가작성이 불가능 합니다.");
				}else{
				%>
					<button type="button" class="btn btn-primary" style="float: right; display: block;" onclick="location.href='dev_insertForm.jsp'">발달평가 작성하기</button>
					<p>승인완료된 글은 아래 게시글에서 확인 불가능합니다. <a href="developmental.jsp">발달평가</a>에서 확인바랍니다.</p>
					<p><font color="blue">승인대기중 : 작성한 게시글이 승인 대기중으로 수정 및 삭제가 불가능합니다.</font></p>
					<p><font color="red">승인거절 : 승인이 거절된 상태로 수정 및 삭제 가능합니다.</font></p>
					<p>작성중 : 작성중인 게시글로 작성자만 볼 수 있으며, 수정 및 삭제가 가능합니다.</p>
					
					<table class="table datatable">
						<thead>
							<tr>
								<th scope="col">평가지번호</th>
								<th scope="col">학생이름(학번)</th>
								<th scope="col">평가실시일</th>
								<th scope="col">작성자</th>
								<th scope="col">승인상태</th>
							</tr>
						</thead>
						<tbody>
							<%
							if(dlist.size() == 0){
								out.print("<tr><td colspan='5' align='center'>작성된 글이 없습니다.</td</tr>");
							}
							for(DevelopmentalBean db : dlist){
							%>
								<tr>
								  <th scope="row"><%=db.getD_no()%></th>
								  <td><a href="dev_update.jsp?d_no=<%=db.getD_no()%>"><%=db.getS_no()%></a></td>
								  <td>만 <%=db.getC_age()%>세 <%=db.getSemester()%>학기</td>
								  <td><%=db.getWriter()%>(<%=db.getWriterid()%>)</td>
								  <td><%=db.getApprove()%></td>
								</tr>
							<%
							}
							%>
						</tbody>
					</table>
				<%
				}%>
			
		</div>
	</div>
</div>

<%@ include file="../userPage/home_bottom.jsp"%>