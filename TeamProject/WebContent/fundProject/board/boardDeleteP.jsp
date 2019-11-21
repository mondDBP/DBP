<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.*" %>
<%@ page import="DAO.*" %>
<%@ page import="dbConnection.*" %>

<%
	String b_idx = (String)request.getParameter("b_idx");
	//test code
	System.out.println("삭제할 b_idx : " + b_idx);
	//
	BoardDAO boardDAO = new BoardDAO();
	int result = boardDAO.deleteBoard(b_idx);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		<%
		if(result == -1){
			//실패시
			System.out.println("실패");
			%>
			<%
		}else {
			//성공시
			System.out.println("성공");
			%>
			alert('삭제되었습니다.');
			location.href="boardList.jsp";
			<%
		}
		%>
	</script>
</body>
</html>