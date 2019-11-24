<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
	function backProject() {
		document.form.action = "<c:url value='/project/view' />";
		document.form.submit();
	}

	function likeProject() {
		document.form.action = "' />";
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
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
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
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
