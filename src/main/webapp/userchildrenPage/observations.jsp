<%@page import="info.ClassroomBean"%>
<%@page import="children.ObserveDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="children.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../userPage/home_top.jsp"%>

<script>
	function searchClass(e) {
		//alert(e.value);
		location.href = "observations.jsp?searchCno=" + e.value;
	}
</script>


<title>Home / ChildManagement / Observations</title>
<div class="pagetitle">
	<h1>관찰일지</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item active">관찰일지</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<%
	ArrayList<StudentBean> slist = null;
	if(scno == 0){
		slist = sdao.getAllStudent(skno);
	}else if(scno != 1){
		slist = sdao.getAllStudentByCno(skno, String.valueOf(scno));
	}
	
	ObserveDao odao = ObserveDao.getInstance();
	Date now = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	// 반정보
	ArrayList<ClassroomBean> clist = cdao.getAllClassroom(skno);
	
	String searchCno = request.getParameter("searchCno");
	int sC_no = 0;
	if(searchCno != null){
		sC_no = Integer.parseInt(searchCno);
		if(searchCno.equals("0")){
			slist = sdao.getAllStudent(skno);
		}else{
			slist = sdao.getAllStudentByCno(skno, searchCno);
		}
	}
%>

<div class="row">
	<%
	if(scno==0){
	%>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<p class="card-title">조회 반 선택하기
						<select class="form-select" style="width: 200; display: inline;" onchange="searchClass(this)">
							<option value="0">전체</option>
							<%
							for(ClassroomBean cb : clist){
							%>
								<option value="<%=cb.getC_no()%>" <%if(cb.getC_no()==sC_no){%>selected<%}%>><%=cb.getC_name()%></option>
							<%
							}
							%>
						</select>
					</p>
				</div>
			</div>
		</div>
	<%
	}
	if(scno==1){
		out.print("배정된 반이 없습니다. 유치원 관리자에게 문의바랍니다.");
	}
	else{
		%>
		<p class="card-title" style="margin-left: 20">일지를 작성할 학생을 클릭하세요</p>
		<%
		for(StudentBean sb : slist){%>
		<div class="col-lg-3">
			<div class="card">
				<div class="card-body">
					<!-- 이미지영역 -->
					<div class="row">
					<div class="col-lg-6">
						<a href="observations_Board.jsp?s_no=<%=sb.getS_no()%>&s_name=<%=sb.getS_name()%>&s_birth=<%=sb.getS_birth()%>&c_no=<%=sb.getC_no()%>">
						<img src="<%=path%>/images/<%=sb.getImgname()%>" width="100" height="130" style="margin-top: 20;">
						</a>
					</div>
					
					<!-- 글영역 -->
					<div class="col-lg-6" style="margin-top: 20;">
							<a href="observations_Board.jsp?s_no=<%=sb.getS_no()%>&s_name=<%=sb.getS_name()%>&s_birth=<%=sb.getS_birth()%>&c_no=<%=sb.getC_no()%>">
								<b><%=sb.getS_name() %>(<%=sb.getS_no()%>)</b>
							</a><br>
							<b><%=sb.getS_birth()%></b><br>
							<%
							for(ClassroomBean cb : clist){
								if(cb.getC_no()==sb.getC_no()){
									out.print("<b>" + cb.getC_name() + "</b><br>");
									break;
								}
							}
							%>
							오늘작성 : 
							<%
							String result = odao.getToWrite(sdf.format(now), sb.getS_no());
							if(result.equals("미작성")){
								out.print("<font color='red'>미작성</font><br>");
							}else{
								out.print("<font color='green'>작성</font><br>");
							}
							%><!-- 작성/미작성 -->
							관찰일지 : 총 <%=odao.getCountBySno(sb.getS_no())%>개
					</div>
					</div> <!-- row -->
				</div>
			</div>
		</div>
		<%} //for
	}//if
	%>
</div>

<%@ include file="../userPage/home_bottom.jsp"%>