<%@page import="children.FamilyDao"%>
<%@page import="info.ClassroomBean"%>
<%@page import="info.ClassroomDao"%>
<%@page import="children.StudentDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String configFolder = config.getServletContext().getRealPath("/images/");
	
	MultipartRequest mr = new MultipartRequest(request, configFolder, (1024*1024*5), "UTF-8");
	
	String oldImg = mr.getParameter("oldImg"); // 기존
	String imgname = mr.getFilesystemName("imgname"); // 새로운거
	String img = null;
	
	if(oldImg == null){ 
		if(imgname != null){ // 기존X, 새O
			img = imgname;
		}
	}else if(oldImg != null){ 
		if(imgname == null){  // 기존O, 새X
			img = oldImg;
		}
		else if(imgname != null){  // 기존O, 새O
			img = imgname;
			
			File delFile = new File(configFolder, oldImg);
			delFile.delete();
		}
	}
	
	/* System.out.println("img : " + img);
	System.out.println("after : " + mr.getParameter("after")); */
	System.out.println("proc s_no : " + mr.getParameter("s_no"));
	System.out.println("c_no : " + mr.getParameter("c_no"));
	
	ClassroomDao cdao = ClassroomDao.getInstance();
	ClassroomBean cb = cdao.getClassByCno(Integer.parseInt(mr.getParameter("c_no")));
	
	System.out.println("cb.getC_age() : " + cb.getC_age());
	int c_age = cb.getC_age();
	
	FamilyDao fdao = FamilyDao.getInstance();
	StudentDao sdao = StudentDao.getInstance();
	int cnt = sdao.updateStudent(mr, img, c_age); // 입력항목, 이미지
	int cnt2 = fdao.updateFamily(mr);
	
	if(cnt==1 && cnt2 == 1){
	%>
		<script>
			alert('수정성공');
			location.href="children.jsp?searchC_no=<%=mr.getParameter("searchC_no")%>&selectS_no=<%=mr.getParameter("s_no")%>";
		</script>	
	<%
	}else{
	%>
		<script>
			alert('수정실패');
			history.go(-1);
		</script>
	<%
	}
%>