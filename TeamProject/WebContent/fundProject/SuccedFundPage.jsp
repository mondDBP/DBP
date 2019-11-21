<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Bean.*" %>
<%@ page import="dbConnection.*" %>

<jsp:useBean id="ProjectDAO" class="DAO.ProjectDAO"/>
<jsp:useBean id="ProjectBean" class="Bean.ProjectBean"/>
<jsp:useBean id="PresentBean" class="Bean.PresentBean" scope="session"/>
<jsp:useBean id="UserBean" class="Bean.UserBean"/>
<jsp:useBean id="FundBean" class="Bean.FundBean" scope="session"/>
<jsp:useBean id="PayInfoBean" class="Bean.PayInfoBean"/>
<jsp:useBean id="DelBean" class="Bean.DelBean"/>
<jsp:useBean id="PayBean" class="Bean.PayBean"/>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");

	String pj_idx = (String)session.getAttribute("pj_idx"); //프로젝트 인덱스
	String u_idxx = (String)session.getAttribute("u_idx"); //회원 인덱스
	int u_idx = Integer.parseInt(u_idxx);
	int pj_idxx = Integer.parseInt(pj_idx);
	
	ProjectBean pjbean = ProjectDAO.getProject(pj_idx);
	
	String d_idxx = request.getParameter("d_idx");
	int d_idx = Integer.parseInt(d_idxx);
	
	//Fund_tb insert
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
	String deadline = pjbean.getPj_end_dt();
	
	FundBean.setF_dt(today);
	FundBean.setF_deadline(deadline);
	FundBean.setSupmem_idx(u_idx);
	FundBean.setF_pj_idx(pj_idxx);
	FundBean.setF_d_idx(d_idx);
	
	Boolean fundflag = ProjectDAO.insertFund(FundBean);
	int f_idx = ProjectDAO.setFundidx(FundBean); // FUND_TB에 insert된 레코드 f_idx
	
	//PAY_TB insert
	PayBean.setPay_price(FundBean.getF_price());
	PayBean.setPay_f_idx(f_idx);
	PayBean.setPay_dt(pjbean.getPj_end_dt());
	
	Boolean payflag = ProjectDAO.insertPay(PayBean);

	// PJ_TB, PRESENT_TB Update
	Boolean updatePjflag = ProjectDAO.updateProject(pjbean, u_idx); // PJ_TB Update
	Boolean updatePrflg = ProjectDAO.updatePresent(PresentBean); // PRESENT_TB Update
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pjbean.getPj_title() %></title>
<link rel="stylesheet" type="text/css" href="../css/SuccedFundPage.css">
</head>
<body>
	<div class="pledge-container">
        <div class="b-header">
            <div class="b-header-content">
                <div class="b-header-content-item">
                    <div class="b-header-headline"><%=pjbean.getPj_title() %></div>
                    <ul class="b-list-pledge-history">
                        <li class="b-list-info">
                            <span class="b-list-dot"></span>
                            <a class="b-list-link">선택한 선물</a>
                            <div> <%=PresentBean.getMin_price() %>원 선물/<%= FundBean.getF_price() %>원 후원</div>
                        </li>
                        <li class="b-list-info">
                            <span class="b-list-dot"></span>
                            <a class="b-list-link">주소</a>
                            <div><%=DelBean.getD_zipcode() %></div>
                        </li>
                    </ul>

                </div>

            </div>

        </div>
        <div class="b-section-content">
            <div class="b-panel-head">
               	 축하합니다.
            </div>
            <div style="text-align: center;margin: 10px;"><%=pjbean.getPj_sup_num() %>번째 공식 후원자가 되셨습니다</div>
            <div style="margin: 25px;"><small>프로젝트가 목표금액을 모두 달성할 경우에만 <%=pjbean.getPj_end_dt() %>에 자동 결제됩니다. 목표액에 미달할 경우 예정된 모든 결제는 자동으로 취소됩니다.
                </small></div>
            
            <div class="b-panel-body">
                
                <a class="b-menu-item" href="../main.jsp">
                        <img src="images/home.png" style="width: 13px; height:13px;">
                    	메인으로 가기
                </a>
                <a class="b-menu-item" href="">
                        <img src="images/text.png" style="width: 13px; height:13px;">
                    	내 후원현황보기
                </a>
                <span class="b-menu-share">
                    <a href="#"><img src="images/facebook.png" style="width: 50px; height:50px;"></a>
                    <a href="#"><img src="images/twitter.png"style="width: 50x; height:50px;"></a>
                    <a href="#"><img src="images/kakaotalk.png"style="width: 50px; height:50px;"></a>
                </span>
            </div>
            <div style="width: 100%; height:300px; border:2px solid black;display: flex;flex-wrap: wrap; ">
	            <div style="flex:20%; border:2px solid blue;margin:20px;"></div>
	            <div style="flex:20%; border:2px solid blue;"></div>
	            <div style="flex:20%; border:2px solid blue;"></div>
	            <div style="flex:20%; border:2px solid blue;"></div>
	            <div style="flex:20%; border:2px solid blue;"></div>
	            <div style="flex:20%; border:2px solid blue;"></div>
            
            </div>
        </div>
    </div>
</body>
</html>