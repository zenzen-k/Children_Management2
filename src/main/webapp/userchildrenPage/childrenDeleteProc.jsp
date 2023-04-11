<%@page import="children.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String[] s_no = request.getParameterValues("rowchk");

	StudentDao sdao = StudentDao.getInstance();
	
	// 선택 학생 삭제
	int cnt = sdao.deleteCheck(s_no);
	
	String msg = "삭제 실패";
	String url = request.getContextPath() + "/userPage/croomMng.jsp";
	
	if(cnt == no.length){
		msg = "삭제 성공";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>