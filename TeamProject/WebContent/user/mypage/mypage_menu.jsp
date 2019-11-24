<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<link rel='stylesheet' type='text/css' media='screen' href="<c:url value='/css/mypage.css' />">
<link rel='stylesheet' type='text/css' media='screen' href="<c:url value='/css/main.css' />">
</head>

<body>
<c:url value='' />
	<!-- 0.0 -->
	<div class="header" style="border-bottom: 1px solid #eee;">
		<!-- 1.0 -->
		<div class="container">
			<div style="padding: 20px 0; text-align: center;">
				<div style="float: right;">
					<div class="btn" onClick="history.back();">닫기</div>
				</div>
				<!-- X버튼 -->
			</div>
		</div>
	</div>

	<section>
		<!-- 1.0 -->
		<div class="container">
			<!-- 1.1 -->
			<div style="display: flex; padding: 60px 0 30px;">
				<!-- FLEX -->
				
				<c:choose>
					<c:when test='${empty u_img}'>
						<img src="<c:url value='/images/smile.png' />" alt="profile"
							style="width: auto; height: 80px;">
					</c:when>
					<c:otherwise>
						<img src="<c:url value='/images/${u_img}' />" alt="profile"
							style="width: auto; height: 80px;">
					</c:otherwise>
				</c:choose>

				<span style="padding-left: 10px; line-height: 56px; line-height: 80px; font-weight: 700; font-size: 21px; color: #757575;">
					${userId}
				</span>

			</div>
			<!-- 1.2 -->
			<div class="row member_title">
				<div class="col-m12 hr"></div>
				<div class="col-m12">
					<a href="<c:url value='/user/mypage/back.jsp' />"><h3>내 후원현황</h3></a>
				</div>
				<div class="col-m12">
					<a href="<c:url value='/user/mypage/project.jsp' />"><h3>내가 만든 프로젝트</h3></a>
				</div>
				<div class="col-m12 hr"></div>
				<div class="col-m12">
					<a href="<c:url value='/user/mypage/info.jsp' />"><h3>프로필 설정</h3></a>
				</div>
				<div class="col-m12">
					<a href="<c:url value='/user/mypage/payment.jsp' />"><h3>지불정보 설정</h3></a>
				</div>
				<div class="col-m12">
					<a href="<c:url value='/user/mypage/logout.jsp' />"><h3>로그아웃</h3></a>
				</div>
				<br> <br> <br> <br> <br>
			</div>
		</div>
	</section>

</body>

</html>