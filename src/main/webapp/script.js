/**
 * 회원가입 유효성 검사!
 */
 
 var use = "";
 var isCheck = false;
 var usePw = "";
 var useKinder = "";
 var useKinder2 = "";
 var isCheckKinder = false;
 
 var pwCheckNum = false;
 var rrnCheckNum = false;
 var hpCheckNum = false;
 
 function Chk(){
	//alert(1);
	//return false;
	if($('input[name=id]').val()==""){
		$(".invalid-msgId").html('아이디를 입력하세요').show();
		$('input[name=id]').focus();
		return false;
	}
	if($('input[name=u_name]').val()==""){
		$(".invalid-msgName").html('이름을 입력하세요').show();
		$('input[name=u_name]').focus();
		return false;
	}
	if($('input[name=email]').val()==""){
		$(".invalid-msgEmail").html('이메일을 입력하세요').show();
		$('input[name=email]').focus();
		return false;
	}
 }
 
 function validationChk(){
	//alert(1);
	/*if($('input[name=id]').val()==undefined){
		alert("u");
		return false;
	}
	alert("u2");
	return false;*/
	
	//id
	if($('input[name=id]').val()==""){
		$(".invalid-msgId").html('아이디를 입력하세요').show();
		$('input[name=id]').focus();
		return false;
	}
	
	if($('input[name=id]').val().length<6 || $('input[name=id]').val().length>15){
		$(".invalid-msgId").html('아이디는 6~15자 가능합니다.').show();
		$('input[name=id]').focus();
		return false;
	}
	//alert("u2");
	//return false;
	if($('input[name=id]').val().length<4){
		$(".invalid-msgId").html('아이디는 6~20자 가능합니다.').show();
		$('input[name=id]').focus();
		return false;
	}
	
	if(isCheck == false){
		alert("아이디 중복체크 먼저 하세요");
		return false;
	}
	else if(use=="impossible"){
		$(".invalid-msgId").html('이미 등록된 아이디입니다.').show();
		$('input[name=id]').select();
		return false;
	}else if(use=="missing"){
		$(".invalid-msgId").html('아이디를 입력하세요').show();
		$('input[name=id]').focus();
		return false;
	}
	
	//pw
	if($('input[name=pw]').val()==""){
		$(".invalid-msgPw").html('비밀번호를 입력하세요').show();
		$('input[name=pw]').focus();
		return false;
	}
	
	var reg = /^[a-z0-9]{8,16}$/i;
	var pw = $('input[name=pw]').val();
	
	var chk_num = pw.search(/[0-9]/); // 숫자
	var chk_eng = pw.search(/[a-z]/i); // 대소문자무시
	
	if(!(reg.test(pw))){ 
		$(".invalid-msgPw").html('비밀번호 형식이 틀렸습니다').show();
		$('input[name=pw]').focus();
		return false;
	}
	else if(chk_num < 0 || chk_eng < 0){
		$(".invalid-msgPw").html('영문자와 숫자의 조합으로 작성하세요').show();
		$('input[name=pw]').focus();
		return false;
	}
	
	//pw2
	if($('input[name=pw2]').val()==""){
		$(".invalid-msgPw2").html('비밀번호 확인을 입력하세요').show();
		$('input[name=pw2]').focus();
		return false;
	}
	if(!pwCheckNum){
		$('input[name=pw2]').focus();
		return false;
	}
	
	//이름
	if($('input[name=u_name]').val()==""){
		$(".invalid-msgName").html('이름을 입력하세요').show();
		$('input[name=u_name]').focus();
		return false;
	}
	
	//주민등록번호 앞자리
	var rrn1 = $('input[name=u_rrn1]').val();
	var rrn2 = $('input[name=u_rrn2]').val();
	if(rrn1==""){
		$(".invalid-msgRrn").html('주민등록번호를 입력하세요').show();
		$('input[name=u_rrn1]').focus();
		return false;
	} else if(rrn1.search(/[0-9]/) < 0){
		$(".invalid-msgRrn").html('주민등록번호는 숫자만 입력하세요').show();
		$('input[name=u_rrn1]').select();
		return false;
	} else if(rrn1.length != 6){
		$(".invalid-msgRrn").html('주민등록번호 형식이 잘못되었습니다.').show();
		$('input[name=u_rrn1]').focus();
		return false;
	}
	
	// 주민번호 뒷자리
	if(rrn2==""){
		$(".invalid-msgRrn").html('주민등록번호를 입력하세요').show();
		$('input[name=u_rrn2]').focus();
		return false;
	}else if(rrn2.search(/[0-9]/) < 0){
		$(".invalid-msgRrn").html('주민등록번호는 숫자만 입력하세요').show();
		$('input[name=u_rrn2]').select();
		return false;
	}else if(rrn2.length != 7){
		$(".invalid-msgRrn").html('주민등록번호 형식이 잘못되었습니다.').show();
		$('input[name=u_rrn2]').focus();
		return false;
	}
		
	//전화번호
	var hp1 = $('input[name=u_hp1]').val();
	var hp2 = $('input[name=u_hp2]').val();
	var hp3 = $('input[name=u_hp3]').val();
	if($('input[name=u_hp1]').val()==""){
		$(".invalid-msgPhone").html('전화번호를 입력하세요').show();
		$('input[name=u_hp1]').focus();
		return false;
	} else if(hp1.search(/[0-9]/) < 0){
		$(".invalid-msgPhone").html('전화번호는 숫자만 입력하세요').show();
		$('input[name=u_hp1]').select();
		return false;
	}
	
	if($('input[name=u_hp2]').val()==""){
		$(".invalid-msgPhone").html('전화번호를 입력하세요').show();
		$('input[name=u_hp2]').focus();
		return false;
	} else if(hp2.search(/[0-9]/) < 0){
		$(".invalid-msgPhone").html('전화번호는 숫자만 입력하세요').show();
		$('input[name=u_hp2]').select();
		return false;
	}
	
	if($('input[name=u_hp3]').val()==""){
		$(".invalid-msgPhone").html('전화번호를 입력하세요').show();
		$('input[name=u_hp3]').focus();
		return false;
	} else if(hp3.search(/[0-9]/) < 0){
		$(".invalid-msgPhone").html('전화번호는 숫자만 입력하세요').show();
		$('input[name=u_hp3]').select();
		return false;
	}
	
	
	//주소
	if($('input[name=k_name]').val()==""){
		$(".invalid-msgKinder").html('유치원명을 입력하세요').show();
		$('input[name=k_name]').focus();
		return false;
	}
	if($('input[name=k_addr1]').val()==""){
		$(".invalid-msgAddr").html('주소를 입력하세요').show();
		$('input[name=k_addr1]').focus();
		return false;
	}
	if($('input[name=k_addr3]').val()==""){
		$(".invalid-msgAddr").html('상세주소를 입력하세요').show();
		$('input[name=k_addr3]').focus();
		return false;
	}
	
	if(isCheckKinder == false){
		alert("유치원 찾기를 클릭 하세요");
		return false;
	}
	else if(useKinder=="impossible"){
		$(".invalid-msgId").html('이미 등록된 유치원입니다.').show();
		$('input[name=id]').select();
		return false;
	}else if(useKinder=="missing"){
		$(".invalid-msgId").html('유치원을 입력해주세요').show();
		$('input[name=id]').focus();
		return false;
	}
	
	if(useKinder2=="impossible"){
		$(".invalid-msgId").html('등록되지 않은 유치원입니다.').show();
		$('input[name=id]').select();
		return false;
	}else if(useKinder2=="missing"){
		$(".invalid-msgId").html('유치원을 입력해주세요').show();
		$('input[name=id]').focus();
		return false;
	}
	
	//이메일
	reg = /[a-zA-Z0-9]+@[a-zA-Z0-9]+/;
	if($('input[name=email]').val()==""){
		$(".invalid-msgEmail").html('이메일을 입력하세요').show();
		$('input[name=email]').focus();
		return false;
	}
	else if($('input[name=email]').val().search(reg)){
		$(".invalid-msgEmail").html('올바르지 않은 이메일 형식입니다.').show();
		$('input[name=email]').focus();
		return false;
	}
	
	//약관동의
	if(!($('input[name=terms]').is(':checked'))){
		$(".invalid-msgTerms").html('약관에 동의해주세요.').show();
		$('input[name=terms]').focus();
		return false;
	}
}

function duplicate(){
	isCheck = true;
	$.ajax({
		url : "idCheckProc.jsp",
		data : ({
			userid : $('input[name=id]').val()
		}),
		success : function(data){
			//alert(data);
			if($('input[name=id]').val() == ""){
				$(".invalid-msgId").html('아이디를 입력해주세요').show();
				$('input[name=id]').select();
				use = "impossible";
			}
			else if($.trim(data) == "N"){
				$(".invalid-msgId").html('이미 등록된 아이디입니다.').show();
				$('input[name=id]').select();
				use = "impossible";
			} else if($.trim(data) == "Y"){
				$(".invalid-msgId").html('<font color=blue>사용 가능합니다.</font>').show();
				use = "possible";
			}
		}
	});
}

// 유치원 중복체크
function duplicate_kinder(){
	isCheckKinder = true;
	$.ajax({
		url : "KinderCheckProc.jsp",
		data : ({
			userKinder2 : $('input[name=k_name]').val()
		}),
		success : function(data){
			//alert(data);
			if($('input[name=k_name]').val() == ""){
				$(".invalid-msgKinder").html('유치원을 입력해주세요').show();
				$('input[name=k_name]').select();
				useKinder2 = "missing";
			} else if($.trim(data) == "N"){
				$(".invalid-msgKinder").html('이미 등록된 유치원입니다.').show();
				$('input[name=k_name]').select();
				useKinder2 = "impossible";
			} else if($.trim(data) == "Y"){
				$(".invalid-msgKinder").html('<font color=blue>등록 가능한 유치원입니다.</font>').show();
				useKinder2 = "possible";
			}
		}
	});
}

//유치원 검색
function searchKinder(){
	isCheckKinder = true;
	$.ajax({
		url : "KinderCheckProc.jsp",
		data : ({
			userKinder : $('input[name=k_name]').val()
		}),
		success : function(data){
			//alert(data);
			if($('input[name=k_name]').val() == ""){
				$(".invalid-msgKinder").html('유치원을 입력해주세요').show();
				$('input[name=k_name]').focus();
				useKinder = "missing";
			} else if($.trim(data) == "N"){
				$(".invalid-msgKinder").html('<font color=blue>등록 가능한 유치원입니다.</font>').show();
				$('input[name=k_name]').select();
				useKinder = "possible";
			} else if($.trim(data) == "Y"){
				$(".invalid-msgKinder").html('등록되지 않은 유치원 입니다.').show();
				useKinder = "impossible";
			}
		}
	});
}


//키보드눌렀을때 48~57 e.keyCode => 
//e.target.value -> input 입력된ㄹ거
function keyNone(){
	$(".msgNone").css('display','none');
}

function keyId(){
	//alert(e);
	keyNone();
	//$(".invalid-msgId").css('display','none');
	use = "";
	isCheck = false;
}

function keyPw2(){
	keyNone();
	//$(".invalid-msgPw2").css('display','none');
	
	if($('input[name=pw]').val()!=$('input[name=pw2]').val()){
		$(".invalid-msgPw2").html('입력된 비밀번호가 다릅니다.').show();
		$('input[name=pw2]').focus();
		pwCheckNum = false;
	}else{ 
		$(".invalid-msgPw2").html('<font color=blue>비밀번호 일치</font>').show();
		$('input[name=pw2]').focus();
		pwCheckNum = true;
	}
}

