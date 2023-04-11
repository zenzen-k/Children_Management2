<%@page import="children.StudentDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 유치원번호
	int skno = (Integer)session.getAttribute("skno");

	String configFolder = config.getServletContext().getRealPath("/images/");
	MultipartRequest mr = new MultipartRequest(request, configFolder, (1024*1024*5), "UTF-8");
	
	/* 주소는 k_addr로 들어감, 반번호와 나이 공백 기준으로 나눌것(c_no, c_age) */
	StudentDao sdao = StudentDao.getInstance();
	int cnt = sdao.insertStudent(mr, skno);
	
	String msg = "";
	String url = "";
	
	if(cnt == 1){
		msg = "등록성공";
		url = "children.jsp?searchC_no=0";
	}else{
		msg = "등록실패";
		url = "children.jsp?searchC_no=0";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>