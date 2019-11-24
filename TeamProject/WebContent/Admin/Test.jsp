<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" media="all" />
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

</style>
<title>회원가입</title>
</head>
<body>
	<div class="header-wrap">
		<div class="header">
			<div class="hpName-wrap">
				<a class="hpName" href="<c:url value='/main/main.jsp' />">Bumblebug</a>
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
					<a href="<c:url value='/user/mypage/logout.jsp' />">로그아웃</a>
					&nbsp;&nbsp;

				</div>
				</div>
				</div>
				<br>
				<br>
				<br>
				<br>
<!-- registration form  -->
<form  role="form" name="form" method="POST" action="<c:url value='/user/register' />">

	    <!-- 회원가입이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
  
	    <c:if test="${registerFailed}">
		    <c:out value="${exception.getMessage()}" />  
	    </c:if>
	    
	     <div  class="form-group" id="divId">
                <label for="inputId" class="col-lg-2 control-label">아이디<font color="red">*</font></label>
                <div class="col-lg-5">
                    <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="userId" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                </div>
         </div>
	 
 		 <div class="form-group" id="divPassword">
                <label for="inputPassword" class="col-lg-2 control-label">패스워드<font color="red">*</font></label>
                <div class="col-lg-5">
                    <input type="password" name="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
         </div>
         
         <div class="form-group" id="divPasswordCheck">
                <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                <div class="col-lg-5">
                    <input type="password" name="password2" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                			<input type="button" class="btn btn-default" value="비밀번호 확인" onclick="checkPw()">	
                </div>
         </div>
         
	   	      <div class="form-group" id="divName">
                <label for="inputName" class="col-lg-2 control-label">이름<font color="red">*</font></label>
                <div class="col-lg-5">
                    <input type="text" name="name" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="이름" maxlength="1"
                	<c:if test="${registerFailed}"> value="${user.name}"</c:if>>
                </div>
            </div>
             
               <div class="form-group" id="divPhone">
                <label for="inputPhone" class="col-lg-2 control-label">전화번호<font color="red">*</font></label>
                <div class="col-lg-6">
                    <input type="text" name="phone" class="form-control" id="phone" data-rule-required="true" placeholder="전화번호" maxlength="15"
                	<c:if test="${registerFailed}"> value="${user.phone}"</c:if>>
                </div>
            </div>
	   
	     <div class="form-group" id="divAddress">
                <label for="inputAddress" class="col-lg-2 control-label">주소<font color="red">*</font></label>
                <div class="col-lg-7">
                    <input type="text" name="address" class="form-control" id="address" data-rule-required="true" placeholder="주소" maxlength="15"
                	<c:if test="${registerFailed}"> value="${user.address}"</c:if>>
                </div>
            </div>
        
                
	     <div class="form-group" id="divEmail">
                <label for="inputEmail" class="col-lg-2 control-label">이메일 주소<font color="red">*</font></label>
            
                <div class="col-lg-5">
                 <div style="float:left">
                    <input type="text" name="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="15"
                	<c:if test="${registerFailed}"> value="${user.email}"</c:if>>
                </div>
                <div style="float:left">@</div>
                
                <div style="float:left">
                	<select class="form-control" name ="email2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>dongduk.ac.kr</option>
					</select>
				</div>
                </div>
            </div>          
            
          
                
	     <div class="form-group" id="divResid">
                <label for="inputResid" class="col-lg-2 control-label">주민번호<font color="red">*</font></label>

                <div class="col-lg-5">
                 <div style="float:left">
                    <input type="text" name="resid_id" class="form-control" id="resid_id" data-rule-required="true" placeholder="앞 6자리" maxlength="15"
                	<c:if test="${registerFailed}"> value="${user.resid_id}"</c:if>>
                	</div>
                	<div style="float:left">&nbsp; - &nbsp;</div>

 					<div style="float:left">
                	     <input type="text" name="resid_id2" class="form-control" id="resid_id2" data-rule-required="true" placeholder="뒤 7자리" maxlength="15"
                	<c:if test="${registerFailed}"> value="${user.resid_id2}"</c:if>>
         				 &nbsp;&nbsp;
        		  </div>
                	<input type="button" class="btn btn-default" value="체크" onClick="validate()">
             
                	</div>

            </div>       

            
            <div class="checkbox" style="clear:both">
            	<label for="inputCategory" class="col-lg-2 control-label">
            	관심분야 </label>
            	<br>
            	<br>
            	                <div class="col-lg-5">
           <table border="1">
           <tr>
           <td>
            	 <input type = "checkbox" name = "interest" value = "게임">게임 &nbsp;
   			 <input type = "checkbox" name = "interest" value = "공연">공연 &nbsp;
   			 <input type = "checkbox" name = "interest" value = "디자인">디자인 &nbsp;
   			 <input type = "checkbox" name = "interest" value = "푸드">푸드 &nbsp;
   			 <input type = "checkbox" name = "interest" value = "출판">출판 &nbsp;
   			 <input type = "checkbox" name = "interest" value = "테크/가전">테크 &nbsp;
   			 <br>
 	  		 <input type = "checkbox" name = "interest" value = "패션">패션 &nbsp;
  	 		 <input type = "checkbox" name = "interest" value = "캠페인">캠페인 &nbsp;
    		 <input type = "checkbox" name = "interest" value = "반려동물">반려동물 &nbsp;
   			 <input type = "checkbox" name = "interest" value = "교육/키즈">교육/키즈&nbsp;
   			 <input type = "checkbox" name = "interest" value = "여행/레져">여행/레져&nbsp;
   			 <input type = "checkbox" name = "interest" value = "홈리빙">홈리빙&nbsp;
   			 </td>
   			 </tr>
   			 </table>
   			 </div>
            
            	
            </div>   
            
               <br><br>         
            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <input type="submit" class="btn btn-default" value="회원가입" onClick="userCreate()">
                </div>
            </div>  
</form>
</body>
</html>