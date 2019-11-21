<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*,dbConnection.*"%>
<!-- bean을 이용하여 자동적으로regBean 에 getter setter작동한다 -->
<jsp:useBean id="regBean" class="Bean.UserBean" />
<jsp:useBean id="Mgr" class="DAO.MemberDAO" />
<jsp:setProperty property="*" name="regBean" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><jsp:getProperty property="u_nm" name="regBean" /></div>
	<div><jsp:getProperty property="u_pwd" name="regBean" /></div>
	<div><jsp:getProperty property="u_email" name="regBean" /></div>
	
	
	
	
	<%
		boolean a = Mgr.insertMember(regBean);

		if (a == true) {
	%>
	<script>alert("아이디 추가 되었습니다."); location.href="../Main/Main.jsp";</script>
	<%
		};
	%>
</body>
</html>