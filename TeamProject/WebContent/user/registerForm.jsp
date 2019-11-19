<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
<script>
function validate(){
	if(form.resid_id.value.length != 6){
		alert("앞자리는 6자리입니다.");
		return false;
	}
	else if(form.resid_id2.value.length != 7){
		alert("뒷자리는 7자리입니다.");
		return false;
	}
	alert("올바른 주민번호입니다.")
}


function checkPw(){
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.password2.focus();
		return false;
	}	
	else
		alert("비밀번호가 일치합니다.");
}

function userCreate() {
	if (form.userId.value == "") {
		alert("아이디를 입력하세요.");
		form.userId.focus();
		return false;
	} 
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
	if (form.resid_id.value == "" || form.resid_id2.value == "") {
		alert("주민번호를 입력하세요.");
		form.name.focus();
		return false;
	}
	if(form.resid_id.value.length != 6){
		alert("앞자리는 6자리입니다.");
		return false;
	}
	else if(form.resid_id2.value.length != 7){
		alert("뒷자리는 7자리입니다.");
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
<form name="form" method="POST" action="<c:url value='/user/register' />">
  <table border="1">
	<tr>
		<td colspan= "2" class ="title">회원 가입</td>
	</tr>

	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
  
	    <c:if test="${registerFailed}">
		    <c:out value="${exception.getMessage()}" />   <!-- <script type='text/javascript'>alert(1);</script>-->
	    </c:if>
	    
	 <tr>
		<td class="title">아이디<font color="red">*</font></td>
		<td>
			<input type="text" name="userId">
		</td>
	 </tr>
	 
	  <tr>
		<td class="title">비밀번호<font color="red">*</font></td>
		<td>
			<input type="password" name="password">
		</td>
	 </tr>
	  	  
	  <tr>
		<td class="title">비밀번호 확인</td>
		<td>
			<input type="password" name="password2">
			<input type="button" value="비밀번호 확인" onclick="checkPw()">
		</td>
	 </tr>
	   	  
	  <tr>
		<td class="title">이름<font color="red">*</font></td>
		<td>
			<input type="text" name="name" 
			<c:if test="${registerFailed}"> value="${user.name}"</c:if>>
			</td>
	 </tr>
	   
	 <tr>
		<td class="title">전화 번호<font color="red">*</font></td>
		
		<td>
			<input type="text" name="phone" 
			<c:if test="${registerFailed}">value="${user.phone}"</c:if>>
		</td>
	 </tr>
	   		
	 <tr>
		<td class="title">주소</td>
		<td>
			<input type="text" name="address" 
			<c:if test="${registerFailed}"> value="${user.address}"</c:if>>
		</td>
	 </tr>
	    	
	 <tr>
		<td class="title">이메일<font color="red">*</font></td> 
		<td>
			<input type="text" name="email" 
			<c:if test="${registerFailed}"> value="${user.email}"</c:if>>@
			<select name ="email2">
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>dongduk.ac.kr</option>
			</select>
		</td>
	 </tr>
	    		    	
	    		
	 <tr>
		<td class="title">주민번호</td> <!-- 주민번호 유효성검사 -->
		<td>
			<input type="text" name="resid_id" id="resid_id"
			<c:if test="${registerFailed}"> value="${user.resid_id}"</c:if>> - 
			<input type="text" name="resid_id2" id="resid_id2"
			<c:if test="${registerFailed}"> value="${user.resid_id2}"</c:if>>
			<input type="button" value="체크" onClick="validate()">
		</td>
	 </tr>
	    
	 <tr>
  	 	<td class = "title">관심분야</td>
  		<td>
    	 <input type = "checkbox" name = "interest" value = "게임">게임
   		 <input type = "checkbox" name = "interest" value = "공연">공연
   		 <input type = "checkbox" name = "interest" value = "디자인">디자인
   		 <input type = "checkbox" name = "interest" value = "푸드">푸드
   		 <br>
   		 <input type = "checkbox" name = "interest" value = "출판">출판
   		 <input type = "checkbox" name = "interest" value = "테크/가전">테크
   		 <input type = "checkbox" name = "interest" value = "패션">패션
   		 <input type = "checkbox" name = "interest" value = "캠페인">캠페인
   		 <br>
    	 <input type = "checkbox" name = "interest" value = "반려동물">반려동물
   		 <input type = "checkbox" name = "interest" value = "교육/키즈">교육/키즈
   		 <input type = "checkbox" name = "interest" value = "여행/레져">여행/레져
   		 <input type = "checkbox" name = "interest" value = "홈리빙">홈리빙
   		</td>
  	</tr>
      
	<tr>
	  <td colspan = "2" style = "background-color : #ececec">
	    <div>
	  		 <input type="button" value="회원 가입" onClick="userCreate()"> 
	    </div>
	  </td>
	</tr>
  </table>  
</form>
</body>
</html>
