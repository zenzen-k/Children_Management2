<%@page import="info.ClassroomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cb" class="info.ClassroomBean"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	int skno = (Integer)session.getAttribute("skno");
	String c_name = request.getParameter("c_name");
	int c_age = Integer.parseInt(request.getParameter("c_age"));
	
	cb.setK_no(skno);
	cb.setC_name(c_name);
	cb.setC_age(c_age);
	
	//System.out.println("c_name : " + c_name + ", c_age: " + c_age);
	ClassroomDao cdao = ClassroomDao.getInstance();
	int cnt = cdao.insertCroom(cb);
	
	String msg = "등록 실패";
	String url = request.getContextPath() + "/userPage/croomMng.jsp";
	
	if(cnt == 1){
		msg = "등록 성공";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>