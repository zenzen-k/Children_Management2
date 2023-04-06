<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
        jQuery(document).ready(function() {
                $('#myModal').show();
        });
        
    </script>

<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

.closeBtn{
	cursor: pointer; 
	background-color: #DDDDDD; 
	text-align: center; 
	padding-bottom: 10px; 
	padding-top: 10px;
}
</style>


<!-- The Modal -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<p style="text-align: center;">
			<span style="font-size: 14pt;">
				<b><span style="font-size: 24pt;">아이디찾기 결과</span></b>
			</span>
		</p>
		<p style="text-align: center; line-height: 1.5;">
			<br>
			<%if(re){
				out.print("찾으시는 아이디는 " + id + "입니다.");
			}else{
				out.print("찾으시는 아이디 정보가 없습니다.");
			}%>
		</p>
		<p>
			<br>
		</p>
		<div class="closeBtn" onClick="close_pop();">
			<a href="<%=path%>/login.jsp" style="text-decoration: none;">
				<span class="pop_bt" style="font-size: 13pt;"> 돌아가기 </span>
			</a>
		</div>
	</div>

</div>
<!--End Modal-->
