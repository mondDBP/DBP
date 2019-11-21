<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*, Bean.*,dbConnection.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Context 이름 설정 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- bean 사용 setting -->
<jsp:useBean id="UserBean" class="Bean.UserBean" />
<jsp:useBean id="Mgr" class="DAO.MemberDAO" />

<%


//파일 업로드
String uploadPath = request.getRealPath("/UserProfile");
out.println("절대경로 : " + uploadPath + "<br/>");
int maxSize = 1024 * 1024 * 10; // 파일 용량 10M
String fileName = "";
MultipartRequest multi = null;
	try {
		
		multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String u_idx = (String)session.getAttribute("u_idx");
		String u_nm = multi.getParameter("u_nm");
		String u_loc = multi.getParameter("u_loc");
		String sns_con_tf = multi.getParameter("sns_con_tf");
		String u_intro = multi.getParameter("u_intro");
		String u_website = multi.getParameter("u_website");
		String u_ph1 = multi.getParameter("u_ph1");
		String u_ph2 = multi.getParameter("u_ph2");
		String u_ph3 = multi.getParameter("u_ph3");
		Enumeration files = multi.getFileNames();
		String u_ph = u_ph1+u_ph2+u_ph3;
		
		while (files.hasMoreElements()) {
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file); // 중복 정책에 따라 뒤에 1,2,3으로 이름을 변경하여 유니크하게 파일명을 생성
			
		}
		UserBean.setU_idx(Integer.parseInt(u_idx));
		UserBean.setU_img(fileName);
		UserBean.setU_nm(u_nm);
		UserBean.setU_loc(u_loc);
		UserBean.setSns_con_tf(Integer.parseInt(sns_con_tf));
		UserBean.setU_intro(u_intro);
		UserBean.setU_website(u_website);
		UserBean.setU_ph(u_ph);
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>



	<%
		boolean a = Mgr.updateProfile(UserBean);

		if (a == true) {
			String u_idx = (String)session.getAttribute("u_idx");
			String u_img = Mgr.getUserImg(u_idx);
			session.setAttribute("u_img", u_img);
	%>
	<script>
		alert("개인정보가 수정되었습니다.");
		location.href = "${contextPath}/Mypage/Mypage_profile.jsp";
	</script>
	<%
		} else {
	%>
	<script>
		alert("유류.");
	</script>
	<%
		};
	%>

</body>
</html>