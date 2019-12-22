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

	
</body>
</html>
