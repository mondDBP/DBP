<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*,dbConnection.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- Context 이름 설정 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- bean 사용 setting -->
<jsp:useBean id="PayInfoBean" class="Bean.PayInfoBean" />
<jsp:useBean id="Mgr" class="DAO.MypageDAO" />

<%
	String pay_u_idx = (String)session.getAttribute("u_idx");
	String pay_info_means = request.getParameter("pay_info_means");
	String card_no = request.getParameter("card_no");
	String card_valid1 = request.getParameter("card_valid1");
	String card_valid2 = request.getParameter("card_valid2");
	String owner_birth = request.getParameter("owner_birth");
	String card_pwd = request.getParameter("card_pwd");
	String owner_ph1 =request.getParameter("owner_ph1");
	String owner_ph2 =request.getParameter("owner_ph2");
	String owner_ph3 =request.getParameter("owner_ph3");
	
	String card_valid = card_valid1+ card_valid2;
	String owner_ph = owner_ph1+owner_ph2+owner_ph3;
	
	PayInfoBean.setPay_u_idx(Integer.parseInt(pay_u_idx));
	PayInfoBean.setPay_info_means(pay_info_means);
	PayInfoBean.setCard_no(card_no);
	PayInfoBean.setCard_valid(card_valid);
	PayInfoBean.setOwner_birth(owner_birth);
	PayInfoBean.setCard_pwd(card_pwd);
	PayInfoBean.setOwner_ph(owner_ph);



%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	boolean a = Mgr.checkPayment(pay_u_idx);
	if(a == true){
		
		boolean b = Mgr.updatePayment(PayInfoBean);
		
		if(b == true){
			%>
	<script>
			alert("카드정보가 수정되었습니다.");
			location.href = "${contextPath}/Mypage/Mypage_payment.jsp";
			</script>


	<%
		}else{
			%>
	<script>
				alert("카드정보수정오류.");
			</script>
	<%
				};
	}else{
		boolean c = Mgr.insertPayment(PayInfoBean);
		
		if(c == true){
			%>
	<script>
			alert("카드정보가등록되었습니다.");
			location.href = "${contextPath}/Mypage/Mypage_payment.jsp";
			</script>

	<% 
		}else{
			%>
	<script>
				alert("카드정보등록오류.");
			</script>
	<%
		}
	}

%>




</body>
</html>