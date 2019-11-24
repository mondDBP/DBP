<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	User user = (User)request.getAttribute("user");
%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
function userRemove() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>
</head>

<body>
  <br>
  <table style="margin:auto;text-align:center;">
    <tr>
	  <td>	  	    
	  	<table border="1">
	  	  <tr>
			<td>회원 ID</td>
			<td>
				<%=user.getUserId()%>
			</td>
		  </tr>
		  <tr>
			<td>회원 PWD</td>
			<td>
				<%=user.getPassword()%>
			</td>
		  </tr>
		    <tr>
			<td>이름</td>
			<td>
				<%=user.getName()%>
			</td>
		  </tr>
		    <tr>
			<td>전화번호</td>
			<td>
				<%=user.getPhone()%>
			</td>
		  </tr>
		  <tr>
			<td>주소</td>
			<td>
				 <%=user.getAddress()%> 
			</td>
		  </tr>		  
		  <tr>
			<td>이메일</td>
			<td>
				<%=user.getEmail()%>
			</td>
		  </tr>	  
	 	</table>
	 	
	 	 <a href="<c:url value='/user/update/form'>
	     		   <c:param name='userId' value='<%=user.getUserId()%>'/>
			 	 </c:url>">수정</a> &nbsp;
 	    <a href="<c:url value='/user/delete'>
				   <c:param name='userId' value='<%=user.getUserId()%>'/>
			 	 </c:url>" onclick="return userRemove();">삭제</a> &nbsp;
 	    <a href="<c:url value='/user/list' />">목록</a>
 	    
	 </td>
	</tr>
 </table>
	 	
</body>
</html>