<%@page import="children.DevJoin"%>
<%@page import="children.DevelopmentalBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="children.DevelopmentalDao"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="home_top.jsp" %>

<%
	// 학기~
	Date now = new Date();
	int mon = now.getMonth();
	String semester = "";
	if(mon>=2 && mon<=7){
		semester = "1";
	}else{
		semester = "2";
	}
	
	DevelopmentalDao ddao = DevelopmentalDao.getInstance();
	ArrayList<DevJoin> djlist = ddao.getDevByApprove(skno);
%>

<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/userPage/script.js"></script>
<script>
	function dateCheck() {
		if(obform.sdate.value==""){
			alert("평가 시작 날짜를 선택하세요");
			obform.sdate.focus();
			return false;
		}
		if(obform.edate.value==""){
			result = confirm("평가 기간이 하루가 맞습니까?");
			if(!result){
				alert("평가 마지막 날짜를 선택하세요");
				obform.edate.focus();
				return false;
			}
		}
	}
	
	function approv() {
		//alert('delSelct');
		flag = false;
		var chkObj = document.getElementsByName("rowchk");
		for(i=0; i<chkObj.length; i++){
			if(chkObj[i].checked){
				flag = true;
				break;
			}
		}
		
		if(!flag){
			alert('체크박스를 하나 이상 선택하세요');
			return;
		}
		
		document.getElementById('app').innerHTML = "<input type='hidden' name='approve' value='승인완료'>";
		document.f.submit();
	}
	
	
	function approvdel() {
		flag = false;
		var chkObj = document.getElementsByName("rowchk");
		for(i=0; i<chkObj.length; i++){
			if(chkObj[i].checked){
				flag = true;
				break;
			}
		}
		
		if(!flag){
			alert('체크박스를 하나 이상 선택하세요');
			return;
		}
		document.getElementById('app').innerHTML = "<input type='hidden' name='approve' value='승인거절'>";
		document.f.submit();
	}
	
	
</script>

<title>Home / Management / ObserveApproval</title>
<div class="pagetitle">
	<h1>평가관리</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/croomMng.jsp">유치원관리</a></li>
			<li class="breadcrumb-item active">평가관리</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<!-- top -->
<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title"><%=semester%>학기 발달평가 기간</h5>
			
			<form method="post" name="obform" action="devApproval_proc.jsp">
				평가기간 선택
				<input type="hidden" name="k_no" value="<%=skno%>"> 
				<input type="date" name="sdate"> ~ 
				<input type="date" name="edate"> 
				<input type="submit" value="저장" onclick="return dateCheck()">
			</form>
			
		</div>
	</div>
</div><!-- top end -->

<!-- bottom -->
<div class="col-lg-12" >
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">승인요청</h5>
					
			<form name="f" action="devApprov_Proc.jsp">
			<button type="button" class="btn btn-outline-primary" style="float: right;" onclick="approv()">선택승인</button>
			<button type="button" class="btn btn-outline-primary" style="float: right; margin-right: 20" onclick="approvdel()">승인거절</button>
			
			<div id="app"></div>
			
			<table class="table " style="text-align: center;">
				<thead>
					<tr>
						<th scope="col">
							<input class="form-check-input me-1" type="checkbox" name="allchk" onclick="delAll()">
						</th>
						<th scope="col">No</th>
						<th scope="col">학생이름</th>
						<th scope="col">학기</th>
						<th scope="col">교사이름</th>
						<th scope="col">교실</th>
						<th scope="col">상세보기</th><!-- 상세보기를 클릭하면 팝업창처럼 내용이 뜨도록 -->
					</tr>
				</thead>
				<tbody>
					<%
					if(djlist.size() == 0){
						out.print("<tr><td colspan='6' align='center'>승인요청된 글이 없습니다.</td></tr>");
					}else{
						int no = 1;
						for(DevJoin dj : djlist){
						%>
						<tr>
							<td>
								<input class="form-check-input me-1" type="checkbox" name="rowchk" value="<%=dj.getD_no()%>">
							</td>
							<td><%=no++%></td>
							<td><%=dj.getS_name()%>(<%=dj.getS_no()%>)</td>
							<td>만 <%=dj.getC_age()%>세 <%=dj.getSemester()%>학기</td>
							<td><%=dj.getWriter()%></td>
							<td><%=dj.getC_name()%></td>
							<td><a href="javascript:window.open('<%=path%>/userchildrenPage/devPOP.jsp?c_age=<%=dj.getC_age()%>&semester=<%=dj.getSemester()%>&s_no=<%=dj.getS_no()%>&approve=<%=dj.getApprove()%>','팝업','width=700,height=1400')">click</a></td>
						</tr>
						<%
						}
					}
					%>
				</tbody>
			</table>
			</form>
			
		</div>
	</div>
</div><!-- bottom end -->

<%@ include file="home_bottom.jsp" %>