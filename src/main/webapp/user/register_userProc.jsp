<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 교사 회원가입 페이지 -->

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ub" class="info.UsersBean"/>

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

<%
	ub.setC_no(0);
	ub.setApproval("N"); // 원장은 승인 필요없음!

	String terms = request.getParameter("terms"); // null, on
	if(terms != null){ // 약관동의했으면
		ub.setTerms("Y");
	}

%>