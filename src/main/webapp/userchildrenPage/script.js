
function childCheck(){
	//alert('childCheck');
	
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
	if($('input[name=k_addr1]').val()=="" || $('input[name=k_addr2]').val()==""){
		alert("주소를 입력하세요");
		$('input[name=k_addr1]').focus();
		return false;
	}
	if($('input[name=k_addr3]').val()==""){
		alert("상세주소를 입력하세요");
		$('input[name=k_addr3]').focus();
		return false;
	}
	if($('input[name=addr1]').val()=="" || $('input[name=k_addr2]').val()==""){
		alert("주소를 입력하세요");
		$('input[name=addr1]').focus();
		return false;
	}
	if($('input[name=k_addr3]').val()==""){
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
	
	if($('input[name=f_birth]').val()==""){
		alert("긴급연락처 - 생년월일을 입력하세요");
		$('input[name=f_birth]').focus();
		return false;
	}
}


// 출석 날짜조회 함수
function searchTable(){
	
	var searchDate = document.getElementById("dat").value;
	
	//alert(searchDate);
	
	if(searchDate == ""){
		alert('조회할 날짜를 선택하세요.');
	}else{
		location.href="attendManage.jsp?searchDate=" + searchDate;
	}
}

// 출석 전체선택
function allCheckA() {
	var check = document.f.allAttend.checked;
	//alert(check);
	var chkObj = document.getElementsByName("rowA"); // 배열
	if(check){
		for(i=0; i<chkObj.length; i++){
			chkObj[i].checked = true;
		}
	}else{
		for(i=0; i<chkObj.length; i++){
			chkObj[i].checked = false;
		}
	}
}

// 날짜체크
function dateCheck(){
	//alert(document.getElementById('start').value);
	var startDate = document.getElementById('start').value;
	var endDate = document.getElementById('end').value;
	var arr = startDate.split("-");
	var arr2 = endDate.split("-");
	
	var sdate = new Date(arr[0], arr[1], arr[2]);
	var edate = new Date(arr2[0], arr2[1], arr2[2]);
	
	if(sdate > edate){
		alert('시작날짜가 끝나는 날짜보다 큽니다. 다시 선택해주세요');
		return false;
	}
}