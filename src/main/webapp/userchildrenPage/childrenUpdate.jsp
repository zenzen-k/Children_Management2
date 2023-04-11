<%@page import="children.FamilyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h5 class="card-title">정보수정</h5>
<%
if(selectS_no == null){
	out.print("<tr><td>수정할 학생의 학번을 클릭하세요.<td></tr>");
}
else if(selectS_no != null){
	StudentBean sb = sdao.getStudentBySno(selectS_no); // 선택한 학생 정보 가져오기
%>

<form name="f" action="childrenUpdateProc.jsp" method="post" enctype="multipart/form-data">
<table class="table">
		<tr>
			<td rowspan="7" width="10%">
				<input type="hidden" name="searchC_no" value="<%=searchC_no%>">
				<img alt="" src="<%=path%>/images/<%=sb.getImgname()%>" width="150">
                <input class="form-control" type="file" id="formFile" name="imgname">
				<input type="text" name="oldImg" value="<%=sb.getImgname()%>" readonly style="color: blue;">
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active" width="15%">학생번호</th>
			<td>
				<input type="text" name="s_no" value="<%=selectS_no%>" class="form-control" readonly style="color: red">
			</td>
			<th scope="col" class="table-active" width="15%">입학일</th>
			<td>
				<input type="text" name="entran" value="<%=sb.getEntran()%>" class="form-control" disabled>
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active">이름</th>
			<td>
				<input type="text" name="s_name" value="<%=sb.getS_name()%>" class="form-control" disabled>
			</td>
			<th scope="col" class="table-active">교실</th>
			<td>
				<select name="c_no" class="form-select">
					<%for(ClassroomBean cb : clist){ %>
					<option value="<%=cb.getC_no()%>" <%if(cb.getC_no() == sb.getC_no()){%>selected<%}%>><%=cb.getC_name()%></option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active">생년월일</th>
			<td>
				<input type="text" name="birth" value="<%=sb.getS_birth()%>" class="form-control" disabled>
			</td>
			<th scope="col" class="table-active">나이</th>
			<td>
				<input type="text" name="c_age" value="만 <%=sb.getC_age()%>세" class="form-control" disabled>
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active">성별</th>
			<td>
				<input type="text" name="gender" value="<%=sb.getGender()%>" class="form-control" disabled>
			</td>
			<th scope="col" class="table-active">방과후교실</th>
			<td>
				<input class="form-check-input" type="radio" name="after" id="gridRadios1" value="참여" <%if(sb.getAfter().equals("참여")){%>checked<%}%>>
				<label class="form-check-label" style="margin-right: 20">참여</label>
				<input class="form-check-input" type="radio" name="after" id="gridRadios1" value="미참여" <%if(sb.getAfter().equals("미참여")){%>checked<%}%>>
				<label class="form-check-label">미참여</label>
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active">주소</th>
			<td colspan="3">
				<%@ include file="searchAddr.jsp" %>
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active">특이사항</th>
			<td colspan="3">
				<input type="text" name="note" value="<%=sb.getNote()%>" size="100" class="form-control" >
			</td>
		</tr>
		
</table>


<!-- 가족정보 -->
<h5 class="card-title">긴급연락처</h5>
<%
	FamilyBean fb = fdao.getFamilyBySno(sb.getS_no());
	String[] fam = {"부", "모", "조부", "조모", "친척", "기타"};
%>
<table class="table">
		<tr>
			<th scope="col" class="table-active" width="15%">가족관계</th>
			<td>
				<select name="f_relations" class="form-select">
					<% for(int i=0; i<fam.length; i++){ %>
					<option value="<%=fam[i]%>"><%=fam[i]%></option>
					<% } %>
				</select>
			</td>
			<th scope="col" class="table-active" width="15%">이름</th>
			<td>
				<input type="text" name="f_name" value="<%=fb.getF_name()%>" class="form-control">
			</td>
		</tr>
		<tr>
			<th scope="col" class="table-active">생년월일</th>
			<td>
				<input type="date" name="f_birth" class="form-control" value="<%=fb.getF_birth()%>">
			</td>
			<th scope="col" class="table-active">연락처</th>
			<td>
				<input type="text" name="f_hp1" value="<%=fb.getF_hp1()%>" class="form-control" style="display: inline; width: 30%" maxlength="4"> - 
				<input type="text" name="f_hp2" value="<%=fb.getF_hp2()%>" class="form-control" style="display: inline; width: 30%" maxlength="4"> - 
				<input type="text" name="f_hp3" value="<%=fb.getF_hp3()%>" class="form-control" style="display: inline; width: 30%" maxlength="4">
			</td>
		</tr>
</table>

<div class="text-center">
	<button type="submit" class="btn btn-primary" onclick="return childCheck()">수정하기</button>
</div>

</form>
<%}%>