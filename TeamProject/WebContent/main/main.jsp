<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String u_idx = (String) session.getAttribute("u_idx");
	String u_img = (String) session.getAttribute("u_img");
	String u_nm = (String) session.getAttribute("u_nm");
	out.println("u_idx: " + u_idx);
	out.println("u_nm: " + u_nm);
	out.println("u_img: " + u_img);
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
				<a class="hpName" href="<c:url value='/main/main.jsp' />">Bumblebug</a>
			</div>
		
		<div class="leftproject-bar">
			<a class="view-project" href="<c:url value='/project/category.jsp' />">프로젝트 둘러보기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="create-project" href="<c:url value='/project/creationForm.jsp' />">프로젝트 올리기</a>
		</div>
		
		<c:choose>
			<c:when test='${empty u_idx}'>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/loginForm.jsp' />" class="view-login">로그인/회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="<c:url value='/images/user_account.png' />" alt="profile" style="width: auto; height: 35px;">
				</div>
			</c:when>
			<c:when test='${!empty u_img}'>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png'/>" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="view-user" style="padding: 0 10px;"><%=u_nm%></span>
					<a href="<c:url value='/user/mypage.jsp' />" class="view-mypage">
					<img src="<c:url value='/images/<%=u_img%>' />" alt="profile" style="width: auto; height: 35px;">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="view-user" style="padding: 0 10px;"><%=u_nm%></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/mypage.jsp' />" class="view-mypage">
					<img src="<c:url value='/images/user_account.png' />" alt="profile" style="width: auto; height: 35px;">
					</a>
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
		<!-- ..........................................................................-->

		<div class="recommend_project">
			<div class="recommend_header">
				<a class="recommend" href="recommend_page.html">추천 프로젝트</a>
				<button></button>
			</div>
			<div class="project_card_section">
				<div class="project_card_1" onclick="location.href='https:www.google.com'">

					<div class="card_1_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_2"
					onclick="location.href='https:www.google.com'">
					<div class="card_2_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_3"
					onclick="location.href='https:www.google.com'">
					<div class="card_3_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_4"
					onclick="location.href='https:www.google.com'">
					<div class="card_4_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ///////////////////////////////////////////////////////////// -->


		<div class="planning_project">
			<div class="planning_header">
				<a class="recommend" href="recommend_page.html">추천 프로젝트</a>
			</div>
			<div class="planning_card_section">
				<div class="directbox">
					<img src="img/main_visual_prev.png" alt="" class="prev">
				</div>
				<div class="planbox1"></div>
				<div class="planbox2"></div>
				<div class="directbox">
					<img src="img/main_visual_next.png" alt="" class="next">
				</div>
			</div>
		</div>






		<div class="kind_1_project">
			<div class="kind_1_header">
				<a class="king_1" href="kind_1_page.html">카테고리1 프로젝트</a>
				<button></button>
			</div>
			<div class="kind_1_card_section">
				<div class="project_card_1"
					onclick="location.href='https:www.google.com'">

					<div class="card_1_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_2"
					onclick="location.href='https:www.google.com'">
					<div class="card_2_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_3"
					onclick="location.href='https:www.google.com'">
					<div class="card_3_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_4"
					onclick="location.href='https:www.google.com'">
					<div class="card_4_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="kind_2_project">
			<div class="kind_2_header">
				<a class="kind_2" href="kind_2_page.html">카테고리1 프로젝트</a>
				<button></button>
			</div>
			<div class="kind_2_card_section">
				<div class="project_card_1"
					onclick="location.href='https:www.google.com'">

					<div class="card_1_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_2"
					onclick="location.href='https:www.google.com'">
					<div class="card_2_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_3"
					onclick="location.href='https:www.google.com'">
					<div class="card_3_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
				<div class="project_card_4"
					onclick="location.href='https:www.google.com'">
					<div class="card_4_content">
						<div class="imgbox">
							<img src="img/city01.jpg" style="width: 200px; height: 150px;"
								alt="">
						</div>
						<div class="textbox">
							<h2>제목</h2>
							<h4>게시자</h4>
						</div>

						<progress value="20" max="100">
							<a href="#"></a>
						</progress>
						<div class="nowbox">
							<span><a href="#">남은기한</a></span> <span style="float: right;"><a
								href="#">퍼센트</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

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
							src="./icon/sns_ka.png" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="./icon/sns_face.png" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="./icon/sns_tw.png" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="./icon/sns_insta.png" width="30"></a></li>
					<li><a href="#"
						onclick="javascript:window.open
                            ('https://www.kakaocorp.com/service/KakaoTalk')"><img
							src="./icon/sns_naver.png" width="30"></a></li>

				</ul>

				<ul>
					<button type="button"
						onclick="location.href='https://www.google.com'">문의하기</button>
				</ul>

			</div>
			<!--sns /문의하기 박스-->
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










	<nav>
		<ul>
			<li><a href="<c:url value='/project/category.jsp' />">CATEGORY</a></li>
			<li><a href="<c:url value='/main/main.jsp' />"><img
					src="<c:url value='/images/logo.gif' />" alt="logo_image" /></a></li>
			<li><a href="<c:url value='/project/search.jsp' />">SEARCH</a></li>
			<li><a href="<c:url value='/user/loginForm.jsp' />">LOGIN</a></li>
		</ul>
	</nav>
	<br>
</body>
</html>
