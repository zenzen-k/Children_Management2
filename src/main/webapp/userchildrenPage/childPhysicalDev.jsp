<%@page import="java.util.ArrayList"%>
<%@page import="children.PhysicalDevBean"%>
<%@page import="info.ClassroomBean"%>
<%@page import="children.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h5 class="card-title">신체발달</h5>

<%
if(selectS_no == null){
	out.print("조회할 학생의 학번을 클릭하세요.");
}
else if(selectS_no != null){
	StudentBean sb = sdao.getStudentBySno(selectS_no); // 선택한 학생 정보 가져오기
	ArrayList<PhysicalDevBean> plist = pdao.getPhysical(selectS_no); // 선택한 학생의 신체정보 가져오기
%>
	<table class="table">
		<tr>
			<th scope="col" class="table-active" width="15%">학생번호</th>
			<td><span id="s_no"><%=sb.getS_no()%></span></td>
			<th scope="col" class="table-active" width="15%">이름</th>
			<td><span id="c_name"><%=sb.getS_name()%></span></td>
		</tr>
	</table>
	<br>
	<table class="table">
		<tr>
			<th scope="col" class="table-active">학기</th>
			<th scope="col" class="table-active">검사일</th>
			<th scope="col" class="table-active">몸무게</th>
			<th scope="col" class="table-active">키</th>
			<th scope="col" class="table-active">수정</th>
		</tr>
		<%
		for(PhysicalDevBean pb : plist){
		%>
		<tr>
			<td><span id="p_age"><%=pb.getP_age()%></span></td>
			<td><span id="pdate"><%=pb.getPdate()%></span></td>
			<td><span id="weight"><%=pb.getWeight()%></span></td>
			<td><span id="height"><%=pb.getHeight()%></span></td>
			<td>
				<button type="button" class="btn btn-outline-danger btn-sm" 
				onclick="location.href='physicalUpdate.jsp?s_no=<%=sb.getS_no()%>&p_age=<%=pb.getP_age()%>'">수정</button>
			</td>
		</tr>
		<%
		}
		%>
	</table>
<%}%>