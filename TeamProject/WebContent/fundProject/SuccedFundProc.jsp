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
<jsp:useBean id="DelBean" class="Bean.DelBean" scope="session"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");

	String pj_idx = (String)session.getAttribute("pj_idx"); //프로젝트 인덱스
	String u_idxx = (String)session.getAttribute("u_idx"); //회원 인덱스
	int u_idx = Integer.parseInt(u_idxx);
	
	String d_idx = request.getParameter("d_idx");
	
	if(d_idx==null) {
		// 회원의 새로운 배송지 DEL_TB insert
		String d_ph = request.getParameter("d_ph");
		String d_zipcode = request.getParameter("d_zipcode");
		String d_addr = request.getParameter("d_addr");
		String d_detail_addr = request.getParameter("d_detail_addr");
		String owner_ph = request.getParameter("owner_ph");
		
		DelBean.setD_u_idx(u_idx);
		DelBean.setD_ph(d_ph);
		DelBean.setD_zipcode(d_zipcode);
		DelBean.setD_addr(d_addr);
		DelBean.setD_detail_addr(d_detail_addr);
		
		Boolean delflag = ProjectDAO.insertDel(DelBean);
		int d_idxx = ProjectDAO.setDelidx(DelBean); 
		
		response.sendRedirect("SuccedFundPage.jsp?d_idx="+d_idxx); // 새로 입력한 배송지 idx 전달
	} else {
		
		response.sendRedirect("SuccedFundPage.jsp?d_idx="+d_idx); // 기존 배송지 idx 전달
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