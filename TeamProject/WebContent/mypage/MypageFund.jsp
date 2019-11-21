<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>후원현황 :: 텀블벅</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .container {
            width: 100%;
            height: 100%;
            
        }

        .container_2 {
            width: 100%;
            height: 100%;
           
            background-color: #f1f1f1;
        }


        .img_box {
            width: 800px;
            
            height: 100%;
            margin: 0 auto;
            text-align: center;
            padding: 35px;
        }

        .smile_size {
            width: 160px;
            height: 120px;
        }

        .text_setting {
            margin-top: -0.2rem;
        }

        .middle_box {
            width: 500px;
            height: 600px;
            margin: 0 auto;
        }

        .icon_funding_pay_search {
            width: 800px;
            height: 64px;
         
            padding-bottom: 1em;
        }

        .icon_funding_pay_all_box {
            width: 800px;
            height: 92%;
          
            margin: 0 auto;
        }

        .icon_funding_pay_left {
            display: flex;
            width: 400px;
            height: 64px;
        
            box-sizing: border-box;
            float: left;
        }

        .icon_funding_pay_right {
            display: flex;
            width: 398px;
            height: 64px;
          
            box-sizing: border-box;
            float: right;
        }

        .click_1 {
            border-color: #3a6ff2 !important;
            color: #3a6ff2 !important;
            border-radius: .28571429rem;
            box-shadow: none;
            background: rgba(0, 0, 0, .05);
            align-self: center;
            border: none;
            padding: .71428571em .92857143em;
            margin: 0 .35714286em;
            transition: color .1s ease;
            font-weight: 400;
            display: flex;
            align-items: center;
            position: relative;
            vertical-align: middle;
            line-height: 1;
            text-decoration: none;
            -webkit-tap-highlight-color: transparent;
            flex: 0 0 auto;
            user-select: none;
            text-transform: none;
            font-size: 12px;
        }

        .click_icon_1 {
            background: #999;
            margin-left: 1em;
            padding: .3em .71428571em;
            background-color: #3a6ff2 !important;
            border-color: #3a6ff2 !important;
            color: #fff !important;
            margin-right: 0;
            font-size: 12px;
            display: inline-block;
            line-height: 1;
            vertical-align: baseline;
            text-transform: none;
            font-weight: 700;
            border: 0 solid transparent;
            border-radius: .28571429rem;
            transition: background .1s ease;
        }

        .none_click_2 {
            cursor: pointer;
            align-self: center;
            box-shadow: none;
            border: none;
            padding: .71428571em .92857143em;
            margin: 0 .35714286em;
            background: none;
            transition: color .1s ease;
            border-radius: .28571429rem;
            display: flex;
            align-items: center;
            position: relative;
            vertical-align: middle;
            line-height: 1;
            text-decoration: none;
            -webkit-tap-highlight-color: transparent;
            flex: 0 0 auto;
            user-select: none;
            text-transform: none;
            color: rgba(0, 0, 0, .87);
            font-weight: 400;
            font-size: 12px;
        }

        .none_icon_2 {
            background: #999;
            color: #fff;
            margin-left: 1em;
            padding: .3em .71428571em;
            margin-right: 0;
            font-size: 12px;
            display: inline-block;
            line-height: 1;
            vertical-align: baseline;
            text-transform: none;
            font-weight: 700;
            border: 0 solid transparent;
            border-radius: .28571429rem;
            transition: background .1s ease;
        }

        .search_1 {
            align-self: center;
            box-shadow: none;
            border: none;
            padding: .71428571em .92857143em;
            margin: 0px 4.357143em;
            background: none;
            transition: color .1s ease;
            border-radius: .28571429rem;
            display: flex;
            align-items: center;
            position: relative;
            vertical-align: middle;
            line-height: 1;
            text-decoration: none;
            -webkit-tap-highlight-color: transparent;
            flex: 0 0 auto;
            user-select: none;
            text-transform: none;
            color: rgba(0, 0, 0, .87);
            font-weight: 400;
            padding-right: 0 !important;
            padding-left: 0 !important;
            width: 20rem;
        }

        .search_2 {
            position: relative;
            top: 0;
            margin: -.5em 0;
            width: 100%;
            font-size: 1em;
            font-weight: 400;
            font-style: normal;
            display: inline-flex;
            color: rgba(0, 0, 0, .87);
        }

        .search_img {
            cursor: pointer;
            position: absolute;
            line-height: 1;
            text-align: center;
            top: 0;
            right: 0;
            margin: 0;
            height: 100%;
            width: 2.67142857em;
            border-radius: 0 .28571429rem .28571429rem 0;
            transition: opacity .3s ease;
            opacity: 1 !important;
            font-size: 1em;
            display: inline-block;
            font-family: Icons;
            font-style: normal;
            font-weight: 400;
            text-decoration: inherit;
            -webkit-font-smoothing: antialiased;
            backface-visibility: hidden;
            box-sizing: inherit;
        }

        .result_funding {
            width: 800px;
            height: 52px;
           
        }

        .result_funding_in {
            font-size: 14px;
            margin-top: 0;
            color: #545454;
            font-weight: 400;
            position: relative;
            min-height: 1em;
            background: rgba(0, 0, 0, .03);
            padding-left: 25px;
            line-height: 1.7em;
            transition: opacity .1s ease, color .1s ease, background .1s ease, box-shadow .1s ease;
            border-radius: .28571429rem;
            box-shadow: inset 0 0 0 0 rgba(34, 36, 38, .22), 0 0 0 0 transparent;
            margin-bottom: 1em !important;
            padding-top: 10px;
            padding-bottom: 15px;
        }

        .list_lmg {
            margin-bottom: 0;
            margin-top: 0;
            margin-right: .6em;
            font-size: 1.14285714em;
            padding-bottom: 0;
            line-height: 1;
            vertical-align: middle;
            color: #767676 !important;
            list-style-type: none;
            display: inline-block;
            opacity: 1;
            width: 1.18em;
            height: 1em;
            font-family: Icons;
            font-style: normal;
            font-weight: 400;
            text-decoration: inherit;
            text-align: center;
            -webkit-font-smoothing: antialiased;
            backface-visibility: hidden;
        }

        .gift_box {
            width: 800px;
            height: 100%;
           
            vertical-align: middle;
            padding: 10px 0;
        }

        .gift_box_img_text {
            text-align: center;
            width: 891px;
            height: 112px;
            margin-left: auto !important;
            margin-right: auto !important;
            display: block;
            max-width: 100% !important;
            
        }

        .gift_box_text {
            opacity: .45;
            margin-bottom: 0;
            font-size: 1.28rem;
            border: none;
            margin-top: 10px;
            padding: 0;
            font-family: SpoqaHanSans, Helvetica Neue, Arial, Helvetica, sans-serif;
            font-weight: 700;
            line-height: 1.2857em;
            text-transform: none;
            color: #767676;
        }

        .number_chart {
            width: 800px;
            height: 50px;
            
            display: block;
        }

        .text_number_div {
            width: 50px;
            height: 50px;
          
            margin: 0px 370px;
        }

        .number_start {
            border-top: none;
            padding-top: .92857143em;
            background-color: rgba(0, 0, 0, .05);
            color: rgba(0, 0, 0, .95);
            box-shadow: none;
            border-radius: 0 .28571429rem .28571429rem 0;
            min-width: 3em;
            text-align: center;
            background: rgba(0, 0, 0, .05);
            font-weight: 400;
            display: flex;
            align-items: center;
            position: relative;
            vertical-align: middle;
            line-height: 1;
            text-decoration: none;
            -webkit-tap-highlight-color: transparent;
            flex: 0 0 auto;
            user-select: none;
            padding: .92857143em 1.14285714em;
            text-transform: none;
            transition: background .1s ease, box-shadow .1s ease, color .1s ease;
        }
        
    </style>
    <script>
        

            $(function () {
                $(".none_click_2").on("click", function(){
                    if($(this).hasClass("click_1")){
                        $(this).removeClass("click_1").children().removeClass("click_icon_1");
                    }else{
                        $(this).addClass("click_1").children().addClass("click_icon_1");
                        $(this).siblings().removeClass("click_1").children().removeClass("click_icon_1");
                    }

                    if($("#all-fund").hasClass("click_1")){
                    $(".show-funding").attr("style","display:block;");
                }else{
                    $(".show-funding").attr("style","display:none;");
                }
                });

                
                
            });
    
    
        </script>
    
</head>

<body style="overflow: auto;">
    <div class="container">
        <div class="img_box"><img class="smile_size" src="img/smile.PNG">
            <h3 class="text_setting">OOO님의 후원 현황</h3>
        </div>
    </div>
    <div class="container_2">

        <div class="icon_funding_pay_all_box">
            <div class="icon_funding_pay_search">
                <div class="icon_funding_pay_left">
                    <a class="none_click_2 click_1" id="all-fund">모두보기
                        <div class="none_icon_2 click_icon_1"> 0 </div>
                    </a>
                    <a class="none_click_2"id="ing-fund">펀딩 진행중
                        <div class="none_icon_2"> 0 </div>
                    </a>
                    <a class="none_click_2" id="ed-fund">결제 완료
                        <div class="none_icon_2"> 0 </div>
                    </a>
                </div>
                <div class="icon_funding_pay_right">
                    <div class="search_1">
                        <div class="search_2">
                            <input type="text" placeholder="  프로젝트, 선물, 창작자를 검색하세요" value=""
                                style="width: 100%; height: 35px;">
                            <div class="search_img">
                                <img src="img/search.PNG" style="width:40px; height:35px; padding: 1px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="show-funding">
                <div class="result_funding">
                    <div class="result_funding_in">
                        <i class="list_lmg">
                            <img src="img/list.png" style="width: 23px; height: 17px;">
                        </i>
                        총 0건의 후원 결과가 있습니다.
                    </div>
                </div>
                <div class="gift_box">
                
                
                <!--  include!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1 -->
                
                    <jsp:include page="MypageProjectbox.jsp"></jsp:include>
                    
                    
                <!--  include!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1 -->
                </div>

                <div class="number_chart">
                    <div class="text_number_div">
                        <numberchart class="number_start">1</numberchart>
                    </div>
                </div>
            </div>
        </div>


    </div>
</body>

</html>