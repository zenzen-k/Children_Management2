
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

// 한글 229, 띄어쓰기 32, 엔터 13, 지우기8
var byteCheck = 0; // 0이면 ㄴㄴ
function byteLength(){
	// 바이트 수 세기, 4000이상이면 못쓰게
	//alert("key");
	//var texta = document.getElementById("otext").value;
	//var len = Buffer.byteLength(texta); //=> node js 설치해야 쓸수있는,,,
	
	//alert(e.keyCode);
	
	var texta = document.getElementById("otext").value;
	var count = 0; // byte  수
	
	for (var i = 0; i < texta.length; i++) {
		var chcode = texta.charCodeAt(i); // charCodeAt : 유니코드값 리턴
		if (chcode <= 127) {
			count++;
		} else {
			count += 3; // 한글 3byte처리(DB)
		}
	}
	
	//alert(sumbyte);
	document.getElementById("byteLen").innerHTML = count;
	if(count>4000){
		document.getElementById("byteLen").innerHTML = "<font color=red>글자수를 초과했습니다. " + count + "</font>";
		byteCheck = 0;
	}else{
		byteCheck = 1;
	}
}


function obcheck(){
	if(obform.title.value == ""){
		alert("관찰상황(제목)을 입력하세요");
		obform.title.focus();
		return false;
	}
	if(obform.date.value == ""){
		alert("작성 날짜를 선택하세요");
		obform.date.focus();
		return false;
	}
	if(obform.otext.value == ""){
		alert("내용을 작성하세요");
		obform.otext.focus();
		return false;
	}
	if(byteCheck==0){
		alert("입력 가능한 글자수를 초과했습니다. 다시 작성해주세요.");
		obform.otext.focus();
		return false;
	}
}