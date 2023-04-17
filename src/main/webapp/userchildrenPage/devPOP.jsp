<%@page import="children.DevJoin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.DevelopmentalDao"%>
<%@page import="children.StudentBean"%>
<%@page import="children.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();

	String c_age = request.getParameter("c_age");
	String semester = request.getParameter("semester");
	String s_no = request.getParameter("s_no");
	String approve = request.getParameter("approve");
	
	StudentDao sdao = StudentDao.getInstance();
	StudentBean sb = sdao.getStudentBySno(s_no);
	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	
	
	ArrayList<DevJoin> djlist = null;
	if(approve != null){
		djlist = ddao.getDevStu(s_no, Integer.parseInt(c_age), Integer.parseInt(semester));
	}else{
		djlist = ddao.getDevStuByApprove(s_no, Integer.parseInt(c_age), Integer.parseInt(semester));
	}
%>

<style type="text/css" media="print">
  .noprint{ display:none; }
</style>

<title><%=sb.getS_name()%> (<%=s_no%>) 만 <%=c_age%>세 <%=semester%>학기</title>

<head>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<meta content="" name="description">
	<meta content="" name="keywords">
	
	<!-- Favicons -->
	<link href="<%=path%>/images/favicon-32x32.png" rel="icon">
	<link href="<%=path%>/images/apple-icon-180x180.png" rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
	<!-- Vendor CSS Files -->
	<link href="<%=path%>/bootstrap/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/assets/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/assets/vendor/simple-datatables/style.css" rel="stylesheet">
	
	<!-- Template Main CSS File -->
	<link href="<%=path%>/bootstrap/assets/css/style.css" rel="stylesheet">
	
</head>

<body>
<div class="card">
	<div class="card-body">
		<h5 class="card-title"><%=sb.getS_name()%> (<%=s_no%>) 만 <%=c_age%>세 <%=semester%>학기 발달평가</h5>
		<table class="table">
			<tr>
			  <th scope="col" class="table-active">이름</th>
			  <td scope="row"><%=sb.getS_name()%></td>
			  <th scope="col" class="table-active">학번</th>
			  <td scope="row"><%=s_no%></td>
			</tr>
			<tr>
			  <th scope="col" class="table-active">관찰학기</th>
			  <td scope="row">만 <%=c_age%>세 <%=semester%>학기</td>
			  <th scope="col" class="table-active">작성자</th>
			  <td scope="row"><%=djlist.get(0).getWriter()%>(<%=djlist.get(0).getWriterid()%>)</td>
			</tr>
		</table>
		<table class="table">
			<tr class="table-active">
				<th scope="col" width="100">영역</th>
				<th scope="col">발달상황</th>
			</tr>
			<%
			for(DevJoin dj : djlist){
			%>
			<tr>
				<td><%=dj.getScope()%></td>
				<td><%=dj.getD_content()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
<div class="noprint">
	<input type="button" value="인쇄하기" id="print" class="btn btn-primary" onclick="window.print()" style="margin: auto; display: block;"/>
</div>
</body>

