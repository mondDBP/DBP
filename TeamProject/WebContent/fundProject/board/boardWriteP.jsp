<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<!-- boardDAO import -->
<%@page import="DAO.BoardDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String sU_idx = (String)session.getAttribute("sU_idx");
	String sPj_idx = (String)session.getAttribute("sPj_idx");
%>

<jsp:useBean id="bbs" class ="Bean.BoardBeans"/>
<jsp:setProperty property="b_content" name="bbs"/>

<%
	System.out.println(bbs);
%>

<%
	
	String msg = null;
	
	
	try{
		BoardDAO boardDAO = new BoardDAO();
		// ----test code----
		String b_u_idx = "2";
		String b_pj_idx = "1";
		// ------------------
		int result = boardDAO.write(bbs.getB_content(), b_u_idx, b_pj_idx);
		if(result==-1){
			// 실패했을 때
			msg= "f";
		}else{
			// 성공 했을 때
			msg= "t";
		}
		
	}catch(Exception e){
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
	<script>
		alert("글쓰기가 완료되었습니다.");
		location.href="boardList.jsp";	
	</script>
</body>
</html>