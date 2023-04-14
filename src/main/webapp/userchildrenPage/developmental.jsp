<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<%
	// 학기~
	Date now = new Date();
	int mon = now.getMonth();
	//System.out.println("mon : " + mon);
	String semester = "";
	if(mon>=2 && mon<=7){
		semester = "1";
	}else{
		semester = "2";
	}
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
			<li class="breadcrumb-item active">발달평가</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->


<input type="button" value="인쇄하기" id="print" onclick="window.print()" style="float: right;"/>

<!-- top -->
<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=semester%>학기 발달평가 기간</h5>
			
			
		</div>
	</div>
</div><!-- top end -->

<!-- 테이블 영역 -->
<div class="row">
	<!-- 왼쪽 -->
	<div class="col-lg-5" >
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">유아조회</h5>
				
				<table>
					<tr>
						<th>NO</th>
						<th>학번</th>
						<th>이름</th>
						<th>반</th>
						<th>담당교사</th>
						<th>승인상태</th>
					</tr>
				</table>
				
			</div>
		</div>
	</div><!-- 왼쪽end -->
	
	<!-- 오른쪽 -->
	<div class="col-lg-7" > 
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">발달평가</h5>
				
			</div>
		</div>
	</div><!-- 오른쪽end -->
	
</div> <!-- row -->

<!-- 내용(인쇄) -->

<%@ include file="../userPage/home_bottom.jsp"%>