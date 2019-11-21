<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Context 이름 설정 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:useBean id="UserDAO" class="DAO.MemberDAO" />
<%
    request.setCharacterEncoding("UTF-8");

	String u_idx = (String) session.getAttribute("u_idx");
	out.println(u_idx);
	UserBean userbean = UserDAO.getMember(u_idx);
	pageContext.setAttribute("bean", userbean);
	String uploadPath = request.getRealPath("/UserProfile");
    
    
    %>
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<title>Page Title</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">

<link rel='stylesheet' type='text/css' media='screen'
	href='../css/Mypage.css'>
</head>

<body>
	<!--                    test -->
	<div>contextPath: ${contextPath}</div>

	<div>u_idx: ${bean.u_idx}</div>
	<div>u_img: ${bean.u_img}</div>
	<div>u_nm: ${bean.u_nm}</div>
	<div>u_loc: ${bean.u_loc}</div>
	<div>sns_con_tf: ${bean.sns_con_tf}</div>
	<div>소개: ${bean.u_intro}</div>
	<div>웹사이트: ${bean.u_website}</div>
	<div>전화번호: ${bean.u_ph}</div>


	<c:set var="phonefull" value="${bean.u_ph}" />
	<c:set var="u_img" value="${bean.u_img}" />
	${fn:length(phonefull)}
	<br> ${fn:substring(phonefull,0,3)}
	<br> ${fn:substring(phonefull,3,7)}
	<br> ${fn:substring(phonefull,7,11)}
	<br>



	<!--                           -->



	<!--------------------------------------------------------------------<헤더>[최상단]-->
	<div class="header" style="border-bottom: 1px solid #eee;">
		<div class="container">
			<div style="padding: 10px 0; text-align: center;">
				<a href="../Main/Main.jsp" class="logo">bumblbug</a>
			</div>
		</div>
	</div>
	<!-------------------------------------------------------------------<소메뉴>[상단띠]-->
	<section style="background-color: #ebeae5">
		<div class="container">
			<div class="row" style="justify-content: space-between;">
				<div>
					<h2>프로필 설정</h2>
				</div>

				<div>
					<ul class="profile_ul">
						<li><a href="#">프로필 설정</a></li>
						<li><a href="Mypage_account.jsp">계정 설정</a></li>
						<li><a href="Mypage_payment.jsp">지불정보 설정</a></li>
					</ul>
				</div>

			</div>
		</div>
	</section>
	<form class="userBox" name="profileForm" method="post" action="Mypage_profileproc.jsp" enctype="multipart/form-data">
		<section class="profile">
			<div class="container">
				<div class="row" style="margin-top: 20px;">

					<!----------------------------------- <본문1_우측> --------------------------------------->
					<div class=" "
						style="flex-basis: 70%; font-size: 14px; padding-right: 30px;">

						<!-------------------------------------------------[프로필 사진]------>
						<div class="row border_top">
							<div class="col-m02 pro_label align-right">프로필 사진</div>
							<div class="col-m10 row">
								<div class="col-m02">

									<c:choose>
										<c:when test='${empty u_img}'>
											<img src="../UserProfile/smile.png" alt="profile"
												style="width: auto; height: 80px;border-radius:50%">
										</c:when>
										<c:otherwise>
											<img src="../UserProfile/${u_img}" alt="profile"
												style="width: auto; height: 80px;border-radius:50%">
										</c:otherwise>

									</c:choose>



								</div>
								<div class="col-m10 row">
									<input class="col-m12" type="file" name="u_img" >
									<div class="col-m12">사이즈는 가로 200px, 세로 250px에 최적화 되어 있으며
										jpg, gif, png파일을 지원합니다.</div>
								</div>
							</div>
						</div>
						<!-------------------------------------------------------[이름]------->
						<div class="row border_top">
							<div class="col-m02 align-right">이름</div>
							<div class="col-m10">
								<input id="" class="input_radious" value="${bean.u_nm }"
									name="u_nm">
							</div>
						</div>
						<!------------------------------------------------------[지역]-------->
						<div class="row border_top">
							<div class="col-m02 align-right">지역</div>
							<div class="col-m10">
								<div>
									<input class="input_radious" style="width: 200px"
										value="${bean.u_loc}" name="u_loc">
								</div>
							</div>
						</div>
						<!-----------------------------------------------[SNS_Facebook]------->
						<div class="row border_top">
							<div class="col-m02 align-right">SNS</div>
							<div class="col-m10">
								<div class="row">
									<div class="col-m12" style="padding: 0px">
										<input type="hidden" name="sns_con_tf"
											value="${bean.sns_con_tf}"> <a href="#"
											class="btn btn-faceebook"><i class="fab fa-facebook-f"></i>

											페이스북 연동하기</a>
									</div>
									<div class="col-m12" style="padding-top: 6.5px">SNS 계정을
										연동하시면 더욱 신뢰할 수 있는 프로필 카드를 만들 수 있습니다.</div>
								</div>
							</div>
						</div>
						<!--------------------------------------------------------[소개]------>
						<div class="row border_top">
							<div class="col-m02 align-right">소개</div>
							<div class="col-m10">
								<div class="row">
									<textarea class="col-m12 input_radious"
										style="resize: vertical" rows="3" name="u_intro">${bean.u_intro }</textarea>
									<div class="col-m12">300자 이내의 자기 소개를 입력해주세요.</div>
								</div>
							</div>
						</div>

						<!----------------------------------------------------[웹사이트]------->
						<div class="row border_top">
							<div class="col-m02 align-right" style="padding-bottom: 0px">
								웹사이트</div>
							<div class="col-m10" style="padding-top: 6.5px">
								<div class="row">
									<div class="col-m12" style="padding: 0">
										<input class="input_radious" style="width: 268px"
											value="${bean.u_website}" name="u_website">
									</div>
									<div class="col-m12" style="padding-left: 0">웹사이트가 있다면
										주소를 입력해주세요.</div>
								</div>
							</div>
						</div>

						<!-----------------------------------------------------[전화번호]------>
						<div class="row border_top">
							<div class="col-m02 align-right" style="padding-bottom: 0px">
								전화번호</div>
							<div class="col-m10" style="padding-top: 6.5px">
								<div class="row">
									<div class="col-m12" style="padding: 0">
										<input class="input_radious" style="width: 80px" maxlength="3"
											value="${fn:substring(phonefull,0,3)}"  name="u_ph1">
										<input class="input_radious" style="width: 80px" maxlength="4"
											value="${fn:substring(phonefull,3,7)}" name="u_ph2">
										<input class="input_radious" style="width: 80px" maxlength="4"
											value="${fn:substring(phonefull,7,11)}" name="u_ph3">
									</div>
									<div class="col-m12" style="padding-left: 0">전화번호를 입력해
										주세요. 밀어주기 및 후원 선물 배송 시 연락을 위해 사용됩니다.</div>
								</div>
							</div>
						</div>

						<!--------------------------------------------------[수정하기 버튼]----->
						<div class="row border_top">
							<div class="col-m02" style="padding-bottom: 0px"></div>
							<div class="col-m10" style="padding-top: 6.5px">
								<button type="submit" class="btn"
									style="line-height: 24px; padding: 10px 42px">수정하기</button>
							</div>
						</div>
						<!------------------------------------------------------------------------------->

					</div>
					<!-- 본문1_좌측(종료) -->


					<!-------------------------------------------------------------------------<본문2_미리보기창>-->

					<div class="  border_top_red"
						style="flex-basis: 30%; display: inline-table">

						<h5 class="popup_h5">프로필 카드 미리보기</h5>

						<div class="box_right" style="position: relative;">
							<div class="row">
								<div style="flex-basis: 50px;">
									<c:choose>
										<c:when test='${empty u_img}'>
											<img src="../UserProfile/smile.png" alt="profile"
												style="width: auto; height: 80px;border-radius:50%">
										</c:when>
										<c:otherwise>
											<img src="../UserProfile/${bean.u_img}" alt="profile"
												style="width: auto; height: 80px;border-radius:50%">
										</c:otherwise>

									</c:choose>
								</div>
								<div class="row" style="padding: 10px;">
									<div class="col-m12 no-p">
										<span class="popup_id">${bean.u_nm}</span>
									</div>
									<div class="col-m12 no-p popup_area">
										<i class="el el-map-marker"></i>지역 정보
									</div>
								</div>
							</div>
						</div>

						<div class="border_top box_right">
							<i class="el el-ok-sign" style="color: red"></i>
						</div>
						<div class="border_top no-p">
							<a href="#" class="jasehi">자세히 보기</a>
						</div>

					</div>
					<!-- 본문2_미리보기창(종료) -->

				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</section>
		<input type="hidden" name="u_idx" value="${bean.u_idx}">
	</form>

</body>

</html>