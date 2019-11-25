<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");

	String u_idx = (String) session.getAttribute("u_idx");
	String u_img = (String) session.getAttribute("u_img");
	String u_nm = (String) session.getAttribute("u_nm");
	out.println("u_idx: " + u_idx);
	out.println("u_nm: " + u_nm);
	out.println("u_img: " + u_img);
%>
<%-- <c:set var="contextPath" value="${pageContext.request.contextPath}" /> --%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link href="<c:url value='/css/main.css' />" rel="stylesheet" type="text/css" media="all">

<c:set var="u_idx" value="<%=u_idx%>" />

<div class="header-wrap">
	<div class="header">
		<div class="hpName-wrap">
			<a class="hpName" href="<c:url value='/main/main.jsp' />">FUNDAY</a>
		</div>
		
		<div class="leftproject-bar">
			<a class="view-project" href="<c:url value='/project/category.jsp' />">프로젝트 둘러보기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="create-project" href="<c:url value='/project/register/creationForm.jsp' />">프로젝트 올리기</a>
		</div>
		
		<c:choose>
			<c:when test='${empty u_idx}'>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/loginForm.jsp' />" class="view-login">로그인/회원가입</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="<c:url value='/images/user_account.png' />" alt="profile" style="width: auto; height: 35px;">
				</div>
			</c:when>
			<c:when test='${!empty u_img}'>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png'/>" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="view-user" style="padding: 0 10px;"><%=u_nm%></span>
					<a href="<c:url value='/user/mypage.jsp' />" class="view-mypage">
					<img src="<c:url value='/images/<%=u_img%>' />" alt="profile" style="width: auto; height: 35px;">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="view-user" style="padding: 0 10px;"><%=u_nm%></span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/user/mypage.jsp' />" class="view-mypage">
					<img src="<c:url value='/images/user_account.png' />" alt="profile" style="width: auto; height: 35px;">
					</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>