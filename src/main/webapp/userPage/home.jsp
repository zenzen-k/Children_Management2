<%@page import="java.text.SimpleDateFormat"%>
<%@page import="children.DevDateBean"%>
<%@page import="children.DevDateDao"%>
<%@page import="info.ScheduleBean"%>
<%@page import="java.util.Date"%>
<%@page import="info.KindergartenBean"%>
<%@page import="info.EmpBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인홈 -->
<%@ include file="home_top.jsp" %>

<%
	ArrayList<EmpBean> elist = edao.getAllEmp();  // 전체 직급 가져오기
	ArrayList<EmpBean> ecntList = edao.getCountByEmp(skno); // 유치원 전체 직급별 교사 인원 수
	ArrayList<KindergartenBean> kcntList = kdao.getCountByK(skno); // 유치원 전체 반별 유아 인원 수
	
	int sum = 0;

	// 이달의행사
	String reqMon = request.getParameter("month");
	
	Date now = new Date();
	int nowYear = now.getYear() + 1900;
	int nowMonth = 0;
	if(reqMon == null){
		nowMonth = now.getMonth() + 1;
	}else{
		nowMonth = Integer.parseInt(reqMon);
	}
	
	ArrayList<ScheduleBean> sclist = scdao.getAllSchedule(skno, nowYear, nowMonth);
%>

  <title>Home</title>

	<!-- 홈화면 시작 -->

    <div class="pagetitle">
      <h1>Home</h1>
      <nav>
        <ol class="breadcrumb">
          <!-- <li class="breadcrumb-item"><a href="index.jsp">Home</a></li> -->
          <li class="breadcrumb-item active"><a href="home.jsp">Home</a></li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- 유치원현황 -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">
              
                <div class="card-body">
                  <h5 class="card-title">유치원 현황</h5>
                    <div class="ps-3">
					  
					  <table width="100%" >
					  	<%
					  	for(KindergartenBean kb : kcntList){
					  		sum += kb.getK_no();
					  	%>
						  	<tr class="text-muted small pt-2 ps-1">
						  		<td align="center" width="40%">만 <%=kb.getK_name() %>세</td>
						  		<td align="center"><span class="text-success small pt-1 fw-bold"><%=kb.getK_no() %></span>명</td>
						  	</tr>
					  	<%
					  	}
					  	%>
					  </table>
					  <hr>
					  
					  <table width="100%">
					  	<tr class="text-muted small pt-2 ps-1">
					  		<td align="center" width="40%">총원</td>
					  		<td align="center"><span class="text-success small pt-1 fw-bold"><%=sum %></span>명</td>
					  	</tr>
					  </table>
                    </div>
                </div>
                
              </div>
            </div><!-- End 유치원현황 -->

            <!-- 교사 현황 -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">
              
                <div class="card-body">
                  <h5 class="card-title">교사 현황</h5>
                    <div class="ps-3">
					  <table width="100%" height="125">
					  <%//for문사용, 교사직급, count값 
					  for(EmpBean eb : ecntList){
					  %>
						  <tr class="text-muted small pt-2 ps-1">
					  		<td align="center" width="40%"><%=eb.getE_name()%></td>
					  		<td align="center">
					  			<span class="text-success small pt-1 fw-bold"><%=eb.getE_no()%></span>명
					  		</td>
					  	</tr>
					  <%
					  }
					  %>
					  </table>
                    </div>
                </div>

              </div>
            </div><!-- End 교사 현황 -->
			
			<!-- 이달의 행사 -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">
               
               <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="home.jsp?month=<%=nowMonth-1%>"><%=nowMonth-1%>월</a></li>
                    <li><a class="dropdown-item" href="#"><%=nowMonth%>월</a></li>
                    <li><a class="dropdown-item" href="home.jsp?month=<%=nowMonth+1%>"><%=nowMonth+1%>월</a></li>
                  </ul>
                </div>
               
                <div class="card-body">
                  <h5 class="card-title">이달의 행사 <span>| <%=nowMonth%>월</span></h5>
                    <div class="ps-3">
					  <table>
					  	<%
					  	 if(sclist.size()==0){
					  		 out.print("<tr class='text-muted small pt-2 ps-1'><td>등록된 일정이 없습니다.</td></tr>");
					  	 }else{
					  		 for(ScheduleBean sb : sclist){
					  			 if(sb.getEdate()!=0){
				  				 %>
					  			 <tr class="text-muted small pt-2 ps-1" height="30">
					  			 	<td width="40%"><%=sb.getSdate()%>일 - <%=sb.getEdate()%>일</td>
					  			 	<td><%=sb.getS_title()%></td>
					  			 </tr>
					  			 <%
					  			 }else{
					  			 %>
					  			 <tr class="text-muted small pt-2 ps-1" height="30">
					  			 	<td width="40%"><%=sb.getSdate()%>일</td>
					  			 	<td><%=sb.getS_title()%></td>
					  			 </tr>
					  			 <%
					  			 }
					  		 }
					  	 }
					  	%>
					  </table>
                    </div>
                </div>

              </div>
            </div><!-- End 이달의 행사 -->
			
			
			<!-- 유치원 공지사항 -->
          <div class="card">
            <div class="card-body pb-0">
            
              <h5 class="card-title">유치원 공지사항</h5>

              <div class="news">
                <div class="post-item clearfix">
                  <h4><a href="#">Nihil blanditiis at in nihil autem</a></h4>
                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
                </div>
              </div>

            </div>
          </div><!-- End  유치원 공지사항 -->


          
        </div> 
	  </div><!-- End Left side columns -->
	   <!-- Right side columns -->
        <div class="col-lg-4">
	   	  
          <!-- 평가기간 -->
          <div class="card">
            <div class="card-body pb-0">
            
              <h5 class="card-title">발달평가</h5>
				<%
					DevDateDao dedao = DevDateDao.getInstance();
					DevDateBean deb = dedao.getAllDevdate(skno);
					
					// 학기~
					int mon = now.getMonth();

					//System.out.println("mon : " + mon);
					String semester = "";
					if(mon>=2 && mon<=7){
						semester = "1";
					}else{
						semester = "2";
					}
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					//문자열 -> 날짜로
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					Date ndate = formatter.parse(sdf.format(now));
					Date sdate = formatter.parse(deb.getSdate());
					Date edate = formatter.parse(deb.getEdate());
					
					if(deb == null){
						out.print("평가기간이 설정되지 않았습니다.");
					}else if((ndate.after(sdate) && ndate.before(edate)) || sdate.equals(now) || edate.equals(ndate)){
						%>
						평가기간입니다. <br><b><%=semester%>학기 평가기간 : <%=sdf.format(sdate)%> ~ <%=sdf.format(edate)%></b>);
						<button type="button" class="btn btn-primary" style="float: center;" onclick="location.href='../userchildrenPage/dev_insert.jsp'">발달평가 작성하기</button>
						<%
					}else{
						out.print("<font color='red'>평가기간이 아닙니다.</font><br> <b>" + semester + "학기 평가기간 : " + sdf.format(sdate) + " ~ " + sdf.format(edate) + "</b>");
					}
				%>
            </div>
          </div><!-- End  평가기간 -->

        </div><!-- End Right side columns -->

      </div>
    </section>

<%@ include file="home_bottom.jsp" %>
