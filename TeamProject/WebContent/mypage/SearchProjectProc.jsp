<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
	String u_idx = (String) session.getAttribute("u_idx");
	
	String search = request.getParameter("search");
	ArrayList<FundBean> list = MypageDAO.getSearchFundBox(u_idx, search);
	int count = list.size();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="list" value="<%=list%>" />
<c:set var="count" value="<%=count %>"/>
<body>
<div></div>
	<c:forEach var="fundbean" items="${list}">
		<c:url var="detailurl" value="MypageUpdateFund.jsp">
	 		<c:param name="f_pj_idx" value="${fundbean.f_pj_idx}" />
	
		</c:url>
		
		
		<a href='${detailurl}' style="text-decoration:none; color:rgba(0,0,0,.87);">
		
		<div class="pj_container">
			<div class="box_header">
				<b>${fundbean.f_dt}</b> <span class="box_number">후원번호 <b>:${fundbean.f_idx}</b>
				</span>
			</div>
			<div class="box_body">

				<div class="box_body_in">
					<div class="pic">
						<img src="${fundbean.projectbean.pj_img}" style="width: 150px; height: auto;">
					</div>
					<div class="pic_right_text">
						<div>
							<label class="fund_ing"> 펀딩 진행중 </label>
						</div>
						<div class="text_1">
							${fundbean.projectbean.pj_title} 
						</div>
						<div class="text_2">
							${fundbean.presentbean.p_explain } <br>
						</div>
						<div class="text_3">
							<b>${fundbean.f_price}원</b>을 후원하셨습니다
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>