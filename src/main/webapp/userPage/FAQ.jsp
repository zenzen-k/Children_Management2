<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="home_top.jsp"%>

<title>Home / Management / F.A.Q</title>
<div class="pagetitle">
	<h1>F.A.Q</h1>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="<%=path%>/userPage/home.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/userPage/FAQ.jsp">FAQ</a></li>
			<li class="breadcrumb-item active">FAQ</li>
		</ol>
	</nav>
</div>
<!-- End Page Title -->

<div class="card">
	<div class="card-body">
		<h5 class="card-title">자주 묻는 질문</h5>

		<div class="accordion accordion-flush" id="faq-group-1">

			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-1" type="button" data-bs-toggle="collapse">
					교사가 가입을 했는데 '승인 대기중' 이라고만 뜨고 로그인이 안돼요.
					</button>
				</h2>
				<div id="faqsOne-1" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					관리자가 아닌 일반 교사는 해당 유치원의 관리자 즉 원장님이 가입승인을 해주어야 합니다. 
					가입승인은 <b>관리자 계정 로그인 - 좌측 메뉴 - 유치원관리 - 가입승인</b> 에서 신청한 교사 목록을 확인하고 승인할 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-2" type="button" data-bs-toggle="collapse">
					꼭 원장님이 회원가입을 해야만 교사들이 가입할 수 있나요?
					</button>
				</h2>
				<div id="faqsOne-2" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					네. 그렇습니다. 교사들이 회원가입을 하기 위해서는 원장님께서 유치원등록을 반드시 해주셔야 합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-3" type="button" data-bs-toggle="collapse">
					교실을 추가하고 싶은데 어떻게 해야하나요?
					</button>
				</h2>
				<div id="faqsOne-3" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					관리자 계정으로 로그인 해서 <b>좌측 메뉴 - 유치원관리 - 교실관리 - 교실등록</b> 을 통해 추가할 수 있습니다.
					</div>
				</div>
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-3" type="button" data-bs-toggle="collapse">
					출석관리를 하려는데 결석체크는 어떻게 해야하나요?
					</button>
				</h2>
				<div id="faqsOne-3" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					체크박스를 해제하면 자동으로 결석처리 됩니다. 또한 출석버튼과 조퇴버튼을 동시에 누르시면 조퇴처리 되니 이 점 참고해주시길 바랍니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-4" type="button" data-bs-toggle="collapse">
					평가관리 탭에서는 무엇을 할 수 있나요?
					</button>
				</h2>
				<div id="faqsOne-4" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					현재 학기의 발달 평가 기간을 설정할 수 있으며, 교사들이 작성한 발달 평가지의 내용을 보고 승인 또는 거절 할 수 있습니다.
					교사들은 발달 평가 기간동안에만 평가지를 작성할 수 있습니다. <br>
					또한 승인된 평가지는 수정 및 삭제가 불가능 하고 승인 거절된 평가지는 수정 및 삭제가 가능 하오니 이 점 유의해주시길 바랍니다.
					</div>
				</div>
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-4" type="button" data-bs-toggle="collapse">
					발달평가 작성을 했는데 학생관리 - 발달평가 창에서 해당 학생을 클릭했을 때 나오지 않아요.
					</button>
				</h2>
				<div id="faqsOne-4" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					발달평가의 최종승인이 되지 않았기 때문입니다. 따라서 관리자(원장)에게 승인 요청을 문의하세요.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-5" type="button" data-bs-toggle="collapse">
					발달평가에서 승인 단계가 궁금해요.
					</button>
				</h2>
				<div id="faqsOne-5" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
						승인 단계에는 작성중 - 승인대기 - 승인완료 - 승인거절 이 존재합니다.<br>
						<b>작성중</b>은 현재 담당 교사가 발달평가를 작성중이며, 내용의 수정이 가능합니다. 또한 해당 글은 작성자만 볼 수 있습니다.<br>
						<b>승인대기</b>는 담당 교사가 평가지의 작성을 완료하고 관리자(원장)에게 제출한 상태입니다. 이때는 수정이 불가능 하며 조회만 가능합니다. <br>
						<b>승인완료</b>는 관리자가 발달평가지의 최종 승인을 진행한 상태입니다. 최종 등록된 평가지는 수정 및 삭제가 불가능 하며 <b>학생관리 - 발달평가</b>에서 조회가 가능합니다. 
						하지만 발달 평가 작성 창에서는 승인 완료 된 글이 조회되지 않는다는 점 유의하시길 바랍니다. <br>
						<b>승인거절</b>은 관리자가 발달 평가지의 최종 승인을 거절한 상태입니다. 교사는 다시 수정과 삭제작업을 할 수 있습니다.
					</div>
				</div>
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" data-bs-target="#faqsOne-4" type="button" data-bs-toggle="collapse">
					유아 전체 조회에는 학생이 뜨는데, 출석관리, 관찰일지, 발달평가에는 학생이 뜨지 않아요
					</button>
				</h2>
				<div id="faqsOne-4" class="accordion-collapse collapse" data-bs-parent="#faq-group-1">
					<div class="accordion-body">
					유아 전체 조회는 모든 교사가 할 수 있지만 그외 출석관리, 관찰일지, 발달평가 작성은 담당 교실에 한해서만 가능합니다.<br>
					반 배정에 관해서는 관리자(원장)에게 문의바랍니다.
					</div>
				</div>
			</div>

		</div>

	</div>
</div>
<!-- End F.A.Q Group 1 -->

<%@ include file="home_bottom.jsp"%>