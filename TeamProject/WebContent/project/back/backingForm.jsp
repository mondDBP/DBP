<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String curUserId = (String) request.getAttribute("curUserId");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	<c:if test="${userId eq null or userid eq ''}">
		<c:redirect url="/main/main.jsp" />
		<!-- <script type='text/javascript'>alert(1);</script>-->
	</c:if>

	<!-- 프로젝트 등록이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	<c:if test="${registerFailed}">
		<c:out value="${exception.getMessage()}" />
		<<script type='text/javascript'>alert(1);</script>
	</c:if>

	<form name="form" enctype="multipart/form-data" action = "<c:url value='/project/back/success'/>" >
		<table border="1" style="margin-top: 20px;">
			<tr>
				<td colspan="2" class="title">프로젝트 후원</td>
			</tr>
			<tr>
				<td class="title">제목</td>
				<td>${project.title }
				<input type="hidden" name="title" value="${project.title}"></td>
			</tr>

			<tr>
				<td class="title">리워드 옵션</td>
				<td>
					<table id="reward" border="1" style="margin-top: 20px;">
						<tr height="30">
							<td align='center'></td>
							<td align='center'>가격</td>
							<td align='center'>배송비</td>
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
				<td><input type="text" name="amount_pledged">원</td>
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