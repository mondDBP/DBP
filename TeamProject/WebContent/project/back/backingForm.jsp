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
	var cnt = 2;
	
	function backProject() {
		if (form.rewardOpt.value == "") {
			alert("리워드 옵션을 입력하세요.");
			form.title.focus();
			return false;
		}
		
		if (form.amount_pledged.value == "") {
			alert("후원 금액을 입력하세요.");
			form.amount_pledged.focus();
			return false;
		}
		if (form.address.value == "") {
			alert("주소를 입력하세요.");
			form.address.focus();
			return false;
		}
		if (form.card_company.value == "") {
			alert("카드사를 입력하세요.");
			form.card_company.focus();
			return false;
		}
		if (form.card_number.value == "") {
			alert("카드번호를 입력하세요.");
			form.card_number.focus();
			return false;
		}
		if (form.card_exp.value == "") {
			alert("카드 유효기간을 입력하세요.");
			form.card_exp.focus();
			return false;
		}
		
		//document.form.action = "<c:url value='/project/back/success'><c:param name='title' value='${project.title}'/></c:url>";
		document.form.submit();
	}
	
	function selectOpt(){
	    var obj = document.getElementById("rewardOpt");
	    var selectValue = obj.options[obj.selectedIndex].value;
	   
		document.form.option.value = selectValue;
	}
</script>
<style>
table {
	border-collapse: collapse;
	margin: auto;
	width: 450px;
	height: 250px;
}

#reward {
	height: 100px;
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
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<!-- 로그인 하지 않은 사용자는 프로젝트 후원 불가 -->
	<c:if test="${curUserId eq null}">
		<c:redirect url="/user/login/login.jsp" />
	</c:if>
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
	<form name="form" enctype="multipart/form-data" action = "<c:url value='/project/back/success'/>" >
		<table border="1" style="margin-top: 20px;">
			<tr>
				<td colspan="2" class="title">프로젝트 후원</td>
			</tr>
			<tr>
				<td class="title">제목</td>
				<td>${project.title }
				<input type="hidden" name="title" value="${project.title}"></td>
				<c:out value='${param.address}' />
			</tr>

			<tr>
				<td class="title">리워드 옵션</td>
				<td>
					<table id="reward" border="1" style="margin-top: 20px;">
						<tr height="30">
							<td align='center'></td>
							<td align='center'>가격(원)</td>
							<td align='center'>배송비(원)</td>
							<td align='center'>설명</td>
							<td align='center'>한정수량</td>
						</tr>
						<c:forEach var="opt" items="${rewardOptList }" varStatus="vs">
							<tr>
								<td height="10">${vs.count }</td>
								<td height="10">${opt.price }~</td>
								<td height="10">${opt.shipping_fee }</td>
								<td height="10">${opt.description }</td>
								<td height="10">${opt.amount_limit }</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>

			<tr>
				<td class="title">리워드 옵션 선택<font color="red">*</font></td>
				<td>
				<input type='hidden' value='${rewardOptList[0].option_id }' name='option' />
				<select id="rewardOpt" onchange="selectOpt()">
					<c:forEach var="opt" items="${rewardOptList }" varStatus="vs">
						<option value="${opt.option_id }">${vs.count }</option>
					</c:forEach>
				</select>번</td>
			</tr>
			
			<tr>
				<td class="title">후원 금액 입력<font color="red">*</font></td>
				<td>가격 + 배송비: <br><input type="text" name="amount_pledged">원</td>
			</tr>
			
			<tr>
				<td class="title">주소 입력<font color="red">*</font></td>
				<td><textarea name="address" cols="50">${user.address }</textarea></td>
			</tr>

			<tr>
				<td class="title">카드 정보 입력<font color="red">*</font></td>
				<td>
					<table id="card" border="1" style="margin-top: 20px;">
						<tr height="30">
							<td align='center'>카드사</td>
							<td align='center'>카드번호</td>
							<td align='center'>카드 유효기간</td>
						</tr>
						<tr>
							<td height="10"><input type="text" name="card_company" value="${card[0].card_company }"></input></td>
							<td height="10"><input type="text" name="card_number" value="${card[0].card_number }"></td>
							<td height="10"><input type="date" name="card_expiration" value="${card[0].expiration }"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td colspan="2" style="background-color: #ececec">
					<div id="submit">
						<input type="submit" value="확인" onClick="backProject()">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>