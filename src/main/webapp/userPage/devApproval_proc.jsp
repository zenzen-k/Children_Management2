<%@page import="children.DevDateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="deb" class="children.DevDateBean"/>
<jsp:setProperty property="*" name="deb"/>

<%
	DevDateDao dedao = DevDateDao.getInstance();
	int cnt = dedao.searchDevdateInUp(deb);
	if(cnt == 1){
		%>
		<script>
			alert('등록완료');
			location.href='devApproval.jsp';
		</script>
		<%
	}else{
		%>
		<script>
			alert('등록실패');
			location.href='devApproval.jsp';
		</script>
		<%
	}
%>