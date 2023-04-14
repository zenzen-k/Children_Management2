<%@page import="children.ObserveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String s_no = request.getParameter("s_no");
	String o_no = request.getParameter("o_no");
	String c_no = request.getParameter("c_no");
	String s_name = request.getParameter("s_name");
	String s_birth = request.getParameter("s_birth");

	ObserveDao odao = ObserveDao.getInstance();
	int cnt = odao.deleteObserve(o_no);
	
	if(cnt == 1){
		%>
			<script>
			location.href="observations_Board.jsp?s_no=<%=s_no%>&s_name=<%=s_name%>&s_birth=<%=s_birth%>&c_no=<%=c_no%>";
			</script>
		<%
		}else{
		%>
			<script>
				alert('삭제실패');
				history.go(-1);
			</script>
		<%
		}
		
	%>
%>