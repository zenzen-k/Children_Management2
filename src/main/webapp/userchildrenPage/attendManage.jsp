<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="children.chJoinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<style>
	#t{
		text-align: center;
	}
	#scrolltable { 
		height: 480;
		overflow-x: hidden;
	}
	#scrolltable table { 
		white-space: nowrap; /* 줄바꿈막아줌 */
	}
</style>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>

<%
	//System.out.println("skno : " + skno + ", scno : " + scno);
	
	//오늘 날짜
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//String nowDate = sdf.format(now);
	//System.out.println(nowdate);
	
	String searchDate = request.getParameter("searchDate");
	if(searchDate == null){
		searchDate = sdf.format(now);
	}
	
	ArrayList<chJoinBean> alist = null;
	if(scno == 0){ // 원장
		alist = adao.getAttendMng(skno, searchDate);
	}else if(scno == 1){ // 미정
		
	}else{ // 담당교사
		alist = adao.getAttendMng(skno, scno, searchDate);
	}
%>

<title>Home / ChildManagement / AttendManage</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item active">출석관리</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<div class="row">
	<div class="col-lg-5" >
		<!-- Default Card -->
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">출석 테이블</h5>

				<form name="f" action="attendInsUp.jsp" method="post">
				날짜선택
				<input type="date" id="dat" name="adate">
				<button type="button" class="btn btn-outline-primary" style="margin-left: 10" onclick="searchTable()">조회</button>
				<input type="submit" class="btn btn-outline-primary" style="float: right;" value="저장">
				<br><br>
				
				<div id="scrolltable">
				<table class="table table-striped" id="t">
					<thead>
					<tr>
						<th>No</th>
						<th>학번</th>
						<th>이름</th>
						<th>출석<input type="checkbox" class="form-check-input me-1"  name="allAttend" onclick="allCheckA"></th>
						<th>조퇴</th>
					</tr>
					</thead>
					<tbody>
					
					<%
					if(scno == 1){
						out.print("<tr><td colspan='5'> 담당 교실이 없습니다.</td></tr>");
					}else{
						for(int i=0; i<alist.size(); i++){
						%>
						<tr>
							<td><%=i+1%></td>
							<td><%=alist.get(i).getS_no()%>
							<input type="hidden" name="allstudents" value="<%=alist.get(i).getS_no()%>">
							</td>
							<td><%=alist.get(i).getS_name()%></td>
							<!-- value에 학번을 넣어서 넘기고 학번이 있으면 -->
							<td><input type="checkbox" class="form-check-input me-1" name="rowA" value="<%=alist.get(i).getS_no()%>" <%if(alist.get(i).getAttend()==1){%>checked<%}%>></td>
							<td><input type="checkbox" class="form-check-input me-1" name="rowE" value="<%=alist.get(i).getS_no()%>" <%if(alist.get(i).getEarlier()==1){%>checked<%}%>></td>
						</tr>
						<%
						}
					}
					%>
					</tbody>
				</table>
				</div>
				</form>
			</div>
		</div>
		
	</div>
</div>

<script>
	document.getElementById('dat').value = '<%=searchDate%>';
</script>

<%@ include file="../userPage/home_bottom.jsp"%>