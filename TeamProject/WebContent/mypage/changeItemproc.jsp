<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Context 이름 설정 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
   request.setCharacterEncoding("UTF-8");

	String u_idx = (String) session.getAttribute("u_idx");
	String pj_idx = (String)session.getAttribute("pj_idx");
	String p_idx = request.getParameter("p_idx");
	String pre_p_idx = request.getParameter("pre_p_idx");
	String f_price = request.getParameter("pledge_money");
	String f_idx = request.getParameter("f_idx");
	
	out.println("u_idx= "+u_idx);
	out.println("p_idx= "+p_idx);
	out.println("pj_idx= "+pj_idx);
	out.println("pre_p_idx= "+pre_p_idx);
	out.println("f_price= "+f_price);
	out.println("f_idx= "+f_idx);
	
	//이전 선물과 지금 선물이 같은 경우(후원금만 달라지는 경우)
	if(p_idx.equals(pre_p_idx)){
		//개인 후원금액 변경(금액, 선물idx값)
		MypageDAO.changePresent(u_idx, pj_idx, f_price, p_idx);
		
		//올려야 하는 값. 총 후원금액 변경
		String prePrice = MypageDAO.getFundprice(u_idx, pj_idx);
		int changeprice= Integer.parseInt(f_price)-Integer.parseInt(prePrice);
		MypageDAO.updatepjPrice(changeprice+"", pj_idx);
		MypageDAO.changePricePaytb(f_idx, f_price+"");
	//이전 선물과 지금 선물이 다른경우	
	}else{
		//선택 선물 카운트값 올림
		MypageDAO.countupPresent(p_idx);
		//이전 선물 카운트값 내림
		MypageDAO.countdownPresent(pre_p_idx);
		//변경전 개인 후원금액
		String prePrice = MypageDAO.getFundprice(u_idx, pj_idx);
		//개인 후원금액 변경(금액, 선물idx값)
		MypageDAO.changePresent(u_idx, pj_idx, f_price, p_idx);
		out.println("f_price= "+f_price);
		out.println("prePrice= "+prePrice);
		int changeprice= (Integer.parseInt(f_price))-(Integer.parseInt(prePrice));
		out.println("changeprice= "+changeprice);
		MypageDAO.updatepjPrice(changeprice+"", pj_idx);
		MypageDAO.changePricePaytb(f_idx, f_price+"");
	}
	

	
   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>alert("변경되었습니다.") 
	
	location.href = "${contextPath}/Mypage/Mypage_fund.jsp"
	
	</script>
	

</body>
</html>