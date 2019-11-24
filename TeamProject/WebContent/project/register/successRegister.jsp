<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="projects" class="model.Project"></jsp:useBean>
<%@ page import="model.service.ProjectManager" %>

<%
	request.setCharacterEncoding("euc-kr");
	String realFolder = "";
	String name = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "euc-kr";
	String savefile = "projectImages";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
				new DefaultFileRenamePolicy());

		projects.setTitle(multi.getParameter("title"));
		projects.setDescription(multi.getParameter("description"));
		projects.setGoal(Integer.parseInt(multi.getParameter("goal")));
		projects.setFunding_period(Integer.parseInt(multi.getParameter("funding_period")));
		projects.setCategory_name(multi.getParameter("category_name"));
		projects.setFund_rate(0);
		projects.setRest_day(0);
		projects.setTotal_money(0);
		
		Enumeration<?> files = multi.getFileNames();
		String name1 = (String) files.nextElement();
		name = multi.getFilesystemName(name1);
		
		Enumeration<?> params = multi.getParameterNames();
		
		while(params.hasMoreElements()) {
			String name2 = (String)params.nextElement();
			String value1 = multi.getParameter(name2);
			multi.getParameter(name2);
		}
		
		while(files.hasMoreElements()) {
			String name2 = (String)files.nextElement();
			String filename1 = multi.getFilesystemName(name2);
			String original1 = multi.getOriginalFileName(name2);
			String contentType = multi.getContentType(name2);
			File f = multi.getFile(name2);
			out.println("name : " + name1 + "<br>");
			out.println("file : " + filename1 + "<br>");
			out.println("orig : " + original1 + "<br>");
			out.println("content : " + contentType + "<br>");
			out.println("ff" + f + "<br>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	String fullpath = realFolder + "\\" + name;
	String imagePath = "./" + savefile + "/" + name;
	projects.setImage(fullpath);
	projects.setUser_id_pk_seq(1000);
	out.println(fullpath);
	out.println(imagePath);
	
	ProjectManager proMan = ProjectManager.getInstance();
	if (proMan.create(projects) == 0) {
		out.println("저장 실패");
	} else {
		out.println("저장 성공");
	}
%>

</head>
<body>
<img src="<%=projects.getImage()%>" width="512" height="384"></img>
</body>
</html>