<%@page import="info.UsersDao"%>
<%@page import="info.KindergartenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자 회원가입 처리 페이지 -->

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ub" class="info.UsersBean"/>
<jsp:useBean id="kb" class="info.KindergartenBean"/>

<jsp:setProperty property="id" name="ub"/>
<jsp:setProperty property="pw" name="ub"/>
<jsp:setProperty property="u_name" name="ub"/>
<jsp:setProperty property="u_rrn1" name="ub"/>
<jsp:setProperty property="u_rrn2" name="ub"/>
<jsp:setProperty property="email" name="ub"/>
<jsp:setProperty property="u_hp1" name="ub"/>
<jsp:setProperty property="u_hp2" name="ub"/>
<jsp:setProperty property="u_hp3" name="ub"/>

<jsp:setProperty property="k_addr1" name="kb"/>
<jsp:setProperty property="k_addr2" name="kb"/>
<jsp:setProperty property="k_addr3" name="kb"/>
<jsp:setProperty property="k_name" name="kb"/>
<%
	ub.setE_no(501); // 원장가입~!
	ub.setC_no(0);
	ub.setApproval("Y"); // 원장은 승인 필요없음!
	
	String terms = request.getParameter("terms"); // null, on
	if(terms != null){ // 약관동의했으면 ( 유효성검사 하기 )
		ub.setTerms("Y");
	}
	
	KindergartenDao kdao = KindergartenDao.getInstance();
	int cnt = kdao.insertKinder(kb);
	
	String msg = "";
	String url = "";
	if(cnt == 1){
		int result = kdao.getKinderByKname(kb.getK_name());
		ub.setK_no(result);
		UsersDao udao = UsersDao.getInstance();
		int cnt2 = udao.insertUsers(ub);
		if(cnt2 == 1){
			msg = "회원가입 완료";
			url = request.getContextPath() + "/login.jsp";
		}else{
			msg = "회원가입 실패";
			url = request.getContextPath() + "/main.jsp";
		}
	}else{
		msg = "유치원 등록실패";
		url = request.getContextPath() + "/main.jsp";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>
