<%@page import="java.text.SimpleDateFormat"%>
<%@page import="info.ClassroomBean"%>
<%@page import="children.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.StudentDao"%>
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

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userPage/script.js"></script>
<%-- <script type="text/javascript" src="<%=path%>/script.js"></script> --%>
<script type="text/javascript" src="<%=path%>/userchildrenPage/script.js"></script>
<script>
	function search(e) {
		c_no = e.value;
		//alert(c_no);		
		location.href='children.jsp?searchC_no=' + c_no;
	}
	
</script>

<%
	String searchC_no = request.getParameter("searchC_no");
	int c_no = 0;
	
	String selectS_no = request.getParameter("selectS_no");
	
	//목록보기 학생
	ArrayList<StudentBean> slist;
	
	if(searchC_no == null || searchC_no.equals("0")){ // searchC_no.equals("") || 
		c_no = 0;
		slist = sdao.getAllStudent(skno);
		System.out.println("전체" + searchC_no);
	}
	else{
		c_no = Integer.parseInt(searchC_no);
		slist = sdao.getAllStudentByCno(skno, searchC_no);
		System.out.println("검색" + searchC_no);
	}
	
	ArrayList<ClassroomBean> clist = cdao.getAllClassroom(skno);
	
%>

<title>Home / ChildManagement / ChildRetreive</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp?searchC_no=0">학생관리</a></li>
			<li class="breadcrumb-item active">유아조회</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<div class="row">
	<div class="col-lg-4" >
		<!-- Default Card -->
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">유아 테이블</h5>

				<form name="f" action="childrenDeleteProc.jsp" method="post">
				<div style="height: 50;">
					<select id="searchC_no" onchange="search(this)" width="500">
						<option value="0">전체</option>
						<%for(ClassroomBean cb : clist){ %>
						<option value="<%=cb.getC_no()%>" <%if(cb.getC_no() == c_no){%>selected<%}%>><%=cb.getC_name()%></option>
						<%
						}
						%>
					</select>
					<button type="button" class="btn btn-outline-primary" style="float: right;" onclick="delSelct()">선택삭제</button>
					<button type="button" class="btn btn-outline-primary" style="float: right; margin-right: 20" onclick="location.href='childrenInsert.jsp'">학생추가</button>
				</div>
				<div id="scrolltable">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">
								<input class="form-check-input me-1" type="checkbox" name="allchk" onclick="delAll()">
							</th>
							<th scope="col">학번</th>
							<th scope="col">이름</th>
							<th scope="col">반이름</th>
						</tr>
					</thead>
					<tbody>
						
						<%
						if(slist.size() == 0){
							out.print("<tr><td colspan='4'>등록된 학생정보가 없습니다.</td></tr>");
						}else{
							for(int i=0; i<slist.size(); i++){
							%>
							<tr>
								<td>
									<input class="form-check-input me-1" type="checkbox" name="rowchk" value="<%=slist.get(i).getS_no()%>">
								</td>
								<th scope="row">
									<a href="children.jsp?selectS_no=<%=slist.get(i).getS_no()%>&searchC_no=<%=searchC_no%>"><%=slist.get(i).getS_no()%></a>
								</th> <!-- 학번클릭 -->
								<td><%=slist.get(i).getS_name()%></td>
								<td><%ClassroomBean cb = cdao.getClassByCno(slist.get(i).getC_no());
									out.print(cb.getC_name());%></td>
							</tr>
							<%
							}
						}
						%>
					</tbody>
				</table>
				</div>
				</form>

			</div>
		</div>
		<!-- End Default Card -->
	</div>
	
	<div class="col-lg-8">
		<!-- Default Card -->
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">상세 정보</h5>
				<!-- Default Tabs -->
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" data-bs-toggle="tab"
							data-bs-target="#student" type="button" role="tab">학생정보</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#studentUpdate" type="button" role="tab">정보수정</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" data-bs-toggle="tab"
							data-bs-target="#physical" type="button" role="tab">신체발달</button>
					</li>
				</ul>
				<div class="tab-content pt-2" id="myTabContent">
					<div class="tab-pane fade show active" id="student" role="tabpanel" >
						<%@ include file="childrenInfo.jsp"%>						
					</div>
					<div class="tab-pane fade" id="studentUpdate" role="tabpanel">
						<%@ include file="childrenUpdate.jsp"%>
					</div>
					<div class="tab-pane fade" id="physical" role="tabpanel">
						<%@ include file="childPhysicalDev.jsp"%>
					</div>
				</div>
				<!-- End Default Tabs -->
			</div>
		</div>
		<!-- End Default Card -->
	</div>
</div>


<%@ include file="../userPage/home_bottom.jsp"%>