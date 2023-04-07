<%@page import="info.ClassroomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="cb" class="info.ClassroomBean"/>
<jsp:setProperty property="*" name="cb"/>

<%
	int skno = (Integer)session.getAttribute("skno");
	cb.setK_no(skno);
	ClassroomDao cdao = ClassroomDao.getInstance();
	int cnt = cdao.updateCroom(cb);
	
	String msg = "수정 실패";
	String url = request.getContextPath() + "/userPage/croomMng.jsp";
	
	if(cnt == 1){
		msg = "수정 성공";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>