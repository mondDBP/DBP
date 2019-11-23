<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>

function checkPw(){
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password2.focus();
		return false;
	}	
	else
		alert("비밀번호가 일치합니다.");
}

function userModify() {
	if (form.password.value == "") {
		alert("비밀번호를 입력하세요.");
		form.password.focus();
		return false;
	}
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password2.focus();
		return false;
	}	
	if (form.name.value == "") {
		alert("이름을 입력하세요.");
		form.name.focus();
		return false;
	}
	if (form.phone.value == "") {
		alert("전화번호를 입력하세요.");
		form.name.focus();
		return false;
	}
	if (form.address.value == "") {
		alert("주소를 입력하세요.");
		form.name.focus();
		return false;
	}
	if (form.email.value == "") {
		alert("이메일을 입력하세요.");
		form.name.focus();
		return false;
	}
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	}
	form.submit();
}

function userList(targetUri) {
	form.action = targetUri;
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
<form name="form" method="POST" action="<c:url value='/user/update' />">
 <input type="hidden" name="userId" value="<%=user.getUserId()%>"/>
  <table border="1">
	<tr>
		<td colspan= "2" class ="title">회원 정보 수정</td>
	</tr>

	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
	 <tr>
		<td class="title">아이디</td>
		<td>
				<%= user.getUserId() %>
		</td>
	 </tr>
	 
	  <tr>
		<td class="title">비밀번호</td>
		<td>
			<input type="password" name="password" value="<%= user.getPassword() %>">
		</td>
	 </tr>
	  	  
	  <tr>
		<td class="title">비밀번호 확인</td>
		<td>
			<input type="password" name="password2" value="<%= user.getPassword() %>">
			<input type="button" value="비밀번호 확인" onclick="checkPw()">
		</td>
	 </tr>
	   	  
	  <tr>
		<td class="title">이름</td>
		<td>
			<input type="text" name="name" value="<%= user.getName() %>">
		</td>
	 </tr>
	   
	    <tr>
		<td class="title">전화 번호</td>
		
		<td>
			<input type="text" name="phone" value="<%= user.getPhone() %>">
		</td>
	 </tr>
	   		
	 <tr>
		<td class="title">주소</td>
		<td>
			<input type="text" name="address" value="<%= user.getAddress() %>">
		</td>
	 </tr>
	 
	 <tr>
		<td class="title">이메일</td> 
		<td>
			<input type="text" name="email" value="<%= user.getEmail() %>">
		</td>
	 </tr>
      
	<tr>
	  <td colspan = "2" style = "background-color : #ececec">
	    <div>
	  		 <input type="button" value="수정" onClick="userModify()"> 
	  		 <input type="button" value="목록" onClick="userList('<c:url value='/user/list' />')">
	    </div>
	  </td>
	</tr>
  </table>  
</form>
</body>
</html>

