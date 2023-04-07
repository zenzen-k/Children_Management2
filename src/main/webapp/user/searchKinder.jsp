<%@page import="info.KindergartenBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="info.KindergartenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	KindergartenDao kdao = KindergartenDao.getInstance();
	ArrayList<KindergartenBean> klist = kdao.getAllKinder();
%>
<!-- js파일 -->    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script>
	function filter(){
        var value, name, item, i;

        value = document.getElementById("k").value; // 입력하는 값
        item = document.getElementsByClassName("item"); // 테이블 목록 값

        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none"; // 없는건 숨기기
          }
        }
      }
	
	function sendK_name(k_name) {
		//alert(1);
		opener.setValue(k_name);
		window.close();
	}
</script>

<form>
<input type="text" name="k_name" id="k" onkeyup="filter()">

	<%
	if(klist.size() == 0){
		out.print("등록된 유치원이 없습니다.");
	}else{
		for(KindergartenBean kb : klist){
		%>
			<div class="item">
				<a href="javascript:sendK_name('<%=kb.getK_name()%>')"> <!-- 따옴표필수!!!!!!!! -->
					<span class="name"><%=kb.getK_name()%></span>
					(<%=kb.getK_addr1()%>) <%=kb.getK_addr2()%> <%=kb.getK_addr3()%>
				</a>
			</div>
		<%
		}
	}
	%>

</form>


<!-- <script>
	
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
</script> -->