<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String[] id = request.getParameterValues("rowchk");
	
	UsersDao udao = UsersDao.getInstance();
	int cnt = udao.updateApproval(id);
	
	String msg = "승인 실패";
	String url = request.getContextPath() + "/userPage/approval.jsp";
	
	if(cnt == id.length){
		msg = "승인 성공";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>