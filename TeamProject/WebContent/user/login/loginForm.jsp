<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function login() {
	if (form.userId.value == "") {
		alert("아이디를 입력하세요.");
		form.userId.focus();
		return false;
	} 
	if (form.password.value == "") {
		alert("비밀번호를 입력하세요.");
		form.password.focus();
		return false;
	}		
	form.submit();
}

function userCreate(targetUri) {
	form.action = targetUri;
	form.submit();
}
</script>
<style>

</style>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- login form  -->
<form name="form" method="POST" action="<c:url value='/user/login' />">
  <table border="1">
  	<tr>
		<td align="center" class ="title">로그인</td>
	</tr>

	    <!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${loginFailed}">
	  	  <br><font color="red"><c:out value="${exception.getMessage()}" /></font><br>
	    </c:if>
	<tr> 
	<td>     
	    <table>
	  	  <tr>
			<td align="center">아이디</td>
			<td bgcolor="ffffff">
				<input type="text" name="userId">
			</td>
		  </tr>
	  	  <tr>
			<td align="center">비밀번호</td>
			<td bgcolor="ffffff">
				<input type="password" name="password">
			</td>
		  </tr>

		  <tr>
			<td align="center">
			<input type="button" value="로그인" onClick="login()"> &nbsp;
			<input type="button" value="회원가입" onClick="userCreate('<c:url value='/user/register/terms.jsp' />')">
			</td>						
		  </tr>
		  
	    </table>
	  </td>
	 </tr>
  </table>  
</form>
</body>
</html>