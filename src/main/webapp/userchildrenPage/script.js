
function childCheck(){
	alert('childCheck');
	
	if($('input[name=entran]').val()==""){
		alert("입학일을 선택하세요");
		$('input[name=entran]').focus();
		return false;
	}
	if($('input[name=s_name]').val()==""){
		alert("이름을 입력하세요");
		$('input[name=s_name]').focus();
		return false;
	}
	if($('input[name=s_birth]').val()==""){
		alert("생년월일을 선택하세요");
		$('input[name=s_birth]').focus();
		return false;
	}
	
	// 주소
	if($('input[name=addr1]').val()=="" || $('input[name=addr2]').val()==""){
		alert("주소를 입력하세요");
		$('input[name=addr1]').focus();
		return false;
	}
	if($('input[name=addr3]').val()==""){
		alert("상세주소를 입력하세요");
		$('input[name=addr3]').focus();
		return false;
	}
	
	// 가족
	if($('input[name=f_name]').val()==""){
		alert("긴급연락처 - 이름을 입력하세요");
		$('input[name=f_name]').focus();
		return false;
	}
	
	if($('input[name=f_hp1]').val()==""){
		alert("긴급연락처 - 전화번호를 입력하세요");
		$('input[name=f_hp1]').focus();
		return false;
	}else if($('input[name=f_hp1]').val().search(/[0-9]/) < 0){
		alert("긴급연락처 - 전화번호는 숫자만 입력하세요");
		$('input[name=f_hp1]').select();
		return false;
	}
	
	if($('input[name=f_hp2]').val()==""){
		alert("긴급연락처 - 전화번호를 입력하세요");
		$('input[name=f_hp2]').focus();
		return false;
	}else if($('input[name=f_hp2]').val().search(/[0-9]/) < 0){
		alert("긴급연락처 - 전화번호는 숫자만 입력하세요");
		$('input[name=f_hp2]').select();
		return false;
	}
		
	if($('input[name=f_hp3]').val()==""){
		alert("긴급연락처 - 전화번호를 입력하세요");
		$('input[name=f_hp3]').focus();
		return false;
	} else if($('input[name=f_hp3]').val().search(/[0-9]/) < 0){
		alert("긴급연락처 - 전화번호는 숫자만 입력하세요");
		$('input[name=f_hp3]').select();
		return false;
	}
}