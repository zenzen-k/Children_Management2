<%@page import="info.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid = request.getParameter("userid");

	UsersDao udao = UsersDao.getInstance();
	boolean result = udao.searchId(userid);
	
	if(result){
		out.print("N"); // 있으면 사용 불가
	}else{
		out.print("Y");
	}
%>