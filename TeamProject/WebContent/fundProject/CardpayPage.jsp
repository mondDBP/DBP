<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Bean.*" %>
<%@ page import="DAO.*" %>
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
	
	ProjectBean pjbean = ProjectDAO.getProject(pj_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pjbean.getPj_title() %></title>
<link rel="stylesheet" type="text/css" href="../css/CardpayPage.css">
</head>
<body>
   <div class="pledge-container">
        <div class="b-header">
            <div class="b-header-content">
                <div class="b-header-content-item">
                    <div class="b-header-headline"><%=pjbean.getPj_title() %></div>
                    <ul class="b-list-pledge-history">
                        <li class="b-list-item">
                            <span class="b-list-dot"></span>
                            <a class="b-list-link">선택한 선물</a>
                            <div><%=PresentBean.getMin_price() %>원 선물/<%= FundBean.getF_price() %>원 후원</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="b-section-content">
            <form>
                <div class="b-form-wrap">
                    <label class="b-form-label">카드번호</label>
                    <span class="b-form-help">법인공용카드는 불가능합니다</span>
                    <input class="b-form-input" autocomplete="off" type="tel" name="card_no">
                </div>
                <div class="b-form-wrap" style="border-top: 1px solid rgb(220, 220, 220);">
                    <label class="b-form-label">카드 유효기간</label>
                    <div class="b-form-input">
                        <div class="b-select-box">
                            <select name="month" class="b-select-box-select">
                                <option value="01">1월</option>
                                <option value="02">2월</option>
                                <option value="03">3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>

                        </div>
                        <div class="b-select-box">
                            <select name="year" class="b-select-box-select">
                                <option value="2019">2019년</option>
                                <option value="2020">2020년</option>
                                <option value="2021">2021년</option>
                                <option value="2022">2022년</option>
                                <option value="2023">2023년</option>
                                <option value="2024">2024년</option>
                                <option value="2025">2025년</option>
                                <option value="2026">2026년</option>
                                <option value="2027">2027년</option>
                                <option value="2028">2028년</option>
                                <option value="2029">2029년</option>
                                <option value="2030">2030년</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="b-form-wrap-flex" style="border-top: 1px solid rgb(220, 220, 220);">
                    <div class="b-form-input-flex">
                        <label class="b-form-label">카드비밀번호</label>
                        <span class="b-form-help">앞2자리만 입력해주세요</span>
                        <input class="b-form-input" autocomplete="off" type="tel" name="card_pwd">
                    </div>
                    <div class="b-form-input-flex">
                        <label class="b-form-label">소유주 생년월일</label>
                        <span class="b-form-help">6자리로 입력해주세요</span>
                        <input class="b-form-input" autocomplete="off" type="tel" placeholder="예) 880729" name="owner_birth">
                    </div>
                </div>
                <div class="b-form-wrap" style="border-top: 1px solid rgb(220, 220, 220);">
                    <label class="b-form-label">핸드폰 번호</label>
                    <input class="b-form-input" autocomplete="off" type="tel" placeholder="예) 010 5504 5331" name="owner_ph">
                </div>
                <div class="b-form-wrap" style="border-top: 1px solid rgb(220, 220, 220);">
                    <label class="b-form-label">결제사 정보제공 동의</label>
                    <input id='agree' type='checkbox' />
                    <label for='agree' style="margin:0;">
                        <span></span>
                       		 동의
                        <ins><i>동의</i></ins>
                    </label>
                </div>

                <div style="border-top: 1px solid rgb(220, 220, 220);">
	                <button class="loginButton" type="submit" formaction="ZipcodeInsertPage.jsp" style="margin:20px 0;height:45px;">
	                	다음
	                </button>
                </div>

            </form>


        </div>

    </div>
</body>
</html>