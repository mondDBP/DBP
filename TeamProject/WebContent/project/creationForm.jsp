<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
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
	if (form.period.value == "") {
		alert("모금기간을 입력하세요.");
		form.period.focus();
		return false;
	}
	if (form.category.value == "") {
		alert("카테고리를 선택하세요.");
		return false;
	}
	
	form.submit();
}

</script>
<style>
table{
	border-collapse : collapse;
	margin : auto;
	width : 450px;
	height : 250px;
}
.title{
	background-color : #ececec;
	text-align : center;
	font-weight : bold;
	width:80px;
}
div{
	text-align : center;
}
#text-area{
	width :400px;
	height : 70px;
}
#title{
	text-align : center;
}
</style>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<!-- registration form  -->
<form name="form" method="POST" action="<c:url value='/project/create' />">
  <table border="1">
	<tr>
		<td colspan= "2" class ="title">프로젝트 등록</td>
	</tr>

	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
  
	    <c:if test="${creationFailed}">
		    <c:out value="${exception.getMessage()}" />   <!-- <script type='text/javascript'>alert(1);</script>-->
	    </c:if>
	    
	 <tr>
		<td class="title">제목<font color="red">*</font></td>
		<td>
			<textarea name="title" cols="50"></textarea>
		</td>
	 </tr>
	 
	 <!-- 이미지 삽입 -->
	 
	  <tr>
		<td class="title">설명<font color="red">*</font></td>
		<td>
			<textarea name="description" cols="50" rows="10"></textarea>
		</td>
	 </tr>
	  	  
	  <tr>
		<td class="title">목표금액<font color="red">*</font></td>
		<td>
			<input type="text" name="goal">원
		</td>
	 </tr>
	   
	 <tr>
		<td class="title">모금기간<font color="red">*</font></td>
		<td>
			<input type = "number" name="period" min = "1" step = "1" value = "1">일
		</td>
	 </tr>
	    	
	 <tr>
		<td class="title">카테고리<font color="red">*</font></td> 
		<td>
			<select name ="category" >
				<option>게임</option>
				<option>공연</option>
				<option>디자인</option>
				<option>푸드</option>
				<option>출판</option>
				<option>테크</option>
				<option>패션</option>
				<option>캠페인</option>
				<option>반려동물</option>
				<option>교육/키즈</option>
				<option>여행/레져</option>
				<option>홈리빙</option>
			</select>
		</td>
	 </tr>
	 
	<!-- 리워드 구성 -->
	
	<tr>
	  <td colspan = "2" style = "background-color : #ececec">
	    <div>
	  		 <input type="button" value="확인" onClick="projectCreate()"> 
	    </div>
	  </td>
	</tr>
  </table>  
</form>
</body>
</html>
