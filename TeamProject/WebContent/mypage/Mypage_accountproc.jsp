<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*,dbConnection.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- Context 이름 설정 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- bean 사용 setting -->
<jsp:useBean id="UserBean" class="Bean.UserBean" />
<jsp:useBean id="Mgr" class="DAO.MemberDAO" />
<jsp:setProperty property="*" name="UserBean" />




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		boolean a = Mgr.updateAccount(UserBean);

		if (a == true) {
	%>
	<script>
		alert("개인정보가 수정되었습니다.");
		location.href = "${contextPath}/Mypage/Mypage_account.jsp";
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