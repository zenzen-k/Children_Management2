<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="home_top.jsp" %>

<%
	// 학기~
	Date now = new Date();
	int mon = now.getMonth();
	String semester = "";
	if(mon>=2 && mon<=7){
		semester = "1";
	}else{
		semester = "2";
	}
%>

<title>Home / Management / ObserveApproval</title>
<div class="pagetitle">
	<h1>평가관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">학생관리</a></li>
			<li class="breadcrumb-item active">평가관리</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<!-- top -->
<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=semester%>학기 발달평가 기간</h5>
			
			
		</div>
	</div>
</div><!-- top end -->

<!-- bottom -->
<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">승인요청</h5>
			<button type="button" class="btn btn-outline-primary" style="float: right;" onclick="delSelct()">선택승인</button>
					
					<form name="f" action="">
					<table class="table " style="text-align: center;">
						<thead>
							<tr>
								<th scope="col">
									<input class="form-check-input me-1" type="checkbox" name="allchk" onclick="delAll()">
								</th>
								<th scope="col">No</th>
								<th scope="col">학생이름</th>
								<th scope="col">교사이름</th>
								<th scope="col">교실</th>
								<th scope="col">상세보기</th><!-- 상세보기를 클릭하면 팝업창처럼 내용이 뜨도록 -->
							</tr>
						</thead>
						<tbody>
							<%// 가입승인이 없으면 
							if(){
								out.print("<tr><td colspan='6'> 승인요청이 없습니다. </td></tr>");
							}else{
							%>
								<tr>
									<td>
										<input class="form-check-input me-1" type="checkbox" name="rowchk" value="">
									</td>
									<td><%=%></td> 
								</tr>
							<%
							}
							%>
						</tbody>
					</table>
					</form>
			
		</div>
	</div>
</div><!-- bottom end -->

<%@ include file="home_bottom.jsp" %>