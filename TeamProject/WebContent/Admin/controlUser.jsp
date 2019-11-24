<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*" %>
<%@page import="model.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%
	@SuppressWarnings("unchecked") 
	List<User> userList = (List<User>)request.getAttribute("userList");
	String curUserId = (String)request.getAttribute("curUserId");//삭제
	User userInfo = (User)request.getAttribute("user");
%>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 페이지</title>
<script>
function Search(){
	form.submit();
}
function Delete(){
	form.submit();
}
</script>
</head>
<body>
<nav class="navbar navbar-expand-md bg-light">
 <ul class="navbar-nav">
  <li class="nav-item">
   <a class="nav-link" href="<c:url value='/user/list' />">회원 관리</a>
  </li>
 <li class="nav-item">
   <a class="nav-link" href="<c:url value='/project/list' />">프로젝트 관리</a>
  </li>
 </ul>
</nav>
 <form  name="form" method="POST" action="<c:url value='/user/search' />">
  <table>
   <tr>
   <td>
  	회원 검색 &nbsp; &nbsp; &nbsp;
   </td>

    <td>
    <input onFocus="this.value='' " value="회원ID를 입력하세요" type ="text" name="userId">
     <input type="button" value="검색" onClick="Search()">
     	<c:if test="${SearchFailed}">
	  				 <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
     </td>
   </tr>
  </table>
 </form>

<%
if(userInfo == null){
%>
	<form method="post" name="form" id="form" action="<c:url value='/user/delete' />">	
  <table border="1">
		<tr>
		  <td></td>
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
		
		    <input type="checkbox" name="check" value="<%=user.getUserId() %>">
		    
		  </td>
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
            <input type="submit" value="삭제" onClick="Delete()">
	  </form>
	  <%
	  }
	  else{
      %>
	 <table border="1">
		<tr>
		  <td>회원 ID</td>
		  <td>회원 PWD</td>
		  <td>이름</td>
		  <td>전화번호</td>
		  <td>주소</td>
		  <td>이메일</td>		  
		</tr>
		<tr>
		 <td><%= userInfo.getUserId() %></td>
		 <td><%= userInfo.getPassword() %></td>
		 <td><a href="<c:url value='/user/view'>
					   <c:param name='userId' value='<%=userInfo.getUserId()%>'/>
			 		 </c:url>">
			  <%=userInfo.getName()%></a></td>
		 <td><%= userInfo.getPhone() %></td>
		 <td><%= userInfo.getAddress() %></td>
		 <td><%= userInfo.getEmail() %></td>
		 </tr>
	</table>
	
	   <%
	  	 }
	   %>
</body>
</html>