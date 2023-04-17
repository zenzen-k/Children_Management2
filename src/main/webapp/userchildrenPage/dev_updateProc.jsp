<%@page import="children.DevContentDao"%>
<%@page import="children.DevelopmentalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dcb" class="children.DevContentBean"/>
<%
	String[] scope = request.getParameterValues("scope");
	String[] d_content = request.getParameterValues("d_content");
	String d_no = request.getParameter("d_no");
	String approve = request.getParameter("approve");
	
	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	DevContentDao dcdao = DevContentDao.getInstance();
	
	int cnt = 0;
	int cnt2 = 0;
	
	dcb.setD_no(Integer.parseInt(d_no));
	
	dcdao.delDev(d_no);
	for(int i=0; i<scope.length; i++){
		dcb.setD_content(d_content[i]);
		dcb.setScope(scope[i]);
		
		cnt2 += dcdao.insertDev(dcb);
	}
	
	if(cnt2 == scope.length){
		cnt2 = ddao.updateDev(d_no, approve);
		if(cnt2 == 1){
			%>
			<script>
				location.href='dev_insert.jsp';
			</script>
			<%
		}else{
			%>
			<script>
				alert('등록실패 02');
				location.href='dev_insert.jsp';
			</script>
			<%
		}
	}else{
		%>
		<script>
			alert('등록실패 01');
			location.href='dev_insert.jsp';
		</script>
		<%
	}
	
	
%>