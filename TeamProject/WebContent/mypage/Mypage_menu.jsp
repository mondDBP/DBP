<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String u_idx = (String) session.getAttribute("u_idx");
	if (u_idx == null || u_idx.equals("")) {
		response.sendRedirect("../Main.jsp");
	};

	
	String u_img = (String) session.getAttribute("u_img");
	String u_nm = (String) session.getAttribute("u_nm");
	out.println("u_idx: " + u_idx);
	out.println("u_idx: " + u_nm);
	out.println("u_idx: " + u_img);
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="u_idx" value="<%=u_idx%>" />
<c:set var="u_img" value="<%=u_img%>" />
<!DOCTYPE html>
<html>

<head>
<meta charset='utf-8'>
<title>Page Title</title>
<link rel='stylesheet' type='text/css' media='screen' href='../css/Mypage.css'>
<link rel='stylesheet' type='text/css' media='screen' href='../css/Main.css'>
</head>

<body>
	<!-- 0.0 -->
	<div class="header" style="border-bottom: 1px solid #eee;">
		<!-- 1.0 -->
		<div class="container">
			<div style="padding: 20px 0; text-align: center;">
				내 페이지
				<div style="float: right;">
					<a href="../Main/Main.jsp" class="btn">닫기</a>
				</div>
				<!-- X버튼 -->
			</div>
		</div>
	</div>

	<section>
		<!-- 1.0 -->
		<div class="container">
			<!-- 1.1 -->
			<div
				style="display: flex; padding: 60px 0 30px; border-bottom: 1px solid #eee">
				<!-- FLEX -->


				<c:choose>
					<c:when test='${empty u_img}'>
						<img src="${contextPath}/UserProfile/smile.png" alt="profile"
							style="width: auto; height: 80px;">
					</c:when>
					<c:otherwise>
						<img src="${contextPath}/UserProfile/<%=u_img%>" alt="profile"
							style="width: auto; height: 80px;">
					</c:otherwise>
				</c:choose>

				<span
					style="padding-left: 10px; line-height: 56px; line-height: 80px; font-weight: 700; font-size: 21px; color: #757575;">
					<%=u_nm%>
				</span>

			</div>
			<!-- 1.2 -->
			<div class="row member_title">
				<a href="Mypage_fund.jsp"><div class="col-m12">
						<h3>내 후원현황</h3>
					</div></a>
				<div class="col-m12">
					<a href="Mypage_project.jsp"><h3>내가 만든 프로젝트</h3></a>
				</div>
				<div class="col-m12 hr"></div>
				<div class="col-m12">
					<a href="Mypage_profile.jsp"><h3>프로필 설정</h3></a>
				</div>
				<div class="col-m12">
					<a href="Mypage_payment.jsp"><h3>지불정보 설정</h3></a>
				</div>
				<div class="col-m12">
					<a href="logout.jsp"><h3>로그아웃</h3></a>
				</div>
				<br> <br> <br> <br> <br>
			</div>
		</div>
	</section>

</body>

</html>