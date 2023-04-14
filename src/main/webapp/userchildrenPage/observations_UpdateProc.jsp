<%@page import="children.ObserveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String s_name = request.getParameter("s_name");
	String s_birth = request.getParameter("s_birth");
%>

<jsp:useBean id="ob" class="children.ObserveBean"/>
<jsp:setProperty property="*" name="ob"/>

<%
	
	ObserveDao odao = ObserveDao.getInstance();
	int cnt = odao.updateObserve(ob);
	
	if(cnt == 1){
	%>
		<script>
			location.href="observations_Board.jsp?s_no=<%=ob.getS_no()%>&s_name=<%=s_name%>&s_birth=<%=s_birth%>&c_no=<%=ob.getC_no()%>";
		</script>
	<%
	}else{
	%>
		<script>
			alert('수정실패');
			location.href="observations_Board.jsp?s_no=<%=ob.getS_no()%>&s_name=<%=s_name%>&s_birth=<%=s_birth%>&c_no=<%=ob.getC_no()%>";
		</script>
	<%
	}
	
%>
