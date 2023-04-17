<%@page import="children.DevContentDao"%>
<%@page import="children.DevContentBean"%>
<%@page import="children.DevelopmentalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String approve = request.getParameter("approve");
%>

<jsp:useBean id="db" class="children.DevelopmentalBean"/>
<jsp:useBean id="dcb" class="children.DevContentBean"/>
<jsp:setProperty property="*" name="db"/>


<%
	String[] scope = request.getParameterValues("scope");
	String[] d_content = request.getParameterValues("d_content");

	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	DevContentDao dcdao = DevContentDao.getInstance();
	
	int cnt2=0;
	int dno = ddao.getDno(db);
	if(dno!=0){
	%>
		<script>
			alert('평가글이 이미 존재합니다. 글은 학생 한명 당 한학기에 한개만 작성 가능합니다. 기존글을 삭제하시거나 수정해주세요');
			location.href='developmental.jsp';
		</script>
	<%
	}else{
		int cnt = ddao.insertDev(db);
		if(cnt == 1){
			dno = ddao.getDno(db);
			dcb.setD_no(dno);
			
			for(int i=0; i<scope.length; i++){
				dcb.setScope(scope[i]);
				dcb.setD_content(d_content[i]);
				cnt2 += dcdao.insertDev(dcb);
			}
		}
	}
	
	if(cnt2 == scope.length){
	%>
	<script>
		location.href='dev_insert.jsp';
	</script>
	<%
	}else{
	%>
	<script>
		alert('등록실패');
		location.href='dev_insert.jsp';
	</script>
	<%
	}
	
%>

