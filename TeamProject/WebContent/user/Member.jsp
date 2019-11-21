<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<title>Insert title here</title>

<script>
function emailCheck() {
	var input = document.getElementById("email").value;
	var httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = function() {
		if (httpRequest.readyState == XMLHttpRequest.DONE
				&& httpRequest.status == 200) {
			document.getElementById("email-check").innerHTML = httpRequest.responseText;
		}
	};
	// POST 방식의 요청은 데이터를 Http 헤더에 포함시켜 전송함.
	httpRequest.open("POST", "emailCheck.jsp", true);
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	httpRequest.send("email="+input);	//변수에 데이터 넣으면 post방식
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
                        <title data-reactid="44">naverIcon</title>
                        <path d="M20,19.15H13.33A0.34,0.34,0,0,1,13,19L7,10.22,6.84,10v9.15H0V0.85H6.68A0.32, 0.32,0,0,1,7,1l6,8.75a0.82,0.82,0,0,0,.19.22V0.86H20v18.3Z"
							transform="translate(0 -0.84)" fill="#fff" data-reactid="45"></path>
                    </svg> 네이버 아이디로로그인
				</a>
			</div>
			<div class="orLine">
				<span><span>또는</span>
			</div>

			<form class="userBox" autocomplete="on" name="regForm" method="post" action="MemberProc.jsp">
					<label class="signIn" for="user_fullname">이름</label> 
					
					
					<!--가입 이름 name:u_nm  -->
					<input class="inputTag" type="text" autocomplete="username" required="" id="user_fullname" placeholder="사용하실 이름을 입력해주세요" name="u_nm"
					value=""> 
					
					
					<!--가입 이메일 name: mem_email  -->
					<label  for="login" >이메일</label> 
					<input type="email" required="" autocomplete="email" class="inputTag"
					id="email" placeholder="이메일 주소를 입력해주세요" name="u_email" value="" onkeyup="emailCheck()">
					<p id="email-check" style="font-size: 9px; color:red;margin:0;"></p>
					<!--이메일 재 확인 name:confirm  -->
					<input type="email" required="" autocomplete="email" class="inputTag" id="login_confirm" placeholder="이메일 주소를 확인합니다"
					name="emailConfirm" value=""> 
					
					<!--비밀번호 name:mem_pwd  -->
					<label class="signIn" for="password">비밀번호</label> 
					<input type="password" class="inputTag" id="password" placeholder="비밀번호 입력" autocomplete="current-password"
					required="" autocapitalize="off" autocorrect="off" spellcheck="off" name="u_pwd" value=""> 
					
					<!--비밀번호 재 확인 name:pswConfirm  -->
					<input type="password" class="inputTag" id="password_confirm" placeholder="비밀번호를 확인합니다" autocomplete="current-password" required="" autocapitalize="off"
					autocorrect="off" spellcheck="off" name="pwdConfirm" value="">
					
					
					<!-- 가입하기 버튼!! submit-->
					<button class="loginButton" type="submit" label="가입하기"  onclick="inputCheck()" style="margin: 20px 0; height: 45px;">다음</button>
			</form>
			<a class="idExist" href="/join"> <span style="color: #757575;"
				data-reactid="57">이미 계정이 있으신가요?</span>
			</a>
			<div style="text-align: center; margin-top: 10px;" data-reactid="59">
				<a style="text-decoration: none; color: #ff4543;" href="login.jsp"
					data-reactid="60">기존계정으로 로그인하기</a>
			</div>
		</div>
	</div>
</body>
</html>