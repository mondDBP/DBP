
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("euc-kr");
	String realFolder = "";
	String filename = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "euc-kr";
	String savefolder = "projectImages";
	
/* 	realFolder = request.getContextPath() + "/" + savefolder; */
	realFolder = application.getRealPath(savefolder);
	
	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder);

		Enumeration<?> files = multi.getFileNames();
		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);
	} catch (Exception e) {
		e.printStackTrace();
	}

	String fullpath = realFolder + "\\" + filename;
	
%>

<title>Insert title here</title>
</head>
<body>
	<img src="<%=fullpath%>"></img>
</body>
</html>



