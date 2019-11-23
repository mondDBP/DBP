<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
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
  <table border="1">
    <tr>
	  <td>	  	    
	  	<table>
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