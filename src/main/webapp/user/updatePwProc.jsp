<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String pw = request.getParameter("pw");
	String newpw = request.getParameter("newpw");
	String sid = (String)session.getAttribute("sid");
	
	UsersDao udao = UsersDao.getInstance();
	int cnt = udao.updatePw(sid, pw, newpw);
	
	if(cnt == 1){
		%>
			<script>
				alert('수정 완료');
				location.href="<%=request.getContextPath()%>/userPage/user_profile.jsp";
			</script>
		<%
		}else if(cnt == -2){
		%>
			<script>
				alert('비밀번호가 틀렸습니다. 다시 입력하세요');
				history.go(-1);
			</script>
		<%
		}else{
		%>
			<script>
				alert('수정 실패');
				location.href="<%=request.getContextPath()%>/userPage/user_profile.jsp";
			</script>
		<%
		}
%>