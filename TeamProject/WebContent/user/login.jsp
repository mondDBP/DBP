<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="login.css">
<script type="text/javascript">
	function loginCheck(){
		if(document.loginForm.u_email.value==""){
			alert("이메일를 입력해 주세요.");
			document.loginForm.id.focus();
			return;
		}
		if (document.loginForm.u_pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginForm.action = "loginProc.jsp";
		document.loginForm.submit();
	}
	
</script>

</head>
<body>

	<div class="membership_wrap">
		<div class="membership_body">
			<div style="display: flex; flex-direction: column">
				<a id="facebook"
					href="/auth/facebook?from_pledge=false&origin=https%3A%2F%2Fwww.tumblbug.com%2F">
					<!-- :before 로 로그 넣어줘야함 --> <i class="facebooklogo"></i> 페이스북 아이디로
					로그인
				</a> <a id="naver"
					href="/auth/naver?from_pledge=false&origin=https%3A%2F%2Fwww.tumblbug.com%2F">
					<svg class="naverIcon" width="1em" height="1em"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 18.31">
                        <title >naverIcon</title>
                        <path
							d="M20,19.15H13.33A0.34,0.34,0,0,1,13,19L7,10.22,6.84,10v9.15H0V0.85H6.68A0.32, 0.32,0,0,1,7,1l6,8.75a0.82,0.82,0,0,0,.19.22V0.86H20v18.3Z"
							transform="translate(0 -0.84)" fill="#fff" data-reactid="45"></path>
                    </svg> 네이버 아이디로로그인
				</a>
			</div>
			<div class="orLine">
				<span><span>또는</span>
			</div>
			
			<!--  name: loginForm    -->
			<form class="userBox" autocomplete="on" name="loginForm">
				<label class="signIn" for="login">이메일</label>

				<!-- 이메일  name: email -->
				<input type="email" required="" autocomplete="email"
					class="inputTag" id="login" placeholder="이메일 주소입력" name="u_email" value=""> 
					
					<label class="signIn" for="password">비밀번호</label>
				<!-- 비밀번호  name: pwd-->
				<input type="password" class="inputTag" id="u_pwd" name="u_pwd"
					placeholder="비밀번호 입력" autocomplete="current-password" required=""
					autocapitalize="off" autocorrect="off" spellcheck="off" name="pwd"
					value="">

				<!-- 로그인 버튼! loginCheck() 메소드로-->
				<button class="loginButton" type="submit" label="로그인하기"
					onclick="loginCheck()" style="margin: 20px 0; height: 45px;">로그인</button>
				<a class="idExist" href="Member.jsp">
					<span style="color: #757575;" data-reactid="57">아직 계정이 없으신가요?</span> 
					텀블벅 가입하기
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