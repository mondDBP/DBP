<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DAO.CommentDAO" %>
<!-- session -->
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
String sU_idx = (String)session.getAttribute("sU_idx");
String sPj_idx = (String)session.getAttribute("sPj_idx");
%>
<!-- request부분 -->
<%
	String b_idx = request.getParameter("b_idx");
%>

<jsp:useBean id="cbs" class ="Bean.CommentBeans"/>
<jsp:setProperty property="c_content" name="cbs"/>
<%
	System.out.println("댓글정보를 받은 bean 객체 : " + cbs);
%>

<%
	String msg = null;
	try{
		CommentDAO cDAO = new CommentDAO();
		
		sU_idx = "2";
		int result = cDAO.writeComment(cbs.getC_content(), sU_idx, b_idx);
		if(result == -1){
			msg="f";
		}else{
			msg="t";
		}
	}catch(Exception e){
		
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글처리</title>
</head>
<body>
	<%=msg %>
	<script>
		location.href="boardView.jsp?b_idx=<%=b_idx%>";	
	</script>
</body>
</html>