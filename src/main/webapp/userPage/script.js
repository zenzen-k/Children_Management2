/**
 * 
 */
 
 function delAll() {
	
	var check = document.f.allchk.checked;
	//alert(delAll); 
	// 체크 - t , 해제 - f
	
	var chkObj = document.getElementsByName("rowchk"); // 배열
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
function delSelct() {
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
	
	// submit이 아닌 버튼이어도 action으로 넘어가는 법
	document.f.submit();
}