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
	
	String s_no = sdao.insertSno(mr.getParameter("entran"));
	//System.out.println("s_no : " + s_no);
	
	int cnt = sdao.insertStudent(mr, skno, s_no);
	
	String msg = "";
	String url = "";
	
	if(cnt == 1){
		// 학생등록 성공시 가족테이블 값 삽입, 신체발달 값 정보 생성하기.
		
		
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