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
<jsp:useBean id="DelBean" class="Bean.DelBean"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");

	String pj_idx = (String)session.getAttribute("pj_idx"); //프로젝트 인덱스
	String u_idx = (String)session.getAttribute("u_idx"); //회원 인덱스

	ProjectBean pjbean = ProjectDAO.getProject(pj_idx);
	
	ArrayList<DelBean> dlist = ProjectDAO.getDelList(u_idx);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pjbean.getPj_title() %></title>
<link rel="stylesheet" type="text/css" href="../css/SelecAddrPage.css">
</head>
<body>
    <div class="pledge-container">
        <div class="b-header">
            <div class="b-header-content">
                <div class="b-header-content-item">
                    <div class="b-header-headline"><%= pjbean.getPj_title() %></div>
                    <ul class="b-list-pledge-history">
                        <li class="b-list-info">
                            <span class="b-list-dot"></span>
                            <a class="b-list-link">선택한 선물</a>
                            <div>1000원 선물/ <%= FundBean.getF_price() %>원 후원</div>
                        </li>
                        <li class="b-list-info">
                            <span class="b-list-dot"></span>
                            <a class="b-list-link">주소</a>
                            <div><%=DelBean.getD_addr() %> <%=DelBean.getD_detail_addr() %></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="b-section-content">
        	<c:set var="list" value="<%=dlist %>"/>
			<c:forEach var ="DelBean" items="${list}">
	            <div class="b-menu-item">
	            	<input type="radio" name="del" id="${DelBean.d_idx}" value="${DelBean.d_idx}" class="hidden-selector">
	            	<label for="${DelBean.d_idx}" class="b-panel b-panel_reward">
		            	<a href="SuccedFundProc.jsp?d_idx=${DelBean.d_idx}">
			                <h3 class="b-menu-title">배송받을 주소를 선택해주세요</h3>
			                <li class="b-menu-item-seleced">
			                    <span class="b-menu-item-header">
			                        ${DelBean.d_zipcode}
			                    </span>
			                    <!--<span style="color: rgb(150, 150, 150);    font-weight: 600;">
			                        (431-815)
			                    </span>
			                      -->
			                    <div class="b-menu-item-body">
			                        ${DelBean.d_addr} ${DelBean.d_detail_addr}
			                    </div>
			                </li>
						</a>
	                </label>
	            </div>
            </c:forEach>
            <ul class="b-menu-item">
                <a href="ZipcodeInsertPage.jsp">
                    	다른주소 입력하기
                </a>
            </ul>
            <ul class="b-form-term">
                    배송정보 제 3자(프로젝트 진행자) 제공 동의
                    회원의 개인정보는 당사의 개인정보 취급방침에 따라 안전하게 보호됩니다. '회사'는 이용자들의 개인정보를 개인정보 취급방침의 '제 2조 수집하는 개인정보의 항목, 수집방법 및 이용목적'에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.

                    제공받는자: 도서출판 초여명
                    제공목적: 선물 전달/배송과 관련된 상담 및 민원처리
                    제공정보: 수취인 성명, 휴대전화번호, 배송 주소 (구매자와 수취인이 다를 경우에는 수취인의 정보가 제공될 수 있습니다)
                    보유 및 이용기간: 재화 또는 서비스의 제공이 완료된 즉시 파기 (단, 관계법령에 정해진 규정에 따라 법정기간 동안 보관)
                    ※ 동의 거부권 등에 대한 고지
                    개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 서비스 이용이 제한될 수 있습니다.
            </ul>
            <input id='agree' type='checkbox' />
            <label for='agree' style="margin:0;">
                    <span></span>
                    	본인은 위의 내용을 모두 이해하였으며 동의합니다.
                    <ins><i>본인은 위의 내용을 모두 이해하였으며 동의합니다.</i></ins>
            </label>
            <div style="border-top: 1px solid rgb(220, 220, 220);"><button class="b-Button" type="submit" label="밀어주기" style="margin:20px 0;height:45px;
                ">밀어주기</button>
            </div>
        </div>
    </div>
</body>
</html>