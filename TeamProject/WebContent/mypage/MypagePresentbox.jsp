<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String u_idx = (String) session.getAttribute("u_idx");
	String pj_idx = (String)session.getAttribute("pj_idx");
	String pre_p_idx = request.getParameter("p_idx");
	String f_idx = request.getParameter("f_idx");
	
	
	
	out.println("u_idx= "+u_idx);
	out.println("pre_p_idx= "+pre_p_idx);
	out.println("pj_idx= "+pj_idx);
	out.println("f_idx= "+f_idx);


	ArrayList<PresentBean> list = MypageDAO.getPresentList(pj_idx);
%>

<c:set var="list" value="<%=list %>" />



<html>
<head>
<meta charset="UTF-8">
<title>선물 변경 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/MypagePresentbox.css">



</head>
<body>

	<c:forEach var="Presentbean" items="${list}">
		<div>선물idx: ${Presentbean.p_idx}</div>
		<div>선물최소금액idx: ${Presentbean.min_price}</div>
		<div>선물이름: ${Presentbean.p_nm}</div>
		<div>예정날짜: ${Presentbean.due_dt}</div>
		<div>후원자수: ${Presentbean.supmem_cnt}</div>
		<div>제한 수량: ${Presentbean.limit_amount}</div>
		<div>프로젝트선물idx: ${Presentbean.pj_p_idx}</div>
		<div>선물설명: ${Presentbean.p_explain}</div>
		<div>f_idx : <%=f_idx %></div>


		<c:set var="amount"
			value="${Presentbean.limit_amount - Presentbean.supmem_cnt}" />
		<c:choose>
			<c:when test="${amount eq 0}">
				<div class="i-panel">
					<div class="b-panel b-panel_reward b-panel_reward_soldout">
						<div class="b-panel__head">
							<h3 class="b-panel__title">
								<span>${Presentbean.min_price}</span> <span>원 이상 밀어주시는 분께</span>

								<span class="for-screenreader">드리는 특전</span>
							</h3>
							<span class="b-panel__title"> <input id="111220843"
								type="tel" name="pledge[money]" min=${Presentbean.min_price
								} max="10000000" value="48,000" class="b-form__input"> <span>원</span>
								<a class="b-panel__next-button"></a> <span
								class="b-panel__subtitle">더 많이 입력하실 수 있습니다</span>

							</span>
						</div>
						<div class="b-panel__body">
							<b>${Presentbean.p_explain}</b>
							<ul>
								<!-- ItemBean 활용하기 -->
								<div>
									<li><span>선물이름: ${Presentbean.p_nm}</span>
										<span>)</span></li>
									<form
										class="b-form b-form_animate_enterance b-form_theme_modern">
										<div class="b-form__row">
											<div class="b-form__input">
												<div></div>
											</div>
										</div>
									</form>
								</div>
								<div>
									
									</li>
									<form
										class="b-form b-form_animate_enterance b-form_theme_modern">
										<div class="b-form__row">
											<div class="b-form__input">
												<div></div>
											</div>
										</div>
									</form>
								</div>
							</ul>
						</div>
						<div class="b-panel__footer">
							<span class="color-primary">${Presentbean.supmem_cnt}</span> <span>명이
								선택하였습니다</span> <span> <span>/</span> <strong>${Presentbean.limit_amount - Presentbean.supmem_cnt}</strong>
								<span>개 남음</span>
							</span> <br> <span>예상 전달일: ${Presentbean.due_dt}</span>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="i-panel">
					<input type="radio" name="pledge[reward_id]"
						id="${Presentbean.p_idx}" value="${Presentbean.p_idx}"
						class="hidden-selector"> <label for="${Presentbean.p_idx}"
						class="b-panel b-panel_reward">
						<div class="b-panel__head">
							<h3 class="b-panel__title">
								<span>${Presentbean.min_price}</span> <span>원 이상 밀어주시는 분께</span>
								<span class="for-screenreader">드리는 특전</span>
							</h3>
							<span class="b-panel__title">
							
							<!-- 폼으로 넘기는 부분!!!!!!!!!!! -->
								<form  name="changePresent"  method="post" action="changeItemproc.jsp">
									<input id="${Presentbean.p_idx}" type="tel" name="pledge_money"
										min=${Presentbean.min_price } max="10000000"
										value="${Presentbean.min_price}" class="b-form__input">
									<span>원</span> 
							<!-- 선물 idx 넘겨준다. -->		
									<input type="hidden" name="p_idx" value="${Presentbean.p_idx}" /> 
									<input type="hidden" name="pre_p_idx" value="<%=pre_p_idx %>" />
									<input type="hidden" name="f_idx" value="<%=f_idx %>" /> 
									
							<!-- submit -->
									<input type='submit' class="b-panel__next-button" value="변경하기" >
								</form> 
								
								<span class="b-panel__subtitle">더 많이 입력하실 수 있습니다</span>
							</span>
						</div>
						<div class="b-panel__body">
							<b>${Presentbean.p_explain}</b>
							<ul>
								<!-- ItemBean 활용하기 -->
								<div>
									<li><span>선물이름: ${Presentbean.p_nm}</span></li>
									<form
										class="b-form b-form_animate_enterance b-form_theme_modern">
										<div class="b-form__row">
											<div class="b-form__input">
												<div></div>
											</div>
										</div>
									</form>
								</div>
								<div>
					
									</li>
									<form
										class="b-form b-form_animate_enterance b-form_theme_modern">
										<div class="b-form__row">
											<div class="b-form__input">
												<div></div>
											</div>
										</div>
									</form>
								</div>
							</ul>
						</div>
						<div class="b-panel__footer">
							<span class="color-primary">${Presentbean.supmem_cnt}</span> <span>명이
								선택하였습니다</span> <span> <span>/</span> <strong>${Presentbean.limit_amount - Presentbean.supmem_cnt}</strong>
								<span>개 남음</span>
							</span> <br> <span>예상 전달일: ${Presentbean.due_dt}</span>
						</div>
					</label>
				</div>
			</c:otherwise>
		</c:choose>







	</c:forEach>

</body>
</html>