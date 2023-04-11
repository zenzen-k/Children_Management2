<%@page import="children.PhysicalDevDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pb" class="children.PhysicalDevBean"/>
<jsp:setProperty property="*" name="pb"/>
<%
	PhysicalDevDao pdao = PhysicalDevDao.getInstance();
	int cnt = pdao.updatePhysical(pb);
	
	String msg = "수정 실패";
	//String url = request.getContextPath() + "/userchildrenPage/children.jsp?searchC_no=0&selectS_no=" + pb.getS_no();
	
	if(cnt == 1){
		msg = "수정 성공";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>