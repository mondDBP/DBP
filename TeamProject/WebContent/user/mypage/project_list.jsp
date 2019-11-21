<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" /> --%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>f

<%
	ArrayList<TempBean> list = MypageDAO.getTempProjectList(u_idx);
	int listnumber = list.size();

%>
<c:set var="u_idx" value="<%=u_idx%>" />
<c:set var="u_img" value="<%=u_img%>" />
<c:set var="list" value="<%=list%>" />
<c:set var="listnumber" value="<%=listnumber %>" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>${userId}님이 만든 프로젝트</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="<c:url value='/css/mypage_project.css' />" rel="stylesheet"
	type="text/css" media="all">

<script>
	$(function() {
		$(".project_list_head_img_trash").on("click", function() {
			$(this).parent().parent().remove();

		});

	});
</script>

</head>

<body>
	<div class="container_1">
		<div class="upstyle">
			<div class="smile_img_line">
				<div class="smile_last_lay">
					<div class="smile_line_lay">
						<div class="img_ready">
							<!-- ----------------프로필 사진--------------------- -->
							<c:choose>
								<c:when test='${empty u_img}'>
									<img src="../UserProfile/smile.png" alt="profile" style="width: auto; height: 100px; border-radius: 50%">
								</c:when>
								<c:otherwise>
									<img src="../UserProfile/<%=u_img%>" alt="profile" style="width: auto; height: 100px; border-radius: 50%">
								</c:otherwise>
							</c:choose>

						</div>
						<div class="smile_down_text_lay">
							<h1 class="text_setting">${u_nm}</h1>
						</div>
						<div style="color: #898080;">저희는 당신의 멋진 프로젝트를 기다립니다</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container_2">
		<div class="makeing_project_1">
			<div class="makeing_project_list">
				<div class="makeing_pro_text">
					<div class="text_start_1">
						<h3 class="text_start_2">만드는 중 프로젝트</h3>
						<span class="font_color" style="margin-left: 6px">${listnumber}</span>개
					</div>
				</div>
				
				<div class="container_3">

					<!-- -------------만드는중 프로젝트--------------------------------->

					<c:forEach var="tempbean" items="${list}">
						<a href="#">
							<div class="project_list_lay">
								<c:choose>
									<c:when test="${empty tempbean.tp_img }">
										<div>
											<img src="images/porject.PNG" class="project_list_head_img">
										</div>
									</c:when>
									<c:otherwise>
										<div>
											<img src="${tempbean.tp_img}"
												style="width: 100%; height: 190px;"
												class="project_list_head_img">
										</div>
									</c:otherwise>
								</c:choose>

								<div>
									<img src="images/trash.png" class="project_list_head_img_trash">
								</div>
								
								<div class="project_name">
									<div class="text_setting_1">${tempbean.tp_short_title}</div>
									<p class="text_setting_1"><%=u_nm%>의 프로젝트
									</p>

									<div>${tempbean.tp_summary}</div>

									<div class="money_time">
										<div class="time_1">
											<span class="money_2">모인 금액</span> <span class="money_2_1">0원<span
												class="money_2_2">0 %</span></span>
										</div>
										<div class="time_1">
											<span class="time_2">남은 시간</span> <span class="time_2_1">0일</span>
										</div>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
					<!-- ---------------------------------------------------------->
				</div>
			</div>
</body>

</html>