<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Bean.*" %>
<%@ page import="dbConnection.*" %>

<jsp:useBean id="ProjectDAO" class="DAO.ProjectDAO"/>
<jsp:useBean id="ProjectBean" class="Bean.ProjectBean"/>
<jsp:useBean id="PresentBean" class="Bean.PresentBean" scope="session"/>
<jsp:useBean id="UserBean" class="Bean.UserBean"/>
<jsp:useBean id="FundBean" class="Bean.FundBean" scope="session"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");

	String pj_idx = (String)session.getAttribute("pj_idx"); //프로젝트 인덱스
	String u_idx = (String)session.getAttribute("u_idx"); //회원 인덱스
	
	if(u_idx == null){
		//response.sendRedirect("login.jsp");
	} else {
		
		int pledge_money = Integer.parseInt(request.getParameter("pledge_money")); //회원이 입력한 후원 금액
		int p_idx = Integer.parseInt(request.getParameter("p_idx")); //회원이 선택한 선물 인덱스
		
		PresentBean = ProjectDAO.getPresent(p_idx);
		
		FundBean.setF_price(pledge_money); // 후원하는 금액 FundBean 저장.
		FundBean.setF_p_idx(p_idx); // 프로젝트의 후원 선물 FundBean 저장.
		
		int check = ProjectDAO.checkUserCase(u_idx); // 회원의 카드지불 정보, 배송지 정보  유무 체크.
		
		if(check == 1) {
			response.sendRedirect("CardpayPage.jsp"); // 지불 정보 입력 페이지
		} else if(check == 2) {
			response.sendRedirect("ZipcodeInsertPage.jsp"); // 주소 찾기 페이지
		} else {
			response.sendRedirect("SelecAddrPage.jsp"); // 배송지 선택 페이지
		}
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>