<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	function redirect() {
		form.submit();
	}
</script>
</head>
<body>
<form name="form" method="POST" action="<c:url value='/main/main.jsp' />">
<h2>회원가입이 완료되었습니다.</h2>
<!-- 메인페이지로 돌아가기 추가-->
<input type="button" value="메인으로 돌아가기" onClick="redirect()" />
</form>
</body>
</html>