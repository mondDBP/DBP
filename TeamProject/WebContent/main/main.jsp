<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String curUserId = (String)request.getAttribute("curUserId");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" media="all" />
</head>
<body>
	<div class="header-wrap">
		<div class="header">
			<div class="hpName-wrap">
				<a class="hpName" href="<c:url value='/main/page' />">FUNDAY</a>
			</div>
		
		<div class="leftproject-bar">
			<a class="view-project" href="<c:url value='/project/view/category.jsp' />">프로젝트 둘러보기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="create-project" href="<c:url value='/project/register/creationForm.jsp' />">프로젝트 올리기</a>
		</div>
		
		<c:choose>
			<c:when test='${empty curUserId}'>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/login/login.jsp' />" class="view-login">로그인/회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/login/login.jsp' />" class="view-login">
					<img src="<c:url value='/images/user_account.png' />" alt="profile" style="width: auto; height: 35px;">
					</a>
				</div>
			</c:when>
			<c:when test='${!empty u_img}'>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png'/>" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="view-user" style="padding: 0 10px;">
					<a href="<c:url value='/user/mypage/mypage_menu.jsp' />" class="view-mypage">${userId}님</a>
					</span>
					<a href="<c:url value='/user/mypage/mypage_menu.jsp' />" class="view-mypage">
					<img src="<c:url value='/images/${u_img}' />" alt="profile" style="width: auto; height: 35px;">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="view-user" style="padding: 0 10px;">
					<%
						if(curUserId.equals("admin1234") == false){
					%>
					<a href="<c:url value='/user/mypage/mypage_menu.jsp' />" class="view-mypage">${userId}님</a>
					<%
						}
					%>
					</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%
						if(curUserId != null && curUserId.equals("admin1234")){
					%>
					<a href="<c:url value='/user/list' />" class="view-admin">관리자 페이지</a>
					<%
					}
					%>
					&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/mypage/logout.jsp' />">로그아웃</a>
					&nbsp;&nbsp;
					<%
						if(curUserId.equals("admin1234") == false){
					%>
					<a href="<c:url value='/user/mypage/mypage_menu.jsp' />" class="view-mypage">
					<img src="<c:url value='/images/user_account.png' />" alt="profile" style="width: auto; height: 35px;">
					</a>
					<%
					}
					%>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	</div>

	<!--//////////////////////////////////////////////////////////////////////////////////-->

	<div class="container">
		<div class="pr_project">
			<div class="pr">
				<div class="box">
					<a href=""><img src="<c:url value='/images/city01.jpg' />" class="ph "></a>
					<a href=""><img src="<c:url value='/images/city02.jpg' />" class="ph novisual"></a>
					<a href=""><img src="<c:url value='/images/city03.jpg' />" class="ph novisual"></a>
					<a href=""><img src="<c:url value='/images/city04.jpg' />" class="ph novisual"></a>
					<a href=""><img src="<c:url value='/images/city05.jpg' />" class="ph novisual"></a>
					
					<img src="<c:url value='/images/main_visual_prev.png' />" class="prev">
					<img src="<c:url value='/images/main_visual_next.png' />" class="next">

					<ul class="control_box">
						<li class="cont"><img src="<c:url value='/images/control_on.png' />" width="40"></li>
						<li class="cont"><img src="<c:url value='/images/control.png' />" width="40"></li>
						<li class="cont"><img src="<c:url value='/images/control.png' />" width="40"></li>
						<li class="cont"><img src="<c:url value='/images/control.png' />" width="40"></li>
						<li class="cont"><img src="<c:url value='/images/control.png' />" width="40"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- ..........................................................................-->
		
	<iframe src="<c:url value='/main/preview' />" width="100%" height="1200" frameborder="0" allowfullscreen scrolling="no"></iframe>

	<!--//////////////////////////////////////////////////////////////////////////////////-->
	<div class="footer">
		<div class="footerSet">
			<div class="foot_1">
				<a class="notice"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">공지사항</a><br>
				<a class="hire"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">채용</a><br>
				<a class="createGuide"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">창작자가이드</a><br>
				<a class="settlement"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">결산</a>
			</div>
			<!--첫번째 텍스트박스-->
			<div class="foot_2">
				<a class="termsOfService"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">이용약관</a><br>
				<a class="privacyPolicy"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">개인정보
					처리방침</a><br> <a class="feePolicy"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">수수료
					정책</a><br> <a class="helpCenter"
					href="C:\Users\user\Desktop\Project\footer\noticePage.html">헬프
					센터</a><br>
			</div>
			<!--두번째 텍스트박스-->
			<div class="foot_3">
				<ul>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="<c:url value='/images/sns_ka.png'/>" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="<c:url value='/images/sns_tw.png'/>" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="<c:url value='/images/sns_insta.png'/>" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="<c:url value='/images/sns_naver.png'/>" width="30"></a></li>
				</ul>
			</div>
		</div>
		<div class="foot_4">
			<span id="notice_1">000은 텀블벅은 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인
				통신판매를 진행하지 않습니다. 프로젝트의 완수 및 선물제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와 관련하여
				후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다. </span>
		</div>
		<!--세번째텍스트박스-->
		<div class="foot_5">
			<span id="notice_2"> 텀블벅(주) | 대표 염재승 105-87-52823 | 서울시 강남구
				강남대로 364, 12층 1201호 (역삼동) | 통신판매업 2019-서울강남-00797 | 대표전화
				02-6080-0760 </span>
		</div>
		<!--네번째 텍스트박스-->
	</div>
</body>
</html>
