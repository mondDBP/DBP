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
<jsp:setProperty property="*" name="UserBean" />

<%

	try{
	String uploadPath = request.getRealPath("/UserProfile");
	out.println("절대경로 : " + uploadPath + "<br/>");
	int maxSize = 1024 * 1024 * 10;	// 파일 용량 10M
	String fileName = "";
	MultipartRequest multi = null;
	multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	while(files.hasMoreElements()){
		String file = (String)files.nextElement();
		fileName = multi.getFilesystemName(file);	 // 중복 정책에 따라 뒤에 1,2,3으로 이름을 변경하여 유니크하게 파일명을 생성
		UserBean.setU_img(fileName);
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>