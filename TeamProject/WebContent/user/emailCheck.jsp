<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDAO" class="DAO.MemberDAO" />    
    <%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    boolean result =mDAO.checkEmail(email);
    
    if(result){
    	out.println("이메일 존재합니다");
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복 체크</title>
</head>
<body>

</body>
</html>