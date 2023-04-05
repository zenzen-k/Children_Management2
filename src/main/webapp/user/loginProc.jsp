<%@page import="info.UsersBean"%>
<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UsersDao udao = UsersDao.getInstance();
	UsersBean ub = udao.getUserInfo(id, pw);
	
	String msg = "";
	String url = "";
	
	if(ub!=null && ub.getApproval().equals("Y")){
		session.setAttribute("sid", ub.getId());
		msg = "로그인 성공";
		url = request.getContextPath() + "/userPage/home.jsp";
	}else if(ub!=null && ub.getApproval().equals("N")){
		msg = "관리자 승인 대기중";
		url = request.getContextPath() + "/login.jsp";
	}else{
		msg = "로그인 실패";
		url = request.getContextPath() + "/login.jsp";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>