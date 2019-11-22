//프로젝트 찾기위한 AJAX 구현 메소드
function searchProject() {
	var input = document.getElementById("typing").value;
	var httpRequest = new XMLHttpRequest();
	httpRequest.onreadystatechange = function() {
		if (httpRequest.readyState == XMLHttpRequest.DONE
				&& httpRequest.status == 200) {

			document.getElementById("searchBox").innerHTML = httpRequest.responseText;
		}
	};
	// POST 방식의 요청은 데이터를 Http 헤더에 포함시켜 전송함.
	httpRequest.open("POST", "SearchProjectProc.jsp", true);
	httpRequest.setRequestHeader("Content-Type",
	"application/x-www-form-urlencoded");
	httpRequest.send("search=" + input); //변수에 데이터 넣으면 post방식
}

$(function () {
	$(".none_click_2").on("click", function () {
		$("#searching").attr("style","display:none;");
		if ($(this).hasClass("click_1")) {
			$(this).removeClass("click_1").children().removeClass("click_icon_1");
		} else {
			$(this).addClass("click_1").children().addClass("click_icon_1");
			$(this).siblings().removeClass("click_1").children().removeClass("click_icon_1");
		}

		if ($("#all-fund").hasClass("click_1")) {
			$("#all").attr("style", "display:block;");
		} else {
			$("#all").attr("style", "display:none;");
		}
		if ($("#ing-fund").hasClass("click_1")) {
			$("#ing").attr("style", "display:block;");
		} else {
			$("#ing").attr("style", "display:none;");
		}
		if ($("#ed-fund").hasClass("click_1")) {
			$("#end").attr("style", "display:block;");
		} else {
			$("#end").attr("style", "display:none;");
		}
	});

	$(".searchbox").on('click', function(){
		$(".show-funding").attr("style", "display:none;");
		$("#searching").attr("style","display:block;");
		if($(".none_click_2").hasClass("click_1")){
			$(".none_click_2").removeClass("click_1").children().removeClass("click_icon_1");;
		}
	});




});