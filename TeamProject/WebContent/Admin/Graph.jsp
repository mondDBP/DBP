<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Project" %>
<%@page import="model.Back_Order" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%
	@SuppressWarnings("unchecked") 
    int result = (int)request.getAttribute("result");
	int amount = (int)request.getAttribute("amount");
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
  <script type="text/javascript">
  window.onload = function () {
	  var chartColors = {
			  color1: 'rgba(77, 166, 255, 0.5)',
			  color2: 'rgba(218, 165, 32, 0.5)',
			  color3: 'rgba(175, 0, 42, 0.5)'
			};
	  
	  var no = <%= (int)request.getAttribute("result") %>;
	  var amount = <%= (int)request.getAttribute("amount") %>;
    var chart = new CanvasJS.Chart("chartContainer",
    {
      title:{
      text: "일일별 누적 후원자 수(명)"  
      },
      data: [
  
      {        
          type: "bar",
          dataPoints: [
         
          { label: "후원자수", y : no, color: "LightSeaGreen"}
          ]
        }
      ]
    });
	chart.render();
    
    var chart = new CanvasJS.Chart("chartContainer2",
    	    {
    	      title:{
    	      text: "일일별 누적 모금액(원)"  
    	      },
    	      data: [
    	  
    	      {        
    	          type: "bar",
    	          dataPoints: [
    	          { label: "누적 판매량", y: amount, color:"Orange" }

    	          ]
    	        }
    	      ]
    	    });
    chart.render();
  }
  </script>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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

	 <div id="chartContainer2" style="height: 300px; width: 100%;"></div>
	 &nbsp;&nbsp;
	 	 <div id="chartContainer" style="height: 300px; width: 100%;"></div>
</body>
</html>