<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String curUserId = (String)request.getAttribute("curUserId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/viewProject.css' />" media="all" />
</head>
<body>
	<div style="text-align:right; width:auto; margin:auto; padding:50px;">
		<select name="sortProject">
			<option value="fund_rate">모금률순</option>
			<option value="latest">최신순</option>
			<option value="likes">좋아요순</option>
		</select>
	</div>
	<div style="text-align:center; width:auto; margin:auto;">
		개의 프로젝트가 있습니다.
	</div>
	<div class="kind_1_project">
		<div class="kind_1_card_section">
		
			<div class="project_card_1" onclick="" style="float:right;">
				<div class="card_1_content">
					<div class="imgbox">
						<img src="" style="width: 200px; height: 150px;" alt="">
					</div>
					<div class="textbox">
						<h2>제목</h2>
						<h4>게시자</h4>
					</div>
					<progress value="50" max="100">
						<a href="#"></a>
					</progress>
					<div class="nowbox">
						<span>남은기한</span>
						<span style="float: right;">퍼센트</span>
					</div>
				</div>
			</div>
	
		</div>
	</div>
</body>
</html>
