<%@page import="info.KindergartenBean"%>
<%@page import="info.EmpBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인홈 -->
<%@ include file="home_top.jsp" %>

<%
	ArrayList<EmpBean> elist = edao.getAllEmp(); // 전체 직급 가져오기
	ArrayList<EmpBean> ecntList = edao.getCountByEmp(skno); // 유치원 전체 직급별 교사 인원 수
	ArrayList<KindergartenBean> kcntList = kdao.getCountByK(skno); // 유치원 전체 반별 유아 인원 수
	
	int sum = 0;
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

                    <li><a class="dropdown-item" href="#">3월</a></li>
                    <li><a class="dropdown-item" href="#">4월</a></li>
                    <li><a class="dropdown-item" href="#">5월</a></li>
                  </ul>
                </div>
               
                <div class="card-body">
                  <h5 class="card-title">이달의 행사 <span>| 4월</span></h5>
                    <div class="ps-3">
					  
                    </div>
                </div>

              </div>
            </div><!-- End 이달의 행사 -->
			
			
			<!-- 출결사항 -->
			<div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">전체</a></li>
                <li><a class="dropdown-item" href="#">반별로</a></li>
              </ul>
            </div>

            <div class="card-body pb-0">
              <h5 class="card-title">출결사항 <span>| 전체</span></h5>

              <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: '출결사항',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: 1048,
                          name: '출석'
                        },
                        {
                          value: 7351,
                          name: '결석'
                        },
                        {
                          value: 580,
                          name: '조퇴'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End 출결사항 -->
          
        </div> 
	  </div><!-- End Left side columns -->
	   <!-- Right side columns -->
        <div class="col-lg-4">
	   
          <!-- 시스템 공지사항 -->
          <div class="card">
          
            <div class="card-body pb-0">
              <h5 class="card-title">시스템 공지사항</h5>

              <div class="news">
                <div class="post-item clearfix">
                  <img src="<%=path%>/bootstrap/assets/img/news-1.jpg" alt="">
                  <h4><a href="#">Nihil blanditiis at in nihil autem</a></h4>
                  <p>Sit recusandae non aspernatur laboriosam. Quia enim eligendi sed ut harum...</p>
                </div>

              </div><!-- End posts-->

            </div>
          </div><!-- End  시스템 공지사항 -->

        </div><!-- End Right side columns -->

      </div>
    </section>

<%@ include file="home_bottom.jsp" %>
