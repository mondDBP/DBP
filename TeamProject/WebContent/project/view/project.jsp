<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String curUserId = (String) request.getAttribute("curUserId");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta charset="UTF-8">
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

<script>
	function backProject() {
		document.form.action = "<c:url value='/project/back'><c:param name='title' value='${project.title}'/></c:url>";
		document.form.submit();
	}
function likeProject(vs) {
		
		document.form.action = "<c:url value='/project/like'><c:param name='title' value='${project.title}'/></c:url>";
		document.form.submit();
	} 

</script>
<style>
table {
	border-collapse: collapse;
	margin: auto;
	width: 450px;
	height: 250px;
}

.title {
	background-color: #ececec;
	text-align: center;
	font-weight: bold;
	width: 150px;
}

div {
	text-align: center;
}

#text-area {
	width: 400px;
	height: 70px;
}

#title {
	text-align: center;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/viewProjectList.css' />" media="all" />
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
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
	<form name="form" method="POST">
		<table border="1" style="text-align:center; margin-top: 20px;">
			<tr>
				<td colspan="3"><img src="${project.image }" style="width: 500px; height: 400px;" alt=""></td>
			</tr>
			<tr>
				<td colspan="3"><h2>${project.title }</h2></td>
			</tr>
			<tr>
				<td>남은 기간: ${project.rest_day }일</td>
				<td>모금률: ${project.fund_rate }%</td>
				<td>총 모금 금액: ${project.total_money }원</td>
			</tr>
			<tr>
				<td colspan="3">${project.description }</td>
			</tr>
			<tr>
				<td colspan="3" style="background-color: #ececec">
					<div>
						<input type="button" value="후원하기" onClick="backProject()">
				    	<input type="button" value="좋아요" onClick="likeProject()"> 
			 	<%--  <a href="<c:url value='/project/like' >
	     		   <c:param name='title' value='${project.title}'/>
			 	 </c:url>">좋아요</a> &nbsp; --%>
					
					<c:if test="${kk != 'hi' }">
						 <c:choose>
						  <c:when test="${empty curUserId}">
						  <script>
						   alert('<c:out value="로그인해주세요"/>')
						   </script>
						   </c:when>
						  <c:when test="${registerFailed}">
							<script>
							alert('<c:out value="좋아요를 이미 누르셨습니다!"/>')
							</script> 
						  </c:when>
						  <c:when test="${not registerFailed}">
						  	<script>
							alert('<c:out value="좋아요가 성곡적으로 등록되었습니다!"/>')
							</script> 
						  </c:when>
						 </c:choose>
					</c:if>
	    		    <c:if test="${kk=='hi'}">
					   <c:out value="좋아요를 누르세요"/>
				    </c:if> 
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
