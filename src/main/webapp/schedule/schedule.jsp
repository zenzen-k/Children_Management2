<%@page import="info.ScheduleBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<%
	
	String reqYear = request.getParameter("year");
	
	int year = 0;
	if(reqYear == null){
		Date now = new Date();
		int nowYear = now.getYear() + 1900;
		int nowMonth = now.getMonth() + 1;
		year = nowYear;
	}else{
		year = Integer.parseInt(reqYear);
	}
	
	//ArrayList<ScheduleBean> sclist = scdao.getAllSchedule(skno, nowYear);
	int countYear = scdao.yearCount(skno, year);
%>

<style>
	.sctable{
		text-align: center;
		width: 100%;
		border-color: lightgray;
	}
	.sctr{
		height: 100px;
	}
	.table-bordered>:not(caption)>*>* {
	    border-width: 0 0px;
	}
	.stitle {
		padding: 30px;
		text-align: left;
	}
</style>

<title>Home / ChildManagement / Schedule</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/schedule/schedule.jsp">행사관리</a></li>
			<li class="breadcrumb-item active">행사일정</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<br>
			<h1 align="center"><a href="schedule.jsp?year=<%=year-1%>">&lt;</a>&nbsp;&nbsp;&nbsp;<%=year%>년 행사&nbsp;&nbsp;&nbsp;<a href="schedule.jsp?year=<%=year+1%>">&gt;</a></h1>
			<hr>
			
			<table class="sctable table-bordered" >
				<thead>
				<tr>
					<th colspan="3" style="height: 40px; border-top: none; background: lavender;">
						<input type="button" value="행사추가" class="btn btn-outline-secondary btn-sm" style="float: right; margin-right: 10" onclick="location.href='schedule_insert.jsp'">
					</th>
				</tr>
				</thead>
				<!-- <colgroup>
					<col style="width:15%;">
					<col style="width:20%;">
					<col style="width:*;">
				</colgroup> -->
				<tbody>
				<%
				for(int i=1; i<=12; i++){
					int count = scdao.monthCount(skno, year, i);
					int index = 0;
				%>
				<tr class="sctr" >
					<td rowspan="<%if(count==0){out.print("1");}else{out.print(count);}%>" bgcolor="ghostwhite"><b><%=i%>월</b></td>
				
				<%
				if(count==0){
					out.print("<td colspan='2'>등록된 일정이 없습니다.</td><tr>");
				}else{
					ArrayList<ScheduleBean> sclist = scdao.getAllSchedule(skno, year, i);
					for(ScheduleBean scb : sclist){
						if(index==0) {
							if(scb.getEyear()==0){ // 하루일정
								%>
									<td><%=scb.getSmonth()%>월 <%=scb.getSdate()%>일</td>
									<td class="stitle" style="border-left: 1px solid lightgray;"><%=scb.getS_title()%></td>
								<%
							}else{ // 여러날일정
								%>
									<td>
										<%=scb.getSmonth()%>월 <%=scb.getSdate()%>일 
										~ 
										<%=scb.getEmonth()%>월 <%=scb.getEdate()%>일
									</td>
									<td class="stitle" style="border-left: 1px solid lightgray;"><%=scb.getS_title()%></td>
								<%
							} // if
						} else {
							if(scb.getEyear()==0){ // 하루일정
								%>
								<tr class="sctr">
									<td><%=scb.getSmonth()%>월 <%=scb.getSdate()%>일</td>
									<td class="stitle" style="border-left: 1px solid lightgray;"><%=scb.getS_title()%></td>
								<%
							}else{ // 여러날일정
								%>
								<tr class="sctr">
									<td>
										<%=scb.getSmonth()%>월 <%=scb.getSdate()%>일 
										~ 
										<%=scb.getEmonth()%>월 <%=scb.getEdate()%>일
									</td>
									<td class="stitle" style="border-left: 1px solid lightgray;"><%=scb.getS_title()%></td>
								<%
							} // if
						}
						index++;
						
					} // for
				} //if(countYear)
				%>
				</tr>
				<%
				}
				%>
				</tbody>
			</table>
			
			
		</div><!-- cart body end -->
	</div>
</div>



<%@ include file="../userPage/home_bottom.jsp"%>