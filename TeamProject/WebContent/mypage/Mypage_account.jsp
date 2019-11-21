<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:useBean id="UserDAO" class="DAO.MemberDAO" />


	<%
    	request.setCharacterEncoding("UTF-8");
		String u_idx = (String) session.getAttribute("u_idx");
		out.println(u_idx);
		UserBean userbean = UserDAO.getMember(u_idx);
		pageContext.setAttribute("bean", userbean);
    %>

<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<title>Page Title</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
<script type="text/javascript" src="MypageScript.js"></script>
</head>

<body>
	<div>u_idx: ${bean.u_idx}</div>
	<div>u_email: ${bean.u_email}</div>
	<div>u_pwd: ${bean.u_pwd}</div>
	<div>news_sub_tf:${bean.news_sub_tf}</div>
	<div>sns_con_tf:${bean.sns_con_tf}</div>
	<c:set var="news_sub_tf" value="${bean.news_sub_tf}" />
	



	<!--------------------------------------------------------------------<헤더>[최상단]-->
	<div class="header" style="border-bottom: 1px solid #eee;">
		<div class="container">
			<div style="padding: 10px 0; text-align: center;">
				<a href="#" class="logo">bumblbug</a>
			</div>
		</div>
	</div>

	<!-------------------------------------------------------------------<소메뉴>[상단]-->
	<section style="background-color: #ebeae5">
		<div class="container">
			<div class="row" style="justify-content: space-between;">
				<div>
					<h2>계정 설정</h2>
				</div>

				<div>
					<ul class="profile_ul">
						<li><a href="Mypage_profile.jsp">프로필 설정</a></li>
						<li><a href="#">계정 설정</a></li>
						<li><a href="Mypage_payment.jsp">지불정보 설정</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-------------------------------------------------------------------------<본문_좌측>-->
	<form name="accountForm" method="post" action="Mypage_accountproc.jsp">
	<section>
		<div class="container">
			<div class="row" style="margin-top: 20px;">
				<div class=" " style="flex-basis: 70%; font-size: 14px;">
					<!--------------------------------------------------------------[이메일]-->
					<div class="row border_top">
						<div class="col-m02 align-right">이메일</div>
						<div class="col-m10">
							<input class="input_radious" style="width: 208px;" value="${bean.u_email}" name="u_email"> <a
								href="#" class="btn_update">변경하기</a>
							<p>
								변경할 이메일을 입력하신 후 변경하기를 누르시면, 새 메일 주소로 인증 메일이 갑니다.<br> 전송된 인증
								메일안의 링크를 누르시면 변경된 이메일을 사용하실 수 있습니다.
							</p>
						</div>
					</div>

					<!------------------------------------------------------------[비밀번호]-->
					<div class="row border_top">
						<div class="col-m02 align-right">비밀번호</div>
						<div class="col-m10">
							<input type="password" id="" class="input_radious"
								placeholder="${bean.u_pwd}"> <input type="password" id=""
								class="input_radious" placeholder="변경할 비밀번호" name="u_pwd" autocomplete="new-password" required="">
						</div>
					</div>

					<!-------------------------------------------------------------[페이스북]-->
					<div class="row border_top">
						<div class="col-m02 align-right">외부계정 연동</div>
						<div class="col-m10">
							<div class="row">
								<div class="col-m12" style="padding: 0px">
								<input type="hidden" name="sns_con_tf"
											value="${bean.sns_con_tf}">
									<a href="#" class="btn btn-faceebook"><i
										class="fab fa-facebook-f"></i>페이스북 계정 등록하기</a>
								</div>
								<div class="col-m12" style="padding-top: 6.5px">사용하시는 페이스북
									계정으로도 텀블벅에 로그인하실 수 있습니다. IT님의 동의 없이는 페이스북에 어떤 포스팅도 하지 않음을
									약속드립니다.</div>
							</div>
						</div>
					</div>
					<!-----------------------------------------------------------[페이지 주소]-->
					<div class="row border_top">
						<div class="col-m02 align-right">페이지 주소</div>
						<div class="col-m10">
							<input id="" class="input_radious"> <span
								class="page_address"> tumblbug.com/u/domopohopisuyuno</span>
						</div>
					</div>
					<!-------------------------------------------------------------[뉴스 레터]-->
					<div class="row border_top">
						<div class="col-m02 align-right" style="padding: 25px 0px">
							뉴스레터</div>
						<div class="col-m10 align-left" style="padding: 25px 12px">
						
								<c:if test="${1 eq news_sub_tf }">
								<input type="checkbox" name="news_sub" checked>
								<input type="hidden" name="news_sub_tf" value="1" >
								</c:if>
								<c:if test="${0 eq news_sub_tf }">
								<input type="checkbox" name="news_sub" >
								<input type="hidden" name="news_sub_tf" value="0">
								</c:if>
						  뉴스레터를 구독합니다.
							

						</div>
					</div>

					<!----------------------------------------------------------[수정하기 버튼]-->
					<div class="row border_top">
						<div class="col-m02" style="padding-bottom: 0px"></div>
						<div class="col-m10" style="padding-top: 6.5px">
							<button type="submit" class="btn"
									style="line-height: 24px; padding: 10px 42px">수정하기</button>
						</div>
					</div>
					<!-------------------------------------------------------------------------->

				</div>
				<!-- 본문 종료 -->

			</div>
			<!-- .row -->
		</div>
		<!-- .container-->

	</section>
	<input type="hidden" name="u_idx" value="${bean.u_idx}">
</form>
</body>

</html>