<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	Project project = (Project)request.getAttribute("project");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script>
function projectRemove() {
	return confirm("정말 삭제하시겠습니까?");		
}
</script>
</head>

<body>
  <br>
  
  
  <table style="margin:auto;text-align:center;" border="1">
    <tr>
	  <td>	  	      
	  	<table border="1">
	  	  <tr>
			<td>프로젝트 ID</td>
			<td>
				<%=project.getProject_id()%>
			</td>
		  </tr>
		  <tr>
			<td>제목</td>
			<td>
				<%=project.getTitle()%>
			</td>
		  </tr>
		    <tr>
			<td>시작일</td>
			<td>
       			<%=project.getStart_date()%>
			</td>
		  </tr>
     <tr>
			<td>설명</td>
			<td>
       			<%=project.getDescription()%>
			</td>
		  </tr>
		    <tr>
			<td>사진</td>
			<td>
				<img src="<%=project.getImage()%>"  width="100px" height="100px">
			</td>
		  </tr>
		  <tr>
			<td>목표</td>
			<td>
				<%=project.getGoal()%>
			</td>
		  </tr>		  
		  <tr>
			<td>모금률</td>
			<td>
				<%=project.getFund_rate()%>
			</td>
		  </tr>		
		   <tr>
			<td>남은 기간</td>
			<td>
				<%=project.getRest_day()%>
			</td>
		  </tr>		 
		   <tr>
			<td>총금액</td>
			<td>
				<%=project.getTotal_money()%>
			</td>
		  </tr>		
		   <tr>
			<td>카테고리</td>
			<td>
				<%=project.getCategory_name()%>
			</td>
		  </tr>		
	 	</table>
 	     	    <a href="<c:url value='/project/list/admin' />">목록</a>
	 </td>
	</tr>
 </table>
	 	
</body>
</html>