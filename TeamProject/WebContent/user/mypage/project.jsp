<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>f

<%
	request.setCharacterEncoding("UTF-8");

	String u_idx = (String) session.getAttribute("u_idx");
	String u_img = (String) session.getAttribute("u_img");
	String u_nm = (String) session.getAttribute("u_nm");
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
<title><%=u_nm%>님이 만든 프로젝트</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.container_1 {
	width: 100%;
	height: 100%;
	border-bottom: 1.9px solid #efeded;
	border-top: 1.2px solid #efeded;
	background-color: #ebeae5;
	background-position: center 33%;
	position: relative;
}

.container_2 {
	width: 100%;
	height: 100%;
	padding-top: 35px;
	padding-bottom: 78px;
	position: relative;
	background-repeat: no-repeat;
	box-sizing: border-box;
	zoom: 1;
}

.container_3 {
	width: 100%;
	height: 390px;
}

.upstyle {
	padding-top: 26px;
	height: 353px;
	position: relative;
	width: 960px;
	margin: 0 auto;
	padding: 0;
}

.smile_img_line {
	width: 100%;
	text-align: center;
	height: 100%;
	display: table;
	box-sizing: border-box;
}

.smile_last_lay {
	display: table-cell;
	vertical-align: middle;
}

.smile_line_lay {
	width: 100%;
	height: 186px;
}

.img_ready {
	width: 180px;
	height: 130px;
	margin: auto;
}

.smile_down_text_lay {
	width: 180px;
	height: 53px;
	margin: auto;
	font-size: 14px;
}

.text_setting {
	font-size: 1.75em !important;
	margin-bottom: 0;
	font-weight: 700;
	line-height: 1.25em;
	margin-top: 0;
	color: #645353;
	margin: 11px;
}

.smile_size {
	width: 170px;
	height: 125px;
}

.makeing_project_1 {
	position: relative;
	width: 960px;
	height: 462px;
	margin: 0 auto;
	padding: 0;
	zoom: 1;
}

.makeing_project_list {
	width: 830px;
	height: 450px;
	margin: auto;
}

.makeing_pro_text {
	width: 805px;
	height: 56px;
	margin: 0px auto 6px;
}

.project_list_lay {
	position: relative;
	height: 450px;
	box-sizing: border-box;
	background-color: #fff;
	border: 1px solid #dcdcdc;
	border-radius: 4px;
	float: left;
	margin: 0 10px 20px;
	width: 249px;
}

.text_start_1 {
	margin: 17px !important;
	zoom: 1;
}

.text_start_2 {
	display: inline-block;
	font-size: 17px;
	margin: 0 !important;
	color: #645353;
	font-weight: 600;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.font_color {
	color: #fa6462;
}

.project_list_head_img {
	background-color: #dfdddd;
	border-radius: 3px 3px 0 0;
	display: block;
	margin: 0;
	position: relative;
	width: 100%;
	transition: background-color 100ms cubic-bezier(1, 1, 0, 1);
	background-color: rgba(255, 255, 255, 0.4);
	background-color: transparent !important;
}

.project_list_head_img_trash {
	position: absolute;
	top: 10px;
	right: 10px;
	width: 19px;
	height: 20px;
	background-color: white;
	cursor: pointer;
}

.project_name {
	overflow-wrap: break-word;
	height: 100%%;
	padding: 13px 19px 0;
}

.link_gogo {
	font-size: .875em;
	line-height: 1.375;
	margin: 0;
	word-break: keep-all;
	color: #645353;
	font-weight: 600;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	display: block;
}

.text_setting_1 {
	color: #433;
	font-size: 15px;
	margin:5px;
	
}



.money_time {
	position:absolute;
	bottom:3px;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	height: 43px;
	margin-top: 7px;
	overflow: hidden;
	padding: 0px 5px 6.5px;
	width: 209px;
}

.money_1 {
	flex: 0 0 70%;
	line-height: 20px;
}

.money_2 {
	color: #6d6d6d;
	display: block;
	font-size: 12px;
	font-weight: 500;
}

.money_2_1 {
	color: #433;
	font-size: .725em;
	font-weight: 500;
}

.money_2_2 {
	color: #fa6462;
	font-size: .5em;
	font-weight: 500;
	margin-left: 3px;
}

.time_1 {
	flex: 0 0 30%;
	min-width: 50px;
	line-height: 20px;
}

.time_2 {
	color: #6d6d6d;
	display: block;
	font-size: 12px;
	font-weight: 500;
}

.time_2_1 {
	color: #433;
	font-size: .725em;
	font-weight: 500;
}
</style>

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
									<img src="../UserProfile/smile.png" alt="profile"
										style="width: auto; height: 100px;border-radius:50%">
								</c:when>
								<c:otherwise>
									<img src="../UserProfile/<%=u_img%>" alt="profile"
										style="width: auto; height: 100px;border-radius:50%">
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
						<span class="font_color" style="margin-left: 6px">${listnumber}</span> 개
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
								<img src="${tempbean.tp_img}" style="width:100%;height:190px;" class="project_list_head_img">
							</div>
						</c:otherwise>
					</c:choose>
					
					
						
						<div>
							<img src="images/trash.png" class="project_list_head_img_trash">
						</div>
						<div class="project_name">
							<div class="text_setting_1">${tempbean.tp_short_title}</div>
							<p class="text_setting_1"><%=u_nm%>의 프로젝트</p>
							
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