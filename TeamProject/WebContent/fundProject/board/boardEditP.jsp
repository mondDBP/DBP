<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Bean.*" %>
<%@ page import="DAO.*" %>
<%@ page import="dbConnection.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String sU_idx = (String)session.getAttribute("sU_idx");
	String pj_idx = request.getParameter("pj_idx");
%>

<jsp:useBean id="bbs" class ="Bean.BoardBeans"/>
<jsp:setProperty property="b_content" name="bbs"/>
<jsp:setProperty property="b_idx" name="bbs"/>

<%
	
	String msg = null;
	String b_content = bbs.getB_content();
	String b_idx = Integer.toString(bbs.getB_idx());
	try{
		BoardDAO boardDAO = new BoardDAO();
		// ----test code----
		String b_u_idx = "2";
		String b_pj_idx = "1";
		// ------------------
		int result = boardDAO.updateBoard(b_idx, b_content);
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

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('글이 수정되었습니다.');
		location.href="boardList.jsp";	
	</script>
</body>
</html>