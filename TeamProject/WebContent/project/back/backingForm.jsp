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
	
	function projectCreate() {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.description.value == "") {
			alert("설명을 입력하세요.");
			form.description.focus();
			return false;
		}

		if (form.goal.value == "") {
			alert("목표금액을 입력하세요.");
			form.goal.focus();
			return false;
		}
		if (form.funding_period.value == "") {
			alert("모금기간을 입력하세요.");
			form.period.focus();
			return false;
		}
		if (form.category_name.value == "") {
			alert("카테고리를 선택하세요.");
			return false;
		}

		form.submit();
	}
	
	function rowAdd() {
		var table = document.getElementById("reward");
		var rowlen = table.rows.length;
		var row = table.insertRow(rowlen-1);
		var rowItem = "<tr>";
		rowItem += "<td height='10'>" + cnt++ + "</td>";
		rowItem += "<td height='10'><input type='number' name='optPrice'></td>";
		rowItem += "<td height='10'><input type='number' name='optShippingFee'></td>";
		rowItem += "<td height='10'><input type='text' name='optDesc'></td>";
		rowItem += "<td height='10'><input type='number' name='optLimit'></td>";
		rowItem += "</tr>";
		row.innerHTML += rowItem;
	}

	$("#gdsImg").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result).width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
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

	<form name="form" method="POST" enctype="multipart/form-data" action="<c:url value='/project/backSuccess' />">
		<table border="1" style="margin-top: 20px;">
			<tr>
				<td colspan="2" class="title">프로젝트 후원</td>
			</tr>
			<tr>
				<td class="title">제목</td>
				<td>${project.title }</td>
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
								<td height="10">${vs.index }</td>
								<td height="10">${opt.price }</td>
								<td height="10">${opt.shipping_fee }</td>
								<td height="10">${opt.description }</td>
								<!-- 한정 수량?? -->
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>

			<tr>
				<td class="title">리워드 옵션 입력<font color="red">*</font></td>
				<td><input type="text" name="rewardOpt"></td>
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
							<td height="10"><input type="text" name="card_company" value="${card.card_company }"></td>
							<td height="10"><input type="text" name="card_number" value="${card.card_number }"></td>
							<td height="10"><input type="date" name="card_expiration" value="${card.expiration }"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td colspan="2" style="background-color: #ececec">
					<div>
						<input type="submit" value="확인" onClick="projectCreate()">
					</div>
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>