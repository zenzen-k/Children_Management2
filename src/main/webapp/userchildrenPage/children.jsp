<%@page import="info.ClassroomBean"%>
<%@page import="children.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../userPage/home_top.jsp"%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userPage/script.js"></script>

<style>
	#scrolltable { 
		height: 420;
		overflow-x: hidden;
	}
	#scrolltable table { 
		white-space: nowrap; /* 줄바꿈막아줌 */
	}
</style>

<%
	ArrayList<StudentBean> slist = sdao.getAllStudent(skno);
%>

<title>Home / ChildManagement / ChildRetreive</title>
<div class="pagetitle">
	<h1>학생관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userchildrenPage/children.jsp">학생관리</a></li>
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

				<form action="" method="post">
				<div>
					<button type="button" class="btn btn-outline-primary" style="float: right; " onclick="delSelct()">선택삭제</button>
				</div>
				<div id="scrolltable">
				<table class="table table-striped">
					<thead>
						<% //for() %>
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
							out.print("<tr><td>등록된 학생정보가 없습니다.</td></tr>");
						}else{
							for(int i=0; i<slist.size(); i++){
							%>
							<tr>
								<td>
									<input class="form-check-input me-1" type="checkbox" name="rowchk" value="<%=slist.get(i).getS_no()%>">
								</td>
								<th scope="row"><%=slist.get(i).getS_no()%></th>
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
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#h" type="button" role="tab"
							aria-controls="home" aria-selected="true">학생정보</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
							data-bs-target="#profile" type="button" role="tab"
							aria-controls="profile" aria-selected="false">출석조회</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
							data-bs-target="#contact" type="button" role="tab"
							aria-controls="contact" aria-selected="false">신체발달</button>
					</li>
				</ul>
				<div class="tab-content pt-2" id="myTabContent">
					<div class="tab-pane fade show active" id="h" role="tabpanel" aria-labelledby="home-tab">
						Sunt est soluta temporibus
						accusantium neque nam maiores cumque temporibus. Tempora libero
						non est unde veniam est qui dolor. Ut sunt iure rerum quae
						quisquam autem eveniet perspiciatis odit. Fuga sequi sed ea saepe
						at unde.
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						Nesciunt totam et.
						Consequuntur magnam aliquid eos nulla dolor iure eos quia.
						Accusantium distinctio omnis et atque fugiat. Itaque doloremque
						aliquid sint quasi quia distinctio similique. Voluptate nihil
						recusandae mollitia dolores. Ut laboriosam voluptatum dicta.
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
						Saepe animi et soluta ad odit
						soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium
						quibusdam perspiciatis qui qui omnis magnam. Officiis accusamus
						impedit molestias nostrum veniam. Qui amet ipsum iure. Dignissimos
						fuga tempore dolor.
					</div>
				</div>
				<!-- End Default Tabs -->
			</div>
		</div>
		<!-- End Default Card -->
	</div>
</div>
	<%@ include file="../userPage/home_bottom.jsp"%>