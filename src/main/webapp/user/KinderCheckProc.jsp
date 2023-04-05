<%@page import="info.KindergartenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userKinder = request.getParameter("userKinder");

	KindergartenDao kdao = KindergartenDao.getInstance();
	boolean result = kdao.searchKinder(userKinder);
	
	if(result){
		out.print("N"); // 있으면 사용 불가 / 교사는 있으면 사용가능
	}else{
		out.print("Y");
	}
%>