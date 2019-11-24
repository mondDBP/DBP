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
	List<Back_Order> projectList = (List<Back_Order>)request.getAttribute("backList");
%>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관리자 페이지</title>
  <script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart(document.getElementById("line-chart"),
    		{
    	  type: 'line',
    	  data: {
    	    labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
    	    datasets: [{ 
    	        data: [86,114,106,106,107,111,133,221,783,2478],
    	        label: "Africa",
    	        borderColor: "#3e95cd",
    	        fill: false
    	      }, { 
    	        data: [282,350,411,502,635,809,947,1402,3700,5267],
    	        label: "Asia",
    	        borderColor: "#8e5ea2",
    	        fill: false
    	      }, { 
    	        data: [168,170,178,190,203,276,408,547,675,734],
    	        label: "Europe",
    	        borderColor: "#3cba9f",
    	        fill: false
    	      }, { 
    	        data: [40,20,10,16,24,38,74,167,508,784],
    	        label: "Latin America",
    	        borderColor: "#e8c3b9",
    	        fill: false
    	      }, { 
    	        data: [6,3,2,2,7,26,82,172,312,433],
    	        label: "North America",
    	        borderColor: "#c45850",
    	        fill: false
    	      }
    	    ]
    	  },
    	  options: {
    	    title: {
    	      display: true,
    	      text: 'World population per region (in millions)'
    	    }
    	  }
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
<canvas id="line-chart" width="800" height="450"></canvas>
</body>
</html>