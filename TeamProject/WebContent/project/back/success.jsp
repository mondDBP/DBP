<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String curUserId = (String) request.getAttribute("curUserId");
%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" media="all" />

<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" media="all" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>

<script type="text/javascript">
	function redirect() { 
		form.submit();
	}
</script>
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
	<br>
	<br>
	<br>
	<form name="form" method="POST" action="<c:url value='/main/main.jsp' />">
<div style="text-align:center;">
<h2><c:out value="${result }" /></h2>
<br><br><br>
<!-- 메인페이지로 돌아가기 추가-->
<input type="button" class="btn btn-warning" value="메인으로 돌아가기" onClick="redirect()" />
</div>
</form>
</body>
</html>