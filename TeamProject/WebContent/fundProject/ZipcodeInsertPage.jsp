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
<jsp:useBean id="PayInfoBean" class="Bean.PayInfoBean"/>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");

	String pj_idx = (String)session.getAttribute("pj_idx"); //프로젝트 인덱스
	String u_idxx = (String)session.getAttribute("u_idx"); //회원 인덱스
	int u_idx = Integer.parseInt(u_idxx);
	
	ProjectBean pjbean = ProjectDAO.getProject(pj_idx);
	
	//PAY_INFO_TB insert
	String card_no = request.getParameter("card_no");
	String card_pwd = request.getParameter("card_pwd");
	String owner_birth = request.getParameter("owner_birth");
	String owner_ph = request.getParameter("owner_ph");
	String month = request.getParameter("month");
	String year = request.getParameter("year");
	String dash = "-";
	String card_valid = year + dash + month;
	
	PayInfoBean.setPay_u_idx(u_idx);
	PayInfoBean.setCard_no(card_no);
	PayInfoBean.setCard_valid(card_valid);
	PayInfoBean.setOwner_birth(owner_birth);
	PayInfoBean.setCard_pwd(card_pwd);
	PayInfoBean.setOwner_ph(owner_ph);
	
	ProjectDAO.insertPayInfo(PayInfoBean);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= pjbean.getPj_title() %></title>
	<link rel="stylesheet" type="text/css" href="../css/ZipcodeInsertPage.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
    </script>
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
                            <div><%=PresentBean.getMin_price() %>원 선물/ <%= FundBean.getF_price() %>원 후원</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="b-section-content">
            <form>
                <label class="b-form-label">배송주소</label>
                <span class="b-form-help">우편번호</span>
                <input class="zipcode" style="width:160px;height:40px;" type="button" id="PCButton" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                <input class="b-form-input" type="text" id="postcode" name="d_zipcode">
                        
                <span  class="b-form-help">우편번호</span>
                <input class="b-form-input" type="text" id="address" placeholder="주소" name="d_addr">
                <span  class="b-form-help">상세주소</span>        
                <input class="b-form-input" type="text" id="detailAddress" placeholder="상세주소" name="d_detail_addr">
                <span  class="b-form-help">참고항목</span>          
                <input class="b-form-input"type="text" id="extraAddress" placeholder="참고항목">
            	<div class="b-form-wrap">
                    <label class="b-form-label"> 휴대폰 번호 </label>
                    <span class="b-form-help">배송지 휴대폰 번호를 입력해 주세요</span>
                    <input class="b-form-input" autocomplete="off" type="tel" name="d_ph">
                </div>
                <div style="border-top: 1px solid rgb(220, 220, 220);">
	                <button class="loginButton" type="submit" formaction="SuccedFundProc.jsp"
	                        style="margin:20px 0;height:45px;">
	                        	다음
	                </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>