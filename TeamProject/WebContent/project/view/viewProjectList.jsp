<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String curUserId = (String)request.getAttribute("curUserId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatiblee" content="IE=edge,chrome=1" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="<c:url value='/main/jquery-1.8.0.min.js' />"></script>
<script src="<c:url value='/main/main.js' />"></script>
<script>
	// 컨트롤러에서 데이터 받기
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for (var i = 0; i < jsonData.length; i++) {

		if (jsonData[i].level == "1") {
			cate1Obj = new Object(); //초기화
			cate1Obj.cateCode = jsonData[i].cateCode;
			cate1Obj.cateName = jsonData[i].cateName;
			cate1Arr.push(cate1Obj);
		}
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1")

	for (var i = 0; i < cate1Arr.length; i++) {
		cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
				+ cate1Arr[i].cateName + "</option>");
	}

	$(document)
			.on(
					"change",
					"select.category1",
					function() {

						var cate2Arr = new Array();
						var cate2Obj = new Object();

						// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
						for (var i = 0; i < jsonData.length; i++) {

							if (jsonData[i].level == "2") {
								cate2Obj = new Object(); //초기화
								cate2Obj.cateCode = jsonData[i].cateCode;
								cate2Obj.cateName = jsonData[i].cateName;
								cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

								cate2Arr.push(cate2Obj);
							}
						}

						var cate2Select = $("select.category2");

						/*
						for(var i = 0; i < cate2Arr.length; i++) {
								cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
													+ cate2Arr[i].cateName + "</option>");
						}
						 */

						cate2Select.children().remove();

						$("option:selected", this)
								.each(
										function() {

											var selectVal = $(this).val();

											cate2Select
													.append("<option value='" + selectVal + "'>전체</option>");

											for (var i = 0; i < cate2Arr.length; i++) {
												if (selectVal == cate2Arr[i].cateCodeRef) {
													cate2Select
															.append("<option value='" + cate2Arr[i].cateCode + "'>"
																	+ cate2Arr[i].cateName
																	+ "</option>");
												}
											}
										});

					});
</script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/viewProject.css' />" media="all" />
</head>
<body>
	<div
		style="text-align: right; width: auto; margin: auto; padding: 50px;">
		<select name="sortProject">
			<option value="fund_rate">모금률순</option>
			<option value="latest">최신순</option>
			<option value="likes">좋아요순</option>
		</select>
	</div>
	<div style="text-align: center; width: auto; margin: auto;">개의
		프로젝트가 있습니다.</div>
	<div class="kind_1_project">
		<div class="kind_1_card_section">

			<div class="project_card_1" onclick="" style="float: right;">
				<div class="card_1_content">
					<div class="imgbox">
						<img src="" style="width: 200px; height: 150px;" alt="">
					</div>
					<div class="textbox">
						<h2>제목</h2>
						<h4>게시자</h4>
					</div>
					<progress value="50" max="100">
						<a href="#"></a>
					</progress>
					<div class="nowbox">
						<span>남은기한</span> <span style="float: right;">퍼센트</span>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
