<%@page import="info.EmpDao"%>
<%@page import="info.EmpBean"%>
<%@page import="info.KindergartenDao"%>
<%@page import="info.ClassroomDao"%>
<%@page import="info.ClassroomBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 일반유저 회원가입(교사) -->

<%
	String path = request.getContextPath();
%>

<!-- 모바일 크기 조정 -->
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Pages / Register</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=path%>/bootstrap/assets/img/favicon.png" rel="icon">
<link href="<%=path%>/bootstrap/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
    
<!-- js파일 -->    
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/script.js"></script>

<style>
	#inv {
	  display: none;
	  width: 100%;
	  margin-top: 0.25rem;
	  font-size: 0.875em;
	  color: #dc3545;
	}
</style>

<script>
	function getKname() {
		return document.getElementsByName("k_name").value;
	}
</script>

<%
	EmpDao edao = EmpDao.getInstance();
	ArrayList<EmpBean> elist = edao.getAllEmp();
%>

<!-- 가입 -->    
<div class="container">

    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

            <div class="d-flex justify-content-center py-4">
              <a href="<%=path%>/main.jsp" class="logo d-flex align-items-center w-auto">
                <img src="<%=path%>/bootstrap/assets/img/logo.png" alt="">
                <span class="d-none d-lg-block">NiceAdmin</span>
              </a>
            </div><!-- End Logo -->


              <div class="card-body">

                <div class="pt-4 pb-2">
                  <h5 class="card-title text-center pb-0 fs-4">교사 회원가입</h5>
                </div>

                <form class="row g-3" method="post" action="register_userProc.jsp">
                  <div class="col-12">
                    <label for="yourId" class="form-label">*아이디</label>
                    <input type="button" onclick="duplicate()" value="중복체크" style="float: right;">
                    <input type="text" name="id" class="form-control" placeholder="영소문자 6~15자" id="yourId" onkeydown="keyId()">
                    <div id="inv" class="msgNone invalid-msgId"></div>
                  </div>
				  
                  <div class="col-12">
                    <label for="yourPassword" class="form-label">*비밀번호</label>
                    <input type="password" name="pw" class="form-control" placeholder="영문자+숫자 8~16자" id="yourPassword" onkeydown="keyNone()">
                    <div id="inv" class="msgNone invalid-msgPw"></div>
                  </div>
                  
                  <div class="col-12">
                    <label for="yourPassword2" class="form-label">*비밀번호 확인</label>
                    <input type="password" name="pw2" class="form-control" placeholder="영문자+숫자 8~16자" id="yourPassword2" onkeyup="keyPw2()">
                    <div id="inv" class="msgNone invalid-msgPw2"></div>
                  </div>
                  
                  <div class="col-12">
                    <label for="yourName" class="form-label">*이름</label>
                    <input type="text" name="u_name" class="form-control" id="yourName" onkeydown="keyNone()">
                    <div id="inv" class="msgNone invalid-msgName"></div>
                  </div>
                  
                  <div class="col-12">
                  	<!-- 라벨 for~ -->
                    <label for="yourRRN" class="form-label" style="display: block;">*주민등록번호</label>
                    <input type="text" name="u_rrn1" class="form-control" id="yourRRN" style="display: inline; width: 45%" maxlength="6" onkeydown="keyNone()">
                    -
                    <input type="text" name="u_rrn2" class="form-control" id="yourRRN" style="display: inline; width: 45%" maxlength="7" onkeydown="keyNone()">
                    <div id="inv" class="msgNone invalid-msgRrn"></div>
                  </div>

                  <div class="col-12">
                    <label for="yourPhone" class="form-label" style="display: block;">*전화번호</label>
                    <input type="text" name="u_hp1" class="form-control" id="yourPhone" style="display: inline; width: 30%" maxlength="4" onkeydown="keyNone()">
                    -
                    <input type="text" name="u_hp2" class="form-control" id="yourPhone" style="display: inline; width: 30%" maxlength="4" onkeydown="keyNone()">
                    -
                    <input type="text" name="u_hp3" class="form-control" id="yourPhone" style="display: inline; width: 30%" maxlength="4" onkeydown="keyNone()">
                    <div id="inv" class="msgNone invalid-msgPhone"></div>
                  </div>
                  
                  <div class="col-12">
                    <label class="form-label">*유치원 검색</label>
                    <input type="button" onclick="searchKinder()" value="검색하기" style="float: right;">
                    <input type="text" name="k_name" placeholder="유치원 이름을 정확하게 입력하세요" class="form-control">
                    <div id="inv" class="msgNone invalid-msgKinder"></div>
                    
                  </div>
                  
                  <div class="col-12">
                    <label class="form-label">*직급선택</label>
                    <select name="e_no" style="width: 100%">
                    	<%
                    	for(EmpBean eb : elist){
                    		if(eb.getE_no()>505){
                    		%>
                    			<option value="<%=eb.getE_no()%>"><%=eb.getE_name()%></option>
                    		<%
                    		}
                    	}
                    	%>
                    </select>
                    <div id="inv" class="msgNone invalid-msgEmp"></div>
                  </div>
                  
                  <div class="col-12">
                    <label for="yourEmail" class="form-label">이메일</label>
                    <input type="email" name="email" class="form-control" id="yourEmail" onkeydown="keyNone()">
                    <div id="inv" class="msgNone invalid-msgEmail"></div>
                  </div>
                  
                  <div class="col-12">
                    <div class="form-check">
                      <input class="form-check-input" name="terms" type="checkbox" id="acceptTerms">
                      <label class="form-check-label" for="acceptTerms">약관동의 <a href="#">개인정보 처리 방침 보기</a></label>
                      <div id="inv" class="msgNone invalid-msgTerms"></div>
                    </div>
                  </div>
                  
                  <div class="col-12">
                    <button class="btn btn-primary w-100" type="submit" onclick="return validationChk()">가입하기</button>
                  </div>
                </form>

              </div>
            </div>

            <div class="credits" align="center">
              <!-- All the links in the footer should remain intact. -->
              <!-- You can delete the links only if you purchased the pro version. -->
              <!-- Licensing information: https://bootstrapmade.com/license/ -->
              <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>

          </div>
        </div>
      </div>

    </section>

  </div>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="<%=path%>/bootstrap/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/chart.js/chart.umd.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/echarts/echarts.min.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/quill/quill.min.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="<%=path%>/bootstrap/assets/vendor/php-email-form/validate.js"></script> 

<!-- Template Main JS File -->
<script src="<%=path%>/bootstrap/assets/js/main.js"></script>