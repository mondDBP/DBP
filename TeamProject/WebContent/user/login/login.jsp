<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/login.css' />">
<script type="text/javascript">
	function login() {
		loginForm.submit();
	}
</script>

</head>
<body>
	<div class="membership_wrap">
		<div class="membership_body">
			<!--  name: loginForm    -->
			<form class="userBox" autocomplete="on" name="loginForm" method="POST" action="<c:url value='/user/login' />">
				<label class="signIn" for="login">아이디</label>

				<!-- 이메일  name: email -->
				<input type="text" class="inputTag" placeholder="아이디 입력"
					name="userId" value=''> <label class="signIn"
					for="password">비밀번호</label>

				<!-- 비밀번호  name: pwd-->
				<input type="password" class="inputTag" name="password" value=''
					placeholder="비밀번호 입력" autocomplete="current-password"
					autocapitalize="off" autocorrect="off" spellcheck="off">

				<!-- 로그인 버튼! loginCheck() 메소드로-->
				<button class="loginButton" type="submit" label="로그인하기"
					onclick="login()" style="margin: 20px 0; height: 45px;">로그인</button>

				<div align="center" style="color: red; font-weight: bold;">
					<c:if test="${loginFailed && existId == 1 && existPw == 1}">
						<c:out value="${exception.getMessage()}" />
					</c:if>
					<c:if test="${existId == 0 && existPw == 1}">
						<c:out value="아이디를 입력해 주세요." />
					</c:if>
					<c:if test="${existId == 1 && existPw == 0}">
						<c:out value="패스워드를 입력해 주세요." />
					</c:if>
					<c:if test="${existId == 0 && existPw == 0}">
						<c:out value="아이디와 패스워드를 입력해 주세요." />
					</c:if>
				</div>

				<a class="idExist" href="<c:url value='/user/register/terms.jsp' />"><span
					style="color: #757575;" data-reactid="57">아직 계정이 없으신가요?</span> 회원 가입하기
				</a>
			</form>

			<div style="text-align: center; margin-top: 40px;" data-reactid="59">
				<a style="text-decoration: none; color: #ff4543;"
					href="/forgot-password" data-reactid="60">혹시 비밀번호를 잊으셨나요?</a>
			</div>
		</div>
	</div>
</body>
</html>