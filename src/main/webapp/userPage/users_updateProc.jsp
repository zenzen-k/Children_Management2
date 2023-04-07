<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// id, c_no, e_no
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String c_no = request.getParameter("c_no");
	String e_no = request.getParameter("e_no");
	
	UsersDao udao = UsersDao.getInstance();
	int cnt = udao.updateUsersT(id, c_no, e_no);
	
	String msg = "수정 실패";
	String url = request.getContextPath() + "/userPage/usersMng.jsp";
	
	if(cnt == 1){
		msg = "수정 성공";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>