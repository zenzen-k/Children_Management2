<%@page import="info.ClassroomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cb" class="info.ClassroomBean"/>
<%

	int skno = (Integer)session.getAttribute("skno");
	String[] no = request.getParameterValues("rowchk");
	
	/* for(String n : no){
		System.out.println("del c_no : " + n);
	} */
	
	//System.out.println("c_name : " + c_name + ", c_age: " + c_age);
	ClassroomDao cdao = ClassroomDao.getInstance();
	int cnt = cdao.deleteCroom(skno, no);
	
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