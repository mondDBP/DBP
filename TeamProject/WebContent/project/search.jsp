<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script>
	function search() {
		form.submit();
	}
	
	function back() {
		history.go(-1);
	}
</script>
</head>
<body>
<b>프로젝트 검색</b>
<form name="search" method="post" action="<c:url value='' />">
	<input type="text" style="width:200" name="keywd">
	<input type="button" value="검색" onClick="search()"><br>
	<input type="button" value="취소" onClick="back()">
</form>
</body>
</html>