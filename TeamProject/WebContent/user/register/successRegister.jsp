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
<h2>ȸ�������� �Ϸ�Ǿ����ϴ�.</h2>
<!-- ������������ ���ư��� �߰�-->
<input type="button" value="�������� ���ư���" onClick="redirect()" />
</form>
</body>
</html>