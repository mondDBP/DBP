<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 	request.setCharacterEncoding("UTF-8");
	
	String u_idx= (String)session.getAttribute("u_idx");
	out.println(u_idx);
	
	ArrayList<FundBean> list = MypageDAO.getFundBox(u_idx);
	
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>jQuery Style</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.box-wrap {
	width: 100%;
	position: relative;
	display: flex;
	flex-direction: column;
	background: #fff;
	height: 100%;
	border: 2px solid rebeccapurple;
}

.box-header {
	border: 1px solid black;
	border-radius: .28571429rem;
	font-size: .9em;
	font-weight: 400;
	padding-bottom: .5em;
	padding: .5em 1.5em;
}

.box-fund-num {
	float: right;
}

.box-container {
	height: 100%;
	width: 100%;
	border: 1px dotted tomato;
}

.box-container:before {
	content: '';
	display: inline-block;
	width: 6px;
	height: 6px;
	margin: -5px 10px auto 4px;
	vertical-align: middle;
	border-right: 1px solid red;
	border-top: 1px solid red;
	transform: rotate(45deg)
}
</style>

</head>
<c:set var="list" value="<%=list %>" />
<body>
	<c:forEach var="fundbean" items="${list}">
		<c:url var="detailurl" value="MypageUpdateFund.jsp">
			<c:param name="f_pj_idx" value="${fundbean.f_pj_idx}" />
			<c:param name="pj_img" value="${fundbean.projectbean.pj_img}" />
			<c:param name="pj_title" value="${fundbean.projectbean.pj_title}" />
		</c:url>

		<a href='${detailurl}'
			style="text-decoration: none; color: rgba(0, 0, 0, .87);">

			<div class="box-wrap">
				<div class="box-header">
					<b>${fundbean.f_dt}</b> <span class="box-fund-num"> 후원번호 <b>:${fundbean.f_idx}</b>
					</span>
				</div>
				<div class="box-container">
					<div style="float: left;">
						<img style="width: 300px; height: 300px;"
							src="${fundbean.projectbean.pj_img}">
					</div>
					<div style="float: left;">
						<div>후원 금액: ${fundbean.f_price}</div>
						<div>후원 프로젝트 제목: ${fundbean.projectbean.pj_title}</div>
						<div>선물 소개: ${fundbean.presentbean.p_explain }</div>
					</div>
				</div>

			</div>
		</a>




	</c:forEach>

</body>

</html>