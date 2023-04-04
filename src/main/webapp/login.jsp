<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
%>
<!-- 모바일 크기 조정 -->
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Main / Login</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=path%>/bootstrap/assets/img/favicon.png" rel="icon">
<link href="<%=path%>/bootstrap/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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


<main>
	<div class="container">

		<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

						<div class="d-flex justify-content-center py-4">
							<a href="main.jsp" class="logo d-flex align-items-center w-auto"> 
								<img src="<%=path%>/bootstrap/assets/img/logo.png" alt=""> 
								<span class="d-none d-lg-block">NiceAdmin</span>
							</a>
						</div>
						<!-- End Logo -->

						<div class="card mb-3">

							<div class="card-body">

								<div class="pt-4 pb-2">
									<h5 class="card-title text-center pb-0 fs-4">Login</h5>
								</div>

								<form class="row g-3 needs-validation" novalidate>

									<div class="col-12">
										<label for="yourUsername" class="form-label">id</label>
										<div class="input-group has-validation">
											<input type="text" name="" class="form-control" id="yourUsername" required>
											<div class="invalid-feedback"></div><!-- 아이디입력하세요 경고창 -->
										</div>
									</div>

									<div class="col-12">
										<label for="yourPassword" class="form-label">Password</label>
										<input type="password" name="" class="form-control" id="yourPassword" required>
										<div class="invalid-feedback"></div><!-- 비밀번호입력하세요 경고창 -->
									</div>

									<div class="col-12">
										<button class="btn btn-primary w-100" type="submit">Login</button>
									</div>
									<div class="col-12">
										<p class="small mb-0">
											<a href="pages-register.html">아이디 찾기</a> / 
											<a href="pages-register.html">비밀번호 찾기</a>
										</p>
									</div>
								</form>

							</div>
						</div>

						<div class="credits">
							<!-- All the links in the footer should remain intact. -->
							<!-- You can delete the links only if you purchased the pro version. -->
							<!-- Licensing information: https://bootstrapmade.com/license/ -->
							<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>

					</div>
				</div>
			</div>

		</section>

	</div>
</main>
<!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
