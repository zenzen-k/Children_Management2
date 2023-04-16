<%@page import="info.ScheduleDao"%>
<%@page import="info.ScheduleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int skno = (Integer)session.getAttribute("skno");
	String s_title = request.getParameter("s_title");
	String s_date = request.getParameter("s_date");
	String e_date = request.getParameter("e_date");
	
	String[] sdate = s_date.split("-");
	String[] edate = e_date.split("-");
	
	ScheduleBean sb = new ScheduleBean();
	sb.setK_no(skno);
	sb.setS_title(s_title);
	sb.setSyear(Integer.parseInt(sdate[0]));
	sb.setSmonth(Integer.parseInt(sdate[1]));
	sb.setSdate(Integer.parseInt(sdate[2]));

	//System.out.println("년 : "  + sb.getSyear());
	//System.out.println("월 : "  + sb.getSmonth());
	//System.out.println("일 : "  + sb.getSdate());
	
	if(e_date == ""){
		//System.out.println(1);
		sb.setEyear(0);
		sb.setEmonth(0);
		sb.setEdate(0);
	}else{
		sb.setEyear(Integer.parseInt(edate[0]));
		sb.setEmonth(Integer.parseInt(edate[1]));
		sb.setEdate(Integer.parseInt(edate[2]));
	}
	
	ScheduleDao scdao = ScheduleDao.getInstance();
	int cnt = scdao.insertSchedule(sb);
	
	if(cnt == 1){
		%>
		<script>
			var result = confirm("등록완료. 일정을 더 등록하시겠습니까?");
			if(result){
				location.href="schedule_insert.jsp";
			}else{
				location.href="schedule.jsp";
			}
		</script>
		<%
	}else{
		%>
		<script>
			alert('등록실패');
			history.go(-1);
		</script>
		<%
	}
%>