<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Project" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%
	@SuppressWarnings("unchecked") 
	List<Project> projectList = (List<Project>)request.getAttribute("projectList");
	String curProId = (String)request.getAttribute("curProId");//삭제
	Project proInfo = (Project)request.getAttribute("project");
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
   <a class="nav-link" href="<c:url value='/project/list/admin' />">프로젝트 관리</a>
  </li>
  <li class="nav-item">
   <a class="nav-link" href="<c:url value='/amount/graph' />">후원 현황</a>
  </li>
 </ul>
</nav>
 <form  name="form" method="POST" action="<c:url value='/project/search' />">
  <table>
   <tr>
   <td>
  	프로젝트 검색 &nbsp; &nbsp; &nbsp;
   </td>

    <td>
    <input onFocus="this.value='' " value="프로젝트 제목을 입력하세요" type ="text" name="proTitle">
     <input type="button" value="검색" onClick="Search()">
     	<c:if test="${SearchFailed}">
	  				 <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>
     </td>
   </tr>
  </table>
 </form>

<%
if(proInfo == null){
%>
<form method="post" name="form" id="form" action="<c:url value='/project/delete' />">	
  <table border="1">
		<tr>
		  <td></td>
		  <td>프로젝트ID</td>	  
		  <td>제목</td>
		  <td>시작일</td>
		  <td>사진</td>
		  <td>목표</td>
		  <td>모금률</td>
		  <td>남은기간</td>
		  <td>총 금액</td>
		  <td>카테고리</td>
		</tr>
<%
	if (projectList != null) {	
	  Iterator<Project> projectIter = projectList.iterator();
	
	  //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
	  while ( projectIter.hasNext() ) {
		Project pro = (Project)projectIter.next();
%>		  	
		<tr>
		 <td>
		
		  <input type="checkbox" name="check" value="<%=pro.getProject_id() %>">
		    
		  </td>
		  <td>
		  <%=pro.getProject_id() %>
		  </td>
		  <td>
		  <a href="<c:url value='/project/view'>
					   <c:param name='projectTitle' value='<%=pro.getTitle()%>'/>
			 		 </c:url>">
			  <%=pro.getTitle() %></a>
			
		  </td> 
		  <td>
		  <%=pro.getStart_date() %>
		  </td>
		  <td>
		   <img src="<%=pro.getImage()%>" width="50px" height='50px' /> 
		  사진
		  </td>
		  
		<td>
		<%=pro.getGoal() %>
		 </td>
		 <td>
		 <%=pro.getFund_rate() %>
		  </td>
		  <td>
		  <%=pro.getRest_day() %>
		  </td>
		    <td>
		  <%=pro.getTotal_money() %>
		  </td>
		  <td>
		  <%=pro.getCategory_name() %>
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
		  <td>프로젝트ID</td>	  
		  <td>제목</td>
		  <td>시작일</td>
		  <td>사진</td>
		  <td>목표</td>
		  <td>모금률</td>
		  <td>남은기간</td>
		  <td>총금액</td>
		  <td>카테고리</td>
	   </tr>
	   <tr>
	    <td><%= proInfo.getProject_id() %></td>
	    <td>	  <a href="<c:url value='/project/view'>
					   <c:param name='projectTitle' value='<%=proInfo.getTitle()%>'/>
			 		 </c:url>">
			  <%=proInfo.getTitle() %></a>
			</td>
	    <td><%= proInfo.getStart_date()%></td>
	     <td><img src="<%= proInfo.getImage() %>" width="50px" height="50px"></td> 
	    <!--  <td>사진</td>-->
	    <td><%= proInfo.getGoal() %></td>
	    <td><%= proInfo.getFund_rate() %></td>
	    <td><%= proInfo.getRest_day() %></td>
	    <td><%= proInfo.getTotal_money() %>
	    <td><%= proInfo.getCategory_name() %></td>
	   </tr>
	</table>
	
	<%
	 }
	%>
</body>
</html>