<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String curUserId = (String)request.getAttribute("curUserId");

%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="title" value="${project.title}" />


<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" media="all" />

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<script>
	function viewProj(vs) {
		var hidden = document.getElementById(vs);
		var str = "<input type='hidden' value='" + vs + "' name='title' />";
		hidden.innerHTML += str;
		form.submit();
	}
	
	
	function selectSorting(){
	    var obj = document.getElementById("sortProj");
	    var selectValue = obj.options[obj.selectedIndex].value;
	    
	    if (selectValue == "fund_rate") {
	    	form.action = "<c:url value='/project/list/fundrate' />";
	    } else if (selectValue == "latest") {
	    	form.action = "<c:url value='/project/list/latest' />";
	    } else if (selectValue == "likes") {
	    	form.action = "<c:url value='/project/list/likes' />";
	    } else {
	    	form.action = "<c:url value='/project/list' />";
	    }
	    
		form.submit();
	}
	
</script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/viewProjectList.css' />" media="all" />
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
		<div class="rightproject-bar">
					<a href="<c:url value='/project/search.jsp' />" class="search-project"><img src="<c:url value='/images/search.png' />" style="width: auto; height: 35px;"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					&nbsp;&nbsp;&nbsp;
			<c:choose>
			 <c:when test='${empty curUserId}'>			
			 <a href="<c:url value='/user/login/login.jsp' />" class="view-login">로그인/회원가입</a>
				
			</c:when>
			<c:otherwise>
				<a href="<c:url value='/user/mypage/logout.jsp' />">로그아웃</a>
					&nbsp;&nbsp;
</c:otherwise>
			</c:choose>

				</div>
				</div>
				</div>
	<form name="form" method="POST"
		action="<c:url value='/project/view' />">
		<div style="text-align: right; width: auto; margin: auto; padding: 30px;">
			<select id="sortProj" onchange="selectSorting()">
				<option value="default"></option>
				<option value="fund_rate">모금률순</option>
				<option value="latest">최신순</option>
				<option value="likes" selected>좋아요순</option>
			</select>
		</div>

		<div style="text-align: center; width: auto; margin: 10px;">총 ${numOfProj }개의 프로젝트가 있습니다.</div>

		<div class="kind_1_project">
			<table>
				<tr>
					<c:forEach var="project" items="${projList }" varStatus="vs">
						<td>
							<div class="project_card_1"
								onClick="viewProj('${project.title}')">
								<div class="imgbox">
									<img src="${project.image }"
										style="width: 200px; height: 150px;" alt="">
								</div>
								<div class="textbox">
									<h5>${project.title}</h5>
									<div id="${project.title}"></div>
								</div>
								<progress value="${project.fund_rate }" max="100">
									<a href="#"></a>
								</progress>
								<div class="nowbox">
									<span>${project.rest_day }일 남음</span> <span
										style="float: right;">${project.fund_rate }%</span>
								</div>
							</div>
						</td>
						<c:if test="${vs.count % 4 == 0}">
							<c:out value="</tr><tr>" escapeXml="false" />
						</c:if>
						<c:if test="${vs.last }">
							<c:out value="</tr>" escapeXml="false" />
						</c:if>
					</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>