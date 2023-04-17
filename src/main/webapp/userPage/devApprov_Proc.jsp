<%@page import="children.DevelopmentalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] d_no = request.getParameterValues("rowchk");
	String approve = request.getParameter("approve");
	
	System.out.println("approve : " + approve);
	
	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	
	int cnt = 0;
	for(int i=0; i<d_no.length; i++){
		cnt += ddao.updateDev(d_no[i], approve);
	}
	
	String msg = "처리실패";
	if(cnt == d_no.length){
		msg = "처리완료";
	}
%>


<script>
	alert('<%=msg%>');
	location.href='devApproval.jsp';
</script>
