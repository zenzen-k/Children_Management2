<%@page import="info.ScheduleBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<%
	Date now = new Date();
	int nowYear = now.getYear() + 1900;
	int nowMonth = now.getMonth() + 1;
	
	//ArrayList<ScheduleBean> sclist = scdao.getAllSchedule(skno, nowYear);
	int countYear = scdao.yearCount(skno, nowYear);
%>

<style>
	.sctable{
		text-align: center;
		width: 100%;
		font-size: 
	}
	.sctr{
		height: 100px;
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
			<h1 align="center"><%=nowYear%>년 행사</h1>
			<hr>
			
			<table class="sctable table-bordered" >
				<%
				for(int i=1; i<=12; i++){
					int count = scdao.monthCount(skno, nowYear, i);
				%>
				<tr class="sctr">
					<td rowspan="<%if(count==0){out.print("1");}else{out.print(count);}%>"><b><%=i%>월</b></td>
					<%
					if(countYear==0){
						out.print("<td>등록된 일정이 없습니다.</td>");
					}else{
						ArrayList<ScheduleBean> sclist = scdao.getAllSchedule(skno, nowYear, i);
						for(ScheduleBean scb : sclist){
							if(scb.getEyear()==0){ // 하루일정
								%>
								<td><%=scb.getSmonth()%>월 <%=scb.getSdate()%>일</td>
								<td><%=scb.getS_title()%></td>
								<%
							}else{ // 여러날일정
								%>
								<td>
									<%=scb.getSmonth()%>월 <%=scb.getSdate()%>일<br>
									~<br>
									<%=scb.getSmonth()%>월 <%=scb.getSdate()%>일
								</td>
								<td><%=scb.getS_title()%></td>
								<%
							}
							
						}
					}
					%>
				</tr>
				<%
				}
				%>
			</table>
			
			
		</div><!-- cart body end -->
	</div>
</div>



<%@ include file="../userPage/home_bottom.jsp"%>