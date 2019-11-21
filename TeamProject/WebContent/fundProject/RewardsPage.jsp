<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Bean.*" %>
<%@ page import="dbConnection.*" %>

<jsp:useBean id="ProjectDAO" class="DAO.ProjectDAO"/>
<jsp:useBean id="ProjectBean" class="Bean.ProjectBean"/>
<jsp:useBean id="PresentBean" class="Bean.PresentBean"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String pj_idx = (String)session.getAttribute("pj_idx");
	String u_idx = (String)session.getAttribute("u_idx");
	
	ProjectBean pjbean = ProjectDAO.getProject(pj_idx);
	ArrayList<PresentBean> prlist = ProjectDAO.getPresentList(pj_idx);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pjbean.getPj_title() %></title>
<link rel="stylesheet" type="text/css" href="../css/RewardsPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

    <div class="pledge-container">
        <header class="b-header">
            
            <div class="b-header__content">
                
	            <h1 class="b-header__headline">
	                <span><%=pjbean.getPj_title() %></span>
	                <span class="for-screenreader">프로젝트 밀어주기</span>
	            </h1>
	            <!-- <ul class="b-list b-list_pledge-history"></ul> -->
                
             </div>
                <!-- <div class="b-filter b-filter_beta"></div> -->
        </header>
        <div class="b-section__aside b-form b-form_rewards">
            <h2 class="for-screenreader">단계별 후원자 특전</h2>
            <c:set var="list" value="<%=prlist %>"/>
			<c:forEach var ="Presentbean" items="${list}">
				<c:set var="amount" value="${Presentbean.limit_amount - Presentbean.supmem_cnt}"/>
				<c:choose>
					<c:when test="${amount eq 0}">
						<div class="i-panel">
			                <div class="b-panel b-panel_reward b-panel_reward_soldout">
			                	<div class="b-panel__head">
			                        <h3 class="b-panel__title">
			                            <span>${Presentbean.min_price}</span>
			                            <span>원 이상 밀어주시는 분께</span>
			                        
			                            <span class="for-screenreader">드리는 특전</span>
			                        </h3>
			                        <span class="b-panel__title">
			                            <input id="111220843" type="tel" name="pledge[money]" min=${Presentbean.min_price} max="10000000" value="48,000" class="b-form__input">
			                            <span>원</span>
			                            <a class="b-panel__next-button"></a>
			                            <span class="b-panel__subtitle">더 많이 입력하실 수 있습니다</span>
			                            
			                        </span>
			                    </div>
			                    <div class="b-panel__body">
			                        <span>${Presentbean.p_explain}</span>
			                        <ul>
			                        <!-- ItemBean 활용하기 -->
			                            <li>${Presentbean.p_nm }</li>
			                        </ul>
			                    </div>
			                    <div class="b-panel__footer">
			                        <span class="color-primary">${Presentbean.supmem_cnt}</span>
			                        <span>명이 선택하였습니다</span>
			                        <span>
			                            <span>/</span>
			                            <strong>${Presentbean.limit_amount - Presentbean.supmem_cnt}</strong>
			                            <span>개 남음</span>
			                        </span>
			                        <br>
			                        <span>예상 전달일: ${Presentbean.due_dt}</span>
			                    </div>
			                </div>
			            </div>
					</c:when>
					<c:otherwise>
								<div class="i-panel">
					                <input type="radio" name="pledge[reward_id]" id="${Presentbean.p_idx}" value="${Presentbean.p_idx}" class="hidden-selector">
					                <label for="${Presentbean.p_idx}" class="b-panel b-panel_reward">
					                    <div class="b-panel__head">
					                        <h3 class="b-panel__title">
					                            <span>${Presentbean.min_price}</span>
					                            <span>원 이상 밀어주시는 분께</span>
					                            <span class="for-screenreader">드리는 특전</span>
					                        </h3>
					                        <span class="b-panel__title">
					                        	<form action="RewardsProc.jsp">
						                            <input id="${Presentbean.p_idx}" type="tel" name="pledge_money" min=${Presentbean.min_price} max="10000000" value="${Presentbean.min_price}" class="b-form__input">
						                            <span>원</span>
						                            <input type="hidden" name="p_idx" value="${Presentbean.p_idx}"/>
						                            <input type='submit' class="b-panel__next-button" value="">
					                            </form>
					                            <span class="b-panel__subtitle">더 많이 입력하실 수 있습니다</span>
					                        </span>
					                    </div>
					                    <div class="b-panel__body">
					                        <span>${Presentbean.p_explain}</span>
					                        <ul>
					                        <!-- ItemBean 활용하기 -->
					                            <div>
					                                <li>
					                                    <span>13인치 노트북 파우치</span>
					                                    <span> (×</span>
					                                    <span>1</span>
					                                    <span>)</span>
					                                </li>
					                                <form class="b-form b-form_animate_enterance b-form_theme_modern">
					                                    <div class="b-form__row">
					                                        <div class="b-form__input">
					                                            <div></div>
					                                        </div>
					                                    </div>
					                                </form>
					                            </div>
					                            <div>
					                                <li>
					                                    <span>스티커팩</span>
					                                    <span> (×</span>
					                                    <span>1</span>
					                                    <span>)</span>
					                                </li>
					                                <form class="b-form b-form_animate_enterance b-form_theme_modern">
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
					                        <span class="color-primary">${Presentbean.supmem_cnt}</span>
					                        <span>명이 선택하였습니다</span>
					                        <span>
					                            <span>/</span>
					                            <strong>${Presentbean.limit_amount - Presentbean.supmem_cnt}</strong>
					                            <span>개 남음</span>
					                        </span>
					                        <br>
					                        <span>예상 전달일: ${Presentbean.due_dt}</span>
					                    </div>
					                </label>
					            </div>
					</c:otherwise>
				</c:choose>
            </c:forEach>
        </div>
    </div>
        </div>
        <div class="container">
            
        </div>
    </div>
</body>
</html>