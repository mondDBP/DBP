<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Bean.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:useBean id="UserDAO" class="DAO.MypageDAO" />

<%
	request.setCharacterEncoding("UTF-8");
	String u_idx = (String) session.getAttribute("u_idx");
	out.println(u_idx);
	PayInfoBean payinfobean = UserDAO.getPayInfo(u_idx);
	pageContext.setAttribute("bean", payinfobean);
%>



<!DOCTYPE html>
<html>

<head>

<meta charset='utf-8'>
<title>Page Title</title>


<link rel='stylesheet' type='text/css' media='screen'
	href='../css/Mypage.css'>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<script>
	// 자주묻는질문_각 질문별 답변_(펼치기/접기)기능추가
	$(document).ready(function() {
		$('.more').click(function() {
			if ($('.more').hasClass('more')) {
				$('.more').addClass('close').removeClass('more');
				$('.board').css('visibility', 'visible');
			} else if ($('.close').hasClass('close')) {
				$('.close').addClass('more').removeClass('close');
				$('.board').css('visibility', 'hidden');
			}
		});
	});
</script>

</head>

<body>
	<div>pay_info_idx: ${bean.pay_info_idx}</div>
	<div>pay_u_idx: ${bean.pay_u_idx}</div>
	<div>pay_info_means: ${bean.pay_info_means}</div>
	<div>card_no:${bean.card_no}</div>
	<div>card_valid:${bean.card_valid}</div>
	<div>owner_birth:${bean.owner_birth}</div>
	<div>card_pwd:${bean.card_pwd}</div>
	<div>owner_ph:${bean.owner_ph}</div>
	<c:set var="phonefull" value="${bean.owner_ph}" />
	<br> ${fn:substring(phonefull,0,3)}
	<br> ${fn:substring(phonefull,3,7)}
	<br> ${fn:substring(phonefull,7,11)}

	<div class="header" style="border-bottom: 1px solid #eee;">
		<div class="container">
			<div style="padding: 10px 0; text-align: center;">
				<a href="#" class="logo">bumblbug</a>
			</div>
		</div>
	</div>

	<section style="background-color: #ebeae5">
		<div class="container">
			<div class="row" style="justify-content: space-between;">
				<div>
					<h2>지불정보 설정</h2>
				</div>
				<div>
					<ul class="profile_ul">
						<li><a href="Mypage_profile.jsp">프로필 설정</a></li>
						<li><a href="Mypage_account.jsp">계정 설정</a></li>
						<li><a href="#">지불정보 설정</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<form name="paymentForm" method="post" action="Mypage_paymentproc.jsp">
		<section class="profile">
			<div class="container">
				<div class="row" style="margin-top: 20px;">
					<div class=" " style="flex-basis: 70%; font-size: 14px">

						<div class="row">
							<div class="col-m12">등록 또는 수정하실 결제 수단을 선택해 주세요.</div>
							<div class="col-m12">
								<span>체크/신용카드</span>
							</div>
						</div>

						<div class="panel_box border_top_red"
							style="width: 430px; background: #ebeae5">
							<div class="row">
				<!---------------------------------카드번호 -------------------------------- -->
								<div class="col-m12" style="padding: 12px 12px 0px;">
									<span>카드 번호</span>
								</div>
								<div class="col-m12">
									<input class="input_radious2" style="width: 208px;"maxlength="12"
										value="${bean.card_no}" name="card_no"><br> <span
										style="font-size: 10px">공백이나 하이픈(-) 없이 숫자만 입력해주세요</span>
								</div>
				<!---------------------------------유효기간 -------------------------------- -->
								<div class="col-m12" style="padding: 0px 12px 0px;">
									<span>유효기간</span>
								</div>
								<div class="col-m12 row no-p">
									<div class="col-m03">
										<!--1~12-->
										<select class="expiry" name="card_valid1">
											<option value="--">---</option>
											<option value="1">01</option>
											<option value="2">02</option>
											<option value="3">03</option>
											<option value="4">04</option>
											<option value="5">05</option>
											<option value="6">06</option>
											<option value="7">07</option>
											<option value="8">08</option>
											<option value="9">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
									</div>
									<div class="col-m03">
										<!--2019~2029-->
										<select class="expiry" name="card_valid2">
											<option value="--">---</option>
											<option value="2019">2019</option>
											<option value="2019">2020</option>
											<option value="2019">2021</option>
											<option value="2019">2022</option>
											<option value="2019">2023</option>
											<option value="2019">2024</option>
											<option value="2019">2025</option>
											<option value="2019">2026</option>
											<option value="2019">2027</option>
											<option value="2019">2028</option>
											<option value="2019">2029</option>
										</select>
									</div>
								</div>
				<!---------------------------------생년월일 -------------------------------- -->
								<div class="col-m12" style="padding: 0px 12px 0px;"
									style="width:200px;">
									<span>생년월일6자리</span>
								</div>
								<div class="col-m12">
									<input type="text" class="input_radious2"maxlength="6"
										value="${bean.owner_birth}" name="owner_birth">
								</div>
				<!---------------------------------카드비번 앞 2자리 -------------------------------- -->
								<div class="col-m12" style="padding: 0px 12px 0px;"
									style="width:200px;">
									<span>카드 비밀번호 앞 2자리</span>
								</div>

								<div class="col-m12">
									<input type="password" class="input_radious2"maxlength="2"
										style="width: 40px;" name="card_pwd">**
								</div>

								<div style="min-height: 100%;"></div>
							</div>
						</div>

						<!----------------------------------------------------------->
						<div class="row">
							<div class="col-m02 align-right" style="padding-bottom: 0px">
								휴대폰 번호</div>
							<div class="col-m10" style="padding-top: 6.5px">
								<div class="row">
									<div class="col-m12 no-p">
										<input class="input_radious" style="width: 80px"maxlength="3"
											value="${fn:substring(phonefull,0,3)}" name="owner_ph1">
										<input class="input_radious" style="width: 80px"maxlength="4"
											value="${fn:substring(phonefull,3,7)}" name="owner_ph2">
										<input class="input_radious" style="width: 80px"maxlength="4"
											value="${fn:substring(phonefull,7,11)}" name="owner_ph3">
									</div>
									<div class="col-m12" style="font-size: 10px; padding: 4px 0px">
										오직 출금알림과 후원 선물 배송을 위해서만 사용됩니다.</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-m02" style="padding-bottom: 0px"></div>
							<div class="col-m10" style="padding-top: 6.5px">
								<button type="submit" class="btn"
									style="line-height: 24px; padding: 10px 42px">수정하기</button>
							</div>
						</div>
					</div>

				</div>
				<!------------------------------------------------------------------------------------------>
				<div class="" style="flex-basis: 30%">
					<div class="row">

						<div class="col-m12" style="padding: 0px">
							<!--override padding-->
							<p class="query_title">자주 묻는 질문</p>
						</div>

						<div class="col-m12 border_top" style="padding: 0px">
							<p class="query_title">결제를 기다리고 있는 경우</p>
						</div>

						<div class="col-m12">
							<div id="more_btn1" class="blind query_list">카드를 등록하니 처음
								화면으로 돌아갑니다. 저장이 된 건가요?</div>
							<div id="more_view1" class="more_view query_answer">카드번호에
								“-” 또는 띄어쓰기를 입력하지 않았는지 확인해 주세요. 제대로 입력하셨는데도 등록에 실패하셨다면, 비밀번호
								오류/오류 횟수 초과로 인해 이용이 불가한 상태일 수 있습니다. 이 경우 카드사 콜센터로 연락해 비밀번호 오류
								횟수를 초기화한 후에 다시 시도해주세요.</div>
						</div>

						<div class="col-m12">
							<div id="more_btn2" class="blind query_list">카드와 계좌 중 어떤
								것으로 결제되나요?</div>
							<div id="more_view2" class="more_view query_answer">밀어주기
								시점을 기준으로, 텀블벅에 가장 최근에 등록된 결제수단(카드 또는 계좌)으로 결제되도록 자동 선택됩니다.
								프로젝트별로 예약된 결제수단은 내 후원 현황에서 확인하실 수 있습니다.</div>
						</div>

						<div class="col-m12">
							<div id="more_btn3" class="blind query_list">밀어주기 후 결제수단은
								어떻게 바뀌나요?</div>
							<div id="more_view3" class="more_view query_answer">카드에서
								계좌로 혹은 계좌에서 카드로 결제 수단을 변경하고 싶다면 먼저 지불정보 수정 메뉴에서 결제수단을 등록해주세요. 그
								다음 텀블벅 문의하기에서 후원번호와 함께 사용하시고 싶은 결제수단을 알려주세요.</div>
						</div>

						<div class="col-m12" style="padding: 0px">
							<p class="query_title">결제 실패 시</p>
						</div>

						<div class="col-m12">
							<div id="more_btn4" class="blind query_list">결제에 실패해서 지불정보를
								수정했는데 또 실패했습니다.</div>
							<div id="more_view4" class="more_view query_answer">텀블벅
								문의하기로 최근에 등록해주신 결제수단과 재결제 중인 후원번호를 알려주시면 안내를 도와드리겠습니다.</div>
						</div>

						<div class="col-m12" style="padding: 0px">
							<!--override padding-->
							<p class="query_title">그 밖에</p>
						</div>

						<div class="col-m12">
							<div id="more_btn5" class="blind query_list">공인인증서나 액티브X
								없이도 안전한가요?</div>
							<div id="more_view5" class="more_view query_answer">물론입니다.
								텀블벅은 업계 표준인 SSL 보안을 사용합니다. 웹 브라우저 주소창에 https://나 자물쇠 모양의 아이콘이 뜨는
								것을 확인하실 수 있는데요. 이는 IT님의 정보가 텀블벅 서버로 전송되는 데 있어 철저하게 암호화되고 있음을
								뜻합니다. SSL 보안은 공인인증서를 대체할 수 있는 기술로, 아마존, 구글, 애플, 페이팔 등의 국제적인
								서비스들이 고객과 웹서버 간 보안에 있어 표준으로 사용하는 프로토콜입니다..</div>
						</div>

						<div class="col-m12">
							<div id="more_btn6" class="blind query_list">등록된 결제 수단을
								삭제하고 싶습니다.</div>
							<div id="more_view6" class="more_view query_answer">
								텀블벅 문의하기로 삭제를 원하시는 <br> 지불정보를 알려주시면 삭제를 <br> 도와드리겠습니다.
							</div>
						</div>

					</div>
				</div>
			</div>
			</div>
		</section>
	</form>

	<script>
		// Q&A 메뉴 _ 펼치기/접기 기능 추가
		$(document).ready(function() {

			$('#more_btn1').click(function() {
				if ($('#more_btn1').hasClass('blind')) {
					$('#more_btn1').addClass('close').removeClass('blind');
					$('#more_view1').css('display', 'block');
				} else if ($('#more_btn1').hasClass('close')) {
					$('#more_btn1').addClass('blind').removeClass('close');
					$('#more_view1').css('display', 'none');
				}
			});

			$('#more_btn2').click(function() {
				if ($('#more_btn2').hasClass('blind')) {
					$('#more_btn2').addClass('close').removeClass('blind');
					$('#more_view2').css('display', 'block');
				} else if ($('#more_btn2').hasClass('close')) {
					$('#more_btn2').addClass('blind').removeClass('close');
					$('#more_view2').css('display', 'none');
				}
			});

			$('#more_btn3').click(function() {
				if ($('#more_btn3').hasClass('blind')) {
					$('#more_btn3').addClass('close').removeClass('blind');
					$('#more_view3').css('display', 'block');
				} else if ($('#more_btn3').hasClass('close')) {
					$('#more_btn3').addClass('blind').removeClass('close');
					$('#more_view3').css('display', 'none');
				}
			});

			$('#more_btn4').click(function() {
				if ($('#more_btn4').hasClass('blind')) {
					$('#more_btn4').addClass('close').removeClass('blind');
					$('#more_view4').css('display', 'block');
				} else if ($('#more_btn4').hasClass('close')) {
					$('#more_btn4').addClass('blind').removeClass('close');
					$('#more_view4').css('display', 'none');
				}
			});

			$('#more_btn5').click(function() {
				if ($('#more_btn5').hasClass('blind')) {
					$('#more_btn5').addClass('close').removeClass('blind');
					$('#more_view5').css('display', 'block');
				} else if ($('#more_btn5').hasClass('close')) {
					$('#more_btn5').addClass('blind').removeClass('close');
					$('#more_view5').css('display', 'none');
				}
			});

			$('#more_btn6').click(function() {
				if ($('#more_btn6').hasClass('blind')) {
					$('#more_btn6').addClass('close').removeClass('blind');
					$('#more_view6').css('display', 'block');
				} else if ($('#more_btn6').hasClass('close')) {
					$('#more_btn6').addClass('blind').removeClass('close');
					$('#more_view6').css('display', 'none');
				}
			});

		});
	</script>
</body>

</html>