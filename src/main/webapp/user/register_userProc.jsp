<%@page import="info.UsersDao"%>
<%@page import="info.KindergartenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 교사 회원가입 페이지 -->

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
<jsp:setProperty property="e_no" name="ub"/>

<jsp:setProperty property="k_name" name="kb"/>

<%
	ub.setC_no(1); // 1 : 교실 미배정 상태
	ub.setApproval("N"); // 교사 승인 필요

	String terms = request.getParameter("terms"); // null, on
	if(terms != null){ // 약관동의했으면
		ub.setTerms("Y");
	}
	
	KindergartenDao kdao = KindergartenDao.getInstance();
	UsersDao udao = UsersDao.getInstance();
	int result = kdao.getKinderByKnum(kb.getK_name());
	ub.setK_no(result);
	
	String msg = "";
	String url = "";
	
	int cnt2 = udao.insertUsers(ub);
	if(cnt2 == 1){
		msg = "회원가입 완료";
		url = request.getContextPath() + "/login.jsp";
	}else{
		msg = "회원가입 실패";
		url = request.getContextPath() + "/main.jsp";
	}
%>

<script>
	alert('<%=msg%>');
	location.href="<%=url%>";
</script>