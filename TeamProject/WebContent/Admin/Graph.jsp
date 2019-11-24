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
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
    	          { label: "누적 모금액", y: amount, color:"Orange" }

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
<nav class="navbar navbar-expand-md bg-light">
 <ul class="navbar-nav">
  <li class="nav-item">
   <a class="nav-link" href="<c:url value='/user/list' />">회원 관리</a>
  </li>
 <li class="nav-item">
   <a class="nav-link" href="<c:url value='/project/list' />">프로젝트 관리</a>
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