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
	User userInfo = (User)request.getAttribute("user");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />" media="all" />
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
<div class="header-wrap">
		<div class="header">
			<div class="hpName-wrap">
				<a class="hpName" href="<c:url value='/main/page' />">Bumblebug</a>
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
<nav class="navbar navbar-expand-md bg-light">
 <ul class="navbar-nav">
  <li class="nav-item">
   <a class="nav-link" href="<c:url value='/user/list' />">회원 관리</a>
  </li>
 <li class="nav-item">
   <a class="nav-link" href="<c:url value='/project/list/admin' />">프로젝트 관리</a>
  </li>
   <li class="nav-item">
   <a class="nav-link" href="<c:url value='/amount/graph' />">후원 현황</a>
  </li>
 </ul>
</nav>
 <form  name="form" method="POST" action="<c:url value='/user/search' />">
 <br><br>
  <table style="margin:auto;">
   <tr>
    <td style="margin:auto;text-align:right">
    <input onFocus="this.value='' " value="회원ID를 입력하세요" type ="text" name="userId">
     <input type="button" value="검색" onClick="Search()">
     	<c:if test="${SearchFailed}">
	  				 <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
     </td>
   </tr>
  </table>
 </form>
<br>
<br>
<%
if(userInfo == null){
%>
	<form method="post" name="form" id="form" action="<c:url value='/user/delete' />">	
  <table style="margin:auto;text-align:center;" border="1" class="table table-striped">
		<tr>
		  <td><input type="submit" value="삭제" onClick="Delete()"></td>
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

	  </form>
	  <%
	  }
	  else{
      %>
	 <table style="margin:auto;text-align:center;" border="1" class="table table-striped">
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