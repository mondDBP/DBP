<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" /> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String u_idx = (String) session.getAttribute("userId");
	if (u_idx == null || u_idx.equals("")) {
		response.sendRedirect("/main/main.jsp");
	};
	
	ArrayList<FundBean> list = MypageDAO.getFundBox(u_idx);
	int count = list.size();
%>

<c:set var="count" value="<%=count%>" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>후원현황 :: 텀블벅</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="<c:url value='/css/main.css' />" rel="stylesheet type="text/css" media="all">
<link href="<c:url value='/css/mypage_back.css' />" rel="stylesheet" type="text/css" media="all">
<script src="<c:url value='/user/mypage/back.js' />"></script>
</head>

<body style="overflow: auto;">
	<jsp:include page="<c:url value='/main/header.jsp' />"></jsp:include>

	<div class="container">
		<div class="img_box">
			<c:choose>
				<c:when test='${empty u_img}'>
					<img src="<c:url value='/images/smile.png' />" alt="profile"
						style="width: auto; height: 80px;">
				</c:when>
				<c:otherwise>
					<img src="<c:url value='/images/user_account.png' />" alt="profile"
						style="width: auto; height: 80px;">
				</c:otherwise>
			</c:choose>

			<h3 class="text_setting">${userId}님의후원 현황</h3>
		</div>
	</div>

	<div class="container_2">
		<div class="icon_funding_pay_all_box">
		
			<div class="icon_funding_pay_search">
				<div class="icon_funding_pay_left">
					<a class="none_click_2 click_1" id="all-fund">모두보기
						<div class="none_icon_2 click_icon_1">${count}</div>
					</a> <a class="none_click_2" id="ing-fund">펀딩 진행중
						<div class="none_icon_2">0</div>
					</a> <a class="none_click_2" id="ed-fund">결제 완료
						<div class="none_icon_2">0</div>
					</a>
				</div>
				<div class="icon_funding_pay_right">
					<div class="search_1">
						<div class="search_2">

							<!-----------------------------------프로젝트 검색 기능 AJAX --------------------------------------------------------->
							<input id="typing" class="searchbox" type="text"
								placeholder="  프로젝트, 선물, 창작자를 검색하세요" onkeyup="searchProject()"
								style="width: 100%; height: 35px;">


							<!-----------------------------------프로젝트 검색 기능 AJAX --------------------------------------------------------->

							<div class="search_img">
								<img src="images/search.png"
									style="width: 30px; height: 30px; padding: 1px;">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="show-funding" id="all" style="display: block">
				<div class="result_funding">
					<div class="result_funding_in">
						<i class="list_lmg"> <img src="images/list.png"
							style="width: 23px; height: 17px;">
						</i> 총 ${count}건의 후원 결과가 있습니다.
					</div>
				</div>
				
				<div class="gift_box">
					<!-- -------------------------------프로젝트 박스 include ------------------------------------>
					<jsp:include page="<c:url value='/user/mypage/back_list.jsp'/>"></jsp:include>
					<!-- -------------------------------프로젝트 박스 include ------------------------------------>
				</div>

				<div class="number_chart">
					<div class="text_number_div">
						<numberchart class="number_start">0</numberchart>
					</div>
				</div>
			</div>
			
			<!-- -------------------------------------------------------->
			
			<div class="show-funding" id="ing" style="display: none">
				<div class="result_funding">
					<div class="result_funding_in">
						<i class="list_lmg"> <img src="img/list.png" style="width: 23px; height: 17px;"></i>
						총 0건의 후원 결과가 있습니다.2
					</div>
				</div>
				<div class="gift_box"></div>

				<div class="number_chart">
					<div class="text_number_div">
						<numberchart class="number_start">1</numberchart>
					</div>
				</div>
			</div>
			
			<!-- -------------------------------------------------------->
			
			<div class="show-funding" id="end" style="display: none">
				<div class="result_funding">
					<div class="result_funding_in">
						<i class="list_lmg"> <img src="img/list.png" style="width: 23px; height: 17px;"></i>
						총 0건의 후원 결과가 있습니다.3
					</div>
				</div>
				<div class="gift_box"></div>

				<div class="number_chart">
					<div class="text_number_div">
						<numberchart class="number_start">1</numberchart>
					</div>
				</div>
			</div>
			
			<!-- --------------------------------------------------------- -->
			
			<div class="show-funding" id="searching" style="display: none">
				<div class="result_funding">
					<div class="result_funding_in">
						<i class="list_lmg"> <img src="img/list.png"
							style="width: 23px; height: 17px;">
						</i> 총 0건의 후원 결과가 있습니다.4
					</div>
				</div>
				<div class="gift_box">
					<div id="searchBox"></div>
				</div>

				<div class="number_chart">
					<div class="text_number_div">
						<numberchart class="number_start">1</numberchart>
					</div>
				</div>
			</div>

		</div>
</body>

</html>