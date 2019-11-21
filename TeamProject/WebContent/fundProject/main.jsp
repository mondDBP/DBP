<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session객체</title>
</head>
<body>
	<form method="get" action="ProjectPage.jsp">
		<input type="hidden" name="pj_idx" value="1" />
		<input type="hidden" name="u_idx" value="1"/>
		<p><input type="submit" value="프로젝트 선택 1"></p>
	</form>
	<form method="post" action="ProjectPage.jsp">
		<input type="hidden" name="pj_idx" value="2" />
		<input type="hidden" name="u_idx" value="1"/>
		<p><input type="submit" value="프로젝트 선택 2"></p>
	</form>
</body>
</html>