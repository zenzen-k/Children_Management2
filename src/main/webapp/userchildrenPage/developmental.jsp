<%@page import="children.DevelopmentalBean"%>
<%@page import="children.StudentBean"%>
<%@page import="children.DevJoin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.DevelopmentalDao"%>
<%@page import="children.DevDateBean"%>
<%@page import="children.DevDateDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<style>
	#scrolltable { 
		height: 480;
		overflow-x: hidden;
	}
	#scrolltable table { 
		white-space: nowrap; /* 줄바꿈막아줌 */
	}
</style>

<%
	// 학기~
	Date now = new Date();
	int mon = now.getMonth();

	//System.out.println("mon : " + mon);
	String semester = "";
	if(mon>=2 && mon<=7){
		semester = "1";
	}else{
		semester = "2";
	}
	
	DevDateDao dedao = DevDateDao.getInstance();
	DevDateBean deb = dedao.getAllDevdate(skno);
	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	ArrayList<StudentBean> slist = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//문자열 -> 날짜로
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date ndate = formatter.parse(sdf.format(now));
	if(deb != null){
		
	}
	
	// 관리자 . 반 구분
	if(scno == 0){
		slist = sdao.getStuCnameByCno(skno);
	}else{
		slist = sdao.getStuCnameByCno(skno, scno);
	}
	
	// 선택한 학생
	String s_no = request.getParameter("s_no");
%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>

<title>Home / ChildManagement / developmental</title>
<div class="pagetitle">
	<h1>발달평가</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item active">발달평가</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<!-- top -->
<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=semester%>학기 발달평가 기간</h5>
			
			<%
				if(deb == null){
					out.print("평가기간이 설정되지 않았습니다.");
				}else{ 
					Date sdate = formatter.parse(deb.getSdate());
					Date edate = formatter.parse(deb.getEdate());
					
					if((ndate.after(sdate) && ndate.before(edate)) || sdate.equals(now) || edate.equals(ndate)){
						%>
						평가기간입니다. <b><%=semester%>학기 평가기간 : <%=sdf.format(sdate)%> ~ <%=sdf.format(edate)%></b>);
						<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='dev_insert.jsp'">발달평가 작성하기</button>
						<%
					}else{
						out.print("<font color='red'>평가기간이 아닙니다.</font> <b>" + semester + "학기 평가기간 : " + sdf.format(sdate) + " ~ " + sdf.format(edate) + "</b> " );
					}
				}
			%>
		</div>
	</div>
</div><!-- top end -->

<!-- 테이블 영역 -->
<div class="row">
	<!-- 왼쪽 -->
	<div class="col-lg-6" >
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">유아조회</h5>
				
				<div id="scrolltable">
				<table class="table table-striped">
					<tr>
						<th>NO</th>
						<th>학번</th>
						<th>이름</th>
						<th>반</th>
					</tr>
					
					<%
					if(slist == null){
						out.print("<tr><td colspan='4'>현재 반 미배정 상태입니다. 유치원 관리자에게 문의바랍니다.</td><tr>");
					}else if(slist.size() == 0){
						out.print("<tr><td colspan='4' align='center'>등록된 학생이 없습니다.</td><tr>");
					}else{
						int no = 1;
						for(StudentBean sb : slist){
							%>
							<tr>
								<td><%=no++%></td>
								<td><a href="developmental.jsp?s_no=<%=sb.getS_no()%>"><%=sb.getS_no()%></a></td>
								<td><%=sb.getS_name()%></td>
								<td><%=sb.getNote()%></td>
							</tr>
							<%
						}
					}// if
					%>
					
				</table>
				</div>
				
			</div>
		</div>
	</div><!-- 왼쪽end -->
	
	<!-- 오른쪽 -->
	<div class="col-lg-6" > 
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">발달평가</h5>
				
					<%
					if(s_no == null){
						out.print("조회하려는 학생을 클릭하세요");
					}else{
						int count = ddao.countDevByStu(s_no);
						if(count == 0){
							out.print("학번 : " + s_no + "<br><hr><br>등록된 글이 없습니다");
						}else{
							out.print("학번 : " + s_no + "<br><hr><br>");
							
							for(int i=0; i<count; i++){
								ArrayList<DevelopmentalBean> dblist = ddao.getDevSemester(s_no);
							%>
								<a href="javascript:window.open('devPOP.jsp?c_age=<%=dblist.get(i).getC_age()%>&semester=<%=dblist.get(i).getSemester()%>&s_no=<%=s_no%>','팝업','width=700,height=1400')">
								만 <%=dblist.get(i).getC_age()%>세 <%=dblist.get(i).getSemester()%>학기 (<%=dblist.get(i).getApprove()%>) 글보기</a>
								<br>
							<%
							}
						}
					}
					%>
				
			</div>
		</div>
	</div><!-- 오른쪽end -->
	
</div> <!-- row -->

<!-- 내용(인쇄) -->

<%@ include file="../userPage/home_bottom.jsp"%>