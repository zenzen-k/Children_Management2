<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String u_name = request.getParameter("u_name");
	String email = request.getParameter("email");
	
	UsersDao udao = UsersDao.getInstance();
	String id = udao.getSearchId(u_name, email);
	
	boolean re = false;
	if(id != null){//아이디 정보가 있다면
		re = true;
	}
%>

<%@ include file="modal_id.jsp" %>