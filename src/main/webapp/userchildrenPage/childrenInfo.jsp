<%@page import="children.FamilyBean"%>
<%@page import="info.ClassroomBean"%>
<%@page import="children.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h5 class="card-title">학생정보</h5>
<%
if(selectS_no == null){
	out.print("조회할 학생의 학번을 클릭하세요.");
}
else if(selectS_no != null){
	StudentBean sb = sdao.getStudentBySno(selectS_no); // 선택한 학생 정보 가져오기
	ClassroomBean cb2 = cdao.getClassByCno(sb.getC_no());
%>
<table class="table">
		<tr>
			<td rowspan="7" width="10%">
				<img id="imgname" width="150" alt="없음" src="<%=path%>/images/<%=sb.getImgname()%>">
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active" width="15%">학생번호</th>
			<td><span id="s_no"><%=sb.getS_no()%></span></td>
			<th scope="col" class="table-active" width="15%">교실</th>
			<td><span id="c_name"><%=cb2.getC_name()%></span></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">이름</th>
			<td><span id="s_name"><%=sb.getS_name()%></span></td>
			<th scope="col" class="table-active">입학일</th>
			<td><span id="entran"><%=sb.getEntran()%></span></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">생년월일</th>
			<td><span id="birth"><%=sb.getS_birth()%></span></td>
			<th scope="col" class="table-active">나이</th>
			<td><span id="c_age">만 <%=sb.getC_age()%>세</span></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">성별</th>
			<td><span id="gender"><%=sb.getGender()%></span></td>
			<th scope="col" class="table-active">방과후교실</th>
			<td><span id="after"><%=sb.getAfter()%></span></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">주소</th>
			<td colspan="3" ><span id="addr">(<%=sb.getAddr1()%>) <%=sb.getAddr2()%> <%=sb.getAddr3()%></span></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">특이사항</th>
			<td colspan="3" ><span id="note"><%=sb.getNote()%></span></td>
		</tr>
</table>


<!-- 가족정보 -->
<h5 class="card-title">긴급연락처</h5>
<%
	FamilyBean fb = fdao.getFamilyBySno(sb.getS_no());
%>
<table class="table">
		<tr>
			<th scope="col" class="table-active" width="15%">가족관계</th>
			<td><span id="f_relations"><%=fb.getF_relations()%></span></td>
			<th scope="col" class="table-active" width="15%">이름</th>
			<td><span id="f_name"><%=fb.getF_name()%></span></td>
		</tr>
		<tr>
			<th scope="col" class="table-active">생년월일</th>
			<td><span id="f_birth"><%=fb.getF_birth()%></span></td>
			<th scope="col" class="table-active">연락처</th>
			<td><span id="f_hp1"><%=fb.getF_hp1()%> - <%=fb.getF_hp2()%> - <%=fb.getF_hp3()%></span></td>
		</tr>
</table>
<%}%>