<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String sid = (String)session.getAttribute("sid"); 
%>
<jsp:useBean id="ub" class="info.UsersBean"/>

<jsp:setProperty property="email" name="ub"/>
<jsp:setProperty property="u_hp1" name="ub"/>
<jsp:setProperty property="u_hp2" name="ub"/>
<jsp:setProperty property="u_hp3" name="ub"/>

<%
	ub.setId(sid);
	
	UsersDao udao = UsersDao.getInstance();
	int cnt =udao.updateUser(ub);

	String msg = "수정 실패";
	String url = request.getContextPath() + "/userPage/user_profile.jsp";
	
	if(cnt == 1){
		msg = "수정 완료";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>