<%@page import="children.AttendManageBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="children.chJoinBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<style>
	table{
		text-align: center;
	}
	#scrolltable { 
		height: 430;
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
	String selectSno = request.getParameter("selectSno");
	String selectSname = request.getParameter("selectSname");
	String startdate = request.getParameter("startdate");
	String enddate = request.getParameter("enddate");
	
	
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
	<h1>출석관리</h1>
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
	<!-- 왼쪽 -->
	<div class="col-lg-6" >
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">출석정보 조회</h5>
				
				<form name="f" action="attendProc.jsp" method="post">
				날짜선택
				<input type="date" id="dat" name="adate">
				<button type="button" class="btn btn-outline-primary" style="margin-left: 10" onclick="searchTable()">조회</button>
				<input type="submit" class="btn btn-outline-primary" style="float: right;" value="저장">
				<br><br>
				
				<!-- 스크롤영역 -->
				<div id="scrolltable">
				<table class="table table-striped" id="t">
					<thead>
					<tr>
						<th>No</th>
						<th>학번</th>
						<th>이름</th>
						<th>출석<input type="checkbox" class="form-check-input me-1" name="allAttend" onclick="allCheckA()"></th>
						<th>조퇴</th>
					</tr>
					</thead>
					<tbody>
					
					<%
					int todayAttend =0;
					int todayAbsence =0;
					int todayEarlier =0;
					if(scno == 1){
						out.print("<tr><td colspan='5'> 담당 교실이 없습니다.</td></tr>");
					}else{
						for(int i=0; i<alist.size(); i++){
						%>
						<tr>
							<td><%=i+1%></td>
							<td>
								<a href="attendManage.jsp?selectSname=<%=alist.get(i).getS_name()%>&selectSno=<%=alist.get(i).getS_no()%>"><%=alist.get(i).getS_no()%></a>
								<input type="hidden" name="allstudents" value="<%=alist.get(i).getS_no()%>">
							</td>
							<td><%=alist.get(i).getS_name()%></td>
							<!-- value에 학번을 넣어서 넘기고 학번이 있으면 -->
							<td><input type="checkbox" class="form-check-input me-1" name="rowA" value="<%=alist.get(i).getS_no()%>" <%if(alist.get(i).getAttend()==1){ %>checked<%}%>></td>
							<td><input type="checkbox" class="form-check-input me-1" name="rowE" value="<%=alist.get(i).getS_no()%>" <%if(alist.get(i).getEarlier()==1){ %>checked<%}%>></td>
						</tr>
						<%
							if(alist.get(i).getAttend()==1){
								todayAttend++;
							}else if(alist.get(i).getAttend()!=1 && alist.get(i).getEarlier()!=1){
								todayAbsence++;
							}
							if(alist.get(i).getEarlier()==1){
								todayEarlier++;
							}
						}
					}
					%>
					</tbody>
				</table>
				</div>
				
				</form>
			</div>
		</div>
		
		<div class="card">
			<div class="card-body">
			
			<table width='100%'>
				<tr>
					<td class="card-title"><%=searchDate %> 출석 정보</td>
				<tr>
					<td>
						<font color='green'>출석인원 : <%=todayAttend%> 명</font>
						<font color='red'>결석인원 : <%=todayAbsence%> 명</font>
						<font color='gray'>조퇴인원 : <%=todayEarlier%> 명</font>
					</td>
				</tr>
				</table>
			
			</div>
		</div>
		
	</div>
	
	<!-- 오른쪽 -->
	<div class="col-lg-6" > 
	
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">개인 출석 정보</h5>
				<%
				if(selectSno == null){
					out.print("상세조회 할 학번을 클릭하세요");
				}else{
					out.print("<span>" + selectSname + " (" + selectSno + ")</span>");
				%>
					<form action="attendManage.jsp">
					<div style="margin-top: 30">
						조회기간<br>
						<input type="date" id="start" name="startdate"> <font style="margin-left: 10; margin-right: 10;">부터</font> 
						<input type="date" id="end" name="enddate">
						<input type="hidden" name="selectSno" value="<%=selectSno%>">
						<input type="hidden" name="selectSname" value="<%=selectSname%>">
						<input type="submit" class="btn btn-outline-primary" style="margin-left: 10" onclick="return dateCheck()" value="조회">
					</div>
					
					</form>
					<div style="margin-top: 30">
						
						<div id="scrolltable">
						<table class="table table-bordered">
							<tr>
								<th>날짜</th>
								<th>출석여부</th>
							</tr>
							<%
							if(startdate == null || enddate == null || startdate == "" || enddate == ""){
								out.print("<tr><td colspan='2'>조회할 기간을 클릭해주세요</td></tr>");
							}
							else{
								ArrayList<AttendManageBean> alists = adao.getAttendBySno(selectSno, startdate, enddate);
								
								int sumAttend = 0;
								int sumAbsence = 0;
								int sumEarlier = 0;
								
								for(AttendManageBean ab : alists){
								%>
								<tr>
									<td><%=ab.getAdate()%></td>
									<td>
									<%
									if(ab.getAttend()==1){
										out.print("<font color='green'>출석</font>");
										sumAttend++;
									}
									else if(ab.getAbsence()==1){
										out.print("<font color='red'>결석</font>");
										sumAbsence++;
									}
									else if(ab.getEarlier()==1){
										out.print("<font color='gray'>조퇴</font>");
										sumEarlier++;
									}
									%>
									</td>
								</tr>
								<%
								}
								%>
								<tr>
									<td colspan="2">
										기간별 <font color='green'>출석일수 : <%=sumAttend%> </font>
										<font color='red'>결석일수 : <%=sumAbsence%> </font>
										<font color='gray'>조퇴일수 : <%=sumEarlier%> </font>
									</td>
								</tr>
								<%
								
							}
							%>
						</table>
						</div>
					</div>
				<%
				} // else(selectSno != null)
				%>
			</div>
		</div>
	</div>
</div>

<script>
	document.getElementById('dat').value = '<%=searchDate%>';
	document.getElementById('start').value = '<%=startdate%>';
	document.getElementById('end').value = '<%=enddate%>';
</script>

<%@ include file="../userPage/home_bottom.jsp"%>