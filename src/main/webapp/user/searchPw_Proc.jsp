<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String u_name = request.getParameter("u_name");
	String email = request.getParameter("email");
	
	UsersDao udao = UsersDao.getInstance();
	String pw = udao.getSearchPw(id, u_name, email);
	
	boolean re = false;
	if(pw != null){//패스워드 정보가 있다면
		re = true;
	}
%>

<%@ include file="modal_pw.jsp" %>