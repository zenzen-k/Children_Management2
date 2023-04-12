<%@page import="children.AttendManageDao"%>
<%@page import="children.AttendManageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 날짜가 저장되어있으면 update, 없으면 insert 해야함 -->

<%
	// 넘어온 체크박스 데이터에는 출석(조퇴)한 학생의 학번이 들어가 있음.
	// 전체(반) 학생들의 학번 가져오기
	
	// 학번과 출석학번 비교, 출석 학번이 있으면 출석부객체의 attend 1, absence 0, 없으면 반대로
	// 출석 학번중 조퇴한 사람이 있으면 earlier 1, 나머지는 0
	
	// DAO 로 객체를 한번에 보낼라햇는데 학생마다 insert, update 가 달라질수있움
	// 만약 오늘 출석한뒤 새 인원을 추가하면 insert, update가 꼬여버린당, 반복으로 dao 실행해야할듯 ,'???????
	
	String[] allstudents = request.getParameterValues("allstudents"); // 전체 학생
	String[] rowA = request.getParameterValues("rowA"); // 출결여부(학번들어가있음)
	String[] rowE = request.getParameterValues("rowE"); // 조퇴여부
	String adate = request.getParameter("adate"); // 출석날짜
	
	/* for(String s : rowA){
		out.print(s + " ");
	}  */
	
	AttendManageDao adao = AttendManageDao.getInstance();
	int cnt = -2;
	for(int i=0; i<allstudents.length; i++){
		AttendManageBean ab = new AttendManageBean();
		ab.setS_no(allstudents[i]);
		ab.setAdate(adate);
		ab.setEarlier(0);
		
		if(rowA != null){
			for(int j=0; j<rowA.length; j++){
				if(allstudents[i].equals(rowA[j])){
					ab.setAttend(1);
					ab.setAbsence(0);
					break;
				}else{
					ab.setAttend(0);
					ab.setAbsence(1);
				}
			}
		}
		
		if(rowE != null){
			for(int j=0; j<rowE.length; j++){
				if(allstudents[i].equals(rowE[j])){
					ab.setEarlier(1);
					ab.setAttend(0);
					ab.setAbsence(0);
				}
			}
		}
		/*
		out.println("<br><br>");
		out.println("ab.getS_no() : " + ab.getS_no());
		out.println("ab.getAdate() : " + ab.getAdate());
		out.println("ab.getEarlier() : " + ab.getEarlier());
		out.println("ab.getAttend() : " + ab.getAttend());
		out.println("ab.getAbsence() : " + ab.getAbsence());
		out.println("<br><br>");
		*/
		
		// true 면 날짜데이터있음
		boolean oldDate = adao.getOldDate(allstudents[i], adate);
		out.println("oldDate : " + oldDate);
		
		if(oldDate){
			// update
			//out.println("update");
			cnt = adao.updateAttend(ab);
		}else{
			// insert
			//out.println("insert");
			cnt = adao.insertAttend(ab);
		}
	}
	
	//out.println("<br><br>");
	
	//System.out.println("cnt : " + cnt);
	
	if(cnt == 1){
	%>
	<script>
		location.href="attendManage.jsp?searchDate=<%=adate%>";
	</script>
	<%
	}
%>