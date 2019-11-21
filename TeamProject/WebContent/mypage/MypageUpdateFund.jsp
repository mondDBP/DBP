<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<jsp:useBean id="MypageDAO" class="DAO.MypageDAO" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜 계산을 위해 JSTL 태그 라이브러리 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<% 	request.setCharacterEncoding("UTF-8");
	//세션에 있는 로그인 정보 를 받아온다.
	String u_idx= (String)session.getAttribute("u_idx");
	String u_nm= (String)session.getAttribute("u_nm");
	

	//세션에 프로제그 idx 저장
	String f_pj_idx = request.getParameter("f_pj_idx");
	String f_idx = request.getParameter("f_idx");
	session.setAttribute("pj_idx", f_pj_idx);
	
	//updateFund 에 필요한 정보 뽑아오는 메소드
	ArrayList<FundBean> list = MypageDAO.getFunddetailBox(u_idx, f_pj_idx);
	ProjectBean MypageBean = MypageDAO.getProject(f_pj_idx);
	String pj_title = MypageBean.getPj_title();
	String pj_img = MypageBean.getPj_img();
	int obj_price = MypageBean.getObj_price();
	int pj_f_price = MypageBean.getPj_f_price();
	
	
	
	//jstl를 쓰기 위해 바인딩
	pageContext.setAttribute("obj_price", obj_price);
	pageContext.setAttribute("pj_f_price", pj_f_price);
	pageContext.setAttribute("Bean", MypageBean);
	
	
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>jQuery Style</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="MypageUpdateFund.js"></script>
<link rel="stylesheet" type="text/css" href="MypageUpdateFund.css">
<style>

</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>


    </script>
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

	
	<c:set var="list" value="<%=list%>" />

	<c:forEach var="fundbean" items="${list}">

		<c:set var="now" value="<%=new java.util.Date() %>" />

		<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
			integerOnly="true" var="nowdayfull" scope="request" />
			
		<fmt:formatDate value="${now}" var="nowdate" pattern="yyyy-MM-dd" />

		<fmt:parseDate var="deadline" value="${fundbean.f_deadline}"
			pattern="yyyy-MM-dd" />

		<fmt:parseNumber value="${deadline.time / (1000*60*60*24)}"
			integerOnly="true" var="deadlinefull" scope="request" />

<!--                    test -->

<div>연습: ${fundbean.presentbean.p_idx}</div>
<div>목표후원금액: <fmt:formatNumber value="${obj_price}" type="number"/> </div>
<div>f_pj_idx: <%=f_pj_idx %> </div>
<div>후원 금액: ${pj_f_price}</div>
<div>달성 퍼센트: ${pj_f_price/obj_price*100}% </div>
<c:set var="objper" value="${pj_f_price/obj_price*100}"/>
<c:set var="f_price" value="${fundbean.f_price}"/>

<!--                           -->


		<div class="fund-detail-header-wrap">
			<div class="fund-detail-header">
				<div class="fund-detail-header-content">
					<a class="back-icon" href="${contextPath}/Mypage/Mypage_fund.jsp"> <span>내 후원현황</span>
					</a> <label>${fundbean.f_dt}</label> <span>후원번호
						${fundbean.f_idx}</span>
						
			
						
				</div>
			</div>
		</div>
		<!--header 끝-->

		<!--프로젝트 back-->
		<div class="fund-detal-back"
			style="background-image:url(${Bean.pj_img});">
			<div class="fund-detal-project">
				<label class="fund-detail-state"> 펀딩 진행중 </label> <br>
				<br>
				<br> <a class="fund-detail-name">${Bean.pj_title}</a>
			</div>
			<div class="fund-detail-state2">
				<b> 모인금액: <span><fmt:formatNumber value="${Bean.pj_f_price}" type="number"/> </span> 원
				</b> <br> <b> 달성률 <span> <fmt:formatNumber value='${objper}' pattern="#.00"/></span> %
				</b> <br> <b> 남은시간 <span> ${deadlinefull-nowdayfull } </span> 일
				</b>

			</div>


		</div>
		<div class="fund-detail-box">
			<div class="fund-detail-box-in">
				<div class="fund-detail-box-content">
					<div class="fund-detail-box-content-in">
						<div style="width: 4.5rem;">
 						</div>
						<div class="fund-detail-info">
							<b> <fmt:formatNumber value="${f_price}" type="number"/>원 </b> 을 후원하였습니다.
							<div class="shipping-fee">배송비 포함</div>
							<div class="fund-present"> ${fundbean.presentbean.p_explain}</div>
							<br>
							<div class="fund-present-comedate"></div>
							<div class="fund-present-comedate">예상전달일은 ${fundbean.presentbean.due_dt} 입니다.</div>
						</div>
						<div  class="fund-detail-button">><a href="changeItem.jsp?p_idx=${fundbean.presentbean.p_idx}&pay_idx=${fundbean.paybean.pay_idx}&f_idx=<%=f_idx%>">후원사항 변경및 취소하기</a></div>
					</div>
				</div>
			</div>
		</div>
		<div class="fund-detail-box1">
			<div class="fund-detail-box-in">
				<div>후원현황</div>
				<div class="fund-detail-box-content">
					<div class="fund-detail-box-content-in">
						<div style="width: 4.5rem;">
							<img style="width: 40px; height: 40px;" src="images/rocket.png">
						</div>
						<div class="fund-detail-info2">
							<h4>펀딩 진행중</h4>
							<div class="fund-present-enddate">펀딩 마감일은 ${fundbean.f_deadline}입니다.</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="fund-detail-box1">
			<div class="fund-detail-box-in">
				<div>결재정보</div>
				<div class="fund-detail-box-content">
					<div class="fund-detail-box-content-in2">
						<label>결재수단</label> <b>카드</b>
						<p>사용하실 카드 또는 계좌는 지불정보 설정에서 변경할 수 있습니다. 예약하신 다른 후원이 있다면 모두 변경된
							지불 정보를 사용하게 됩니다.</p>
					</div>
				</div>
				<div class="fund-detail-box-content">
					<div class="fund-detail-box-content-in2">
						<label>결재금액</label> <b>${fundbean.paybean.pay_price}원</b>
					</div>
				</div>
				<div class="fund-detail-box-content">
					<div class="fund-detail-box-content-in2">
						<label>결재상태</label> <b>${fundbean.paybean.pay_dt}에 결재예정입니다.</b>
					</div>
				</div>
			</div>
		</div>





		<form name="" method="post">
			<div class="fund-detail-box1">
				<div class="fund-detail-box-in">
					<div>배송정보</div>
					<div class="fund-detail-box-content">
						<div class="fund-detail-box-content-in2">
							<label>받는분 이름</label> <b>${sessionScope.u_nm }</b>
							<div class="outbutton">수정하기</div>

						</div>
					</div>
					<div class="fund-detail-box-content-input" style="display: none">
						<div class="fund-detail-box-content-in2">
							<label>받는분 이름</label> <input value="">
							<div class="inbutton">저장하기</div>
						</div>
					</div>
					<div class="fund-detail-box-content">
						<div class="fund-detail-box-content-in2">
							<label>받는분 연락처</label> <b>${fundbean.delbean.d_ph}</b>
							<div class="outbutton">수정하기</div>
						</div>
					</div>
					<div class="fund-detail-box-content-input" style="display: none">
						<div class="fund-detail-box-content-in2">
							<label>받는분 연락처</label> <input value="">
							<div class="inbutton">저장하기</div>
						</div>
					</div>
					<div class="fund-detail-box-content" id="out-address-border">
						<div class="fund-detail-box-content-in2">
							<label>배송주소</label> <b>${fundbean.delbean.d_addr}${fundbean.delbean.d_detail_addr}</b>
							<div id="update-address">수정하기</div>
						</div>
					</div>
					<div class="fund-detail-box-content-input" id="in-address-border"
						style="display: none">
						<div class="fund-detail-box-content-in2">
							<label>배송주소</label> <input type="text" id="postcode"
								placeholder="우편번호"> <input type="button" id="PCButton"
								onclick="execDaumPostcode()" value="우편번호 찾기"><br> <input
								type="text" id="address" placeholder="주소"><br> <input
								type="text" id="detailAddress" placeholder="상세주소"> <input
								type="text" id="extraAddress" placeholder="참고항목">

							<div id="save-address">저장하기</div>
						</div>
					</div>

				</div>
			</div>
			
		</form>
	</c:forEach>

</body>

</html>