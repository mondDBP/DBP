<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*" %>
<%@page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	@SuppressWarnings("unchecked") 
	List<User> userList = (List<User>)request.getAttribute("userList");
	String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 페이지</title>
</head>
<body>
  <table border="1">
		<tr>
		  <td>회원 ID</td>
		  <td>회원 PWD</td>
		  <td>이름</td>
		  <td>전화번호</td>
		  <td>주소</td>
		  <td>이메일</td>		  
		</tr>
<%
	if (userList != null) {	
	  Iterator<User> userIter = userList.iterator();
	
	  //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
	  while ( userIter.hasNext() ) {
		User user = (User)userIter.next();
%>		  	
		<tr>
		  <td>
			<%=user.getUserId()%>
		  </td>
		  <td>
			<%=user.getPassword()%>
		  </td> 
		  <td>
				<a href="<c:url value='/user/view'>
					   <c:param name='userId' value='<%=user.getUserId()%>'/>
			 		 </c:url>">
			  <%=user.getName()%></a>
		  </td>
		  <td>
		  	 <%=user.getPhone()%>
		  </td>
		  <td>
		     <%=user.getAddress()%>
		  </td>
		  <td>
			 <%=user.getEmail()%>
		  </td>
		</tr>
<%
	  }
	}
%>	  	
	  </table>	  	 
</body>
</html>