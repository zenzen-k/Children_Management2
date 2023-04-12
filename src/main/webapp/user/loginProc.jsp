<%@page import="info.EmpDao"%>
<%@page import="info.UsersBean"%>
<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UsersDao udao = UsersDao.getInstance();
	UsersBean ub = udao.getUserLogin(id, pw); 
	EmpDao edao = EmpDao.getInstance();
	
	String msg = "";
	String url = "";
	
	if(ub!=null && ub.getApproval().equals("Y")){
		session.setAttribute("sid", ub.getId());
		session.setAttribute("seno", ub.getE_no());
		session.setAttribute("skno", ub.getK_no());
		session.setAttribute("scno", ub.getC_no());
		session.setAttribute("sename", edao.getEnameByEnum(ub.getE_no()));
		%>
		<script>
			location.href="<%=request.getContextPath()%>/userPage/home.jsp";
		</script>
		<%
	}else if(ub!=null && ub.getApproval().equals("N")){
		%>
		<script>
			alert('관리자 승인 대기중');
			location.href="<%=request.getContextPath()%>/login.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert('로그인 실패');
			location.href="<%=request.getContextPath()%>/login.jsp";
		</script>
		<%
	}
%>
