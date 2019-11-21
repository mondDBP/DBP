
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String p_idx = request.getParameter("p_idx");
    String pay_idx = request.getParameter("pay_idx");
    String u_idx = (String) session.getAttribute("u_idx");
    String pj_idx = (String) session.getAttribute("pj_idx");
    out.println("u_idx: "+u_idx);
    out.println("p_idx: " +p_idx);
    out.println("pay_idx: " + pay_idx);
    out.println("pj_idx:" + pj_idx);
    
    %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>jQuery Style</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
    function check()
    {
        msg = "정말로 삭제할건가요??";
        if (confirm(msg)!=0) {
             // Yes click
        	document.getElementById("delFrm").submit();
             
        } else {
            // no click
        	
            
}
    }; // myconfirm
    
    
    
    </script>




    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            color: #676363;

        }

        ul {
            color: #676363;
            font-size: 15px;
            list-style: none;

        }

        li {
            display: inline-block;
        }

        body {
            overflow-x: hidden;
            min-height: 100%;
            height: auto;
        }

        .header {
            width: 100%;
            background-color: #fff;
            border-bottom: 1px solid #efefef;

        }

        .header-title {

            font-size: 22px;
            text-align: center;

            padding: 20px;

        }

        .scanline {
            width: 100%;

            position: relative;
            background: #fafafa
        }

        .b-align {
            text-align: center;
            padding: 50px;
            background-repeat: no-repeat;
            background-position: 50%;
            background-size: cover;

        }

        .b-menu-item {
            padding: 10px;
            text-decoration: none;

        }

        .dek {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .b-container-wrap {
            padding-top: 20px;
            position: relative;
        }

        .b-container {
            width: 700px;
            margin: 0 auto;
        }

        .cancel-box {
            color: #676363;
            line-height: 28px;
            position: relative;
            background-color: #ebeae5;
            padding: 20px;
           

        }

        .cancel-box-head {
            font-size: 20px;
            margin-bottom: 5px;
        }
        .cancel-box-mid{
            display: flex;
        }

        .cancel-box-img {
            
            margin-right: 15px;
        }

        .cancel-box-content {
            width:50%;
            width: 65%;
            height: 150px;



        }

        .cancel-box-price {
            background-color: #433;
            color: #f4f3f3;
            font-size: 13px;
            padding-top: 2px;
            padding-bottom: 2px;
            border-radius: 5px;

        }

        .cancel-box-footer {
            text-align: center;
        }
        .cancel-button{
            cursor: pointer;
            display: inline-block;
            min-height: 1em;
            outline: none;
            border: none;
            vertical-align: baseline;
            box-shadow: 0px 0px 0px 1px transparent inset, 0px 0em 0px 0px rgba(0, 0, 0, 0.1) inset;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-transition: opacity 0.1s ease, background-color 0.1s ease, color 0.1s ease, box-shadow 0.1s ease, background 0.1s ease;
            transition: opacity 0.1s ease, background-color 0.1s ease, color 0.1s ease, box-shadow 0.1s ease, background 0.1s ease;
            -webkit-tap-highlight-color: transparent;
            margin: 0 .25em 0 0;
            border-radius: 0.28571429rem;
            text-transform: none;
            text-shadow: none;
            font-weight: bold;
            line-height: 1em;
            font-style: normal;
            text-align: center;
            -webkit-text-decoration: none;
            text-decoration: none;
            color: rgba(0, 0, 0, .6);
            background-color: #e7e7e7;
            background-color: #fa6462;
            color: #fff;
            padding: 1em 1.5em;
            font-size: 1em;
            width: 20%;
            opacity: 1;
        }

        .cancel-button {
            margin: 0 .42857143em 0 -.21428571em;
        }

        .cancel-button:hover,
        .cancel-button:focus,
        .cancel-button:active {
            background-color: #d9d9d9;
            color: rgba(0, 0, 0, 8);
        }

        .cancel-button:hover,
        .cancel-button:focus,
        .cancel-button:active {
            background-color: #ff4543;
            color: #fff;
        }
    </style>
    <script>


        $(function () {

        });


    </script>
</head>

<body>
    <div class="header">
        <div class="header-title">bumblebug</div>
    </div>

    <div class="scanline">
        <div class="b-align" style="background-image: url(images/background.jpeg)">
            <h1>변경하기</h1>
            <p class="dek">
                언제 어디서든 신선한 필름, '전국 필름 자판기 설치' 프로젝트
            </p>
            <ul>
                <li>
                    <a href="changeItem.jsp" class="b-menu-item"> 선물/금액변경</a>
                </li>
                <li>
                    <a href="Mypage_payment.jsp" class="b-menu-item">지불수단 변경</a>
                </li>
                <li>
                    <form name="delFrm" method="post" action="delete.jsp">
                        <a href="#" class="b-menu-item">취소하기</a>
                    </form>
                </li>
            </ul>

        </div>
    </div>
    <div class="b-container-wrap">
        <div class="b-container">

            <div class="cancel-box">
                <div class="cancel-box-head">
                    취소되는 항목
                </div>
                <div class="cancel-box-mid">
                    <div class="cancel-box-img">
                        <img style="width:200px; height:150px;" src="images/background.jpeg">
                    </div>
                    <div class="cancel-box-content">
                        <strong>예약된 금액</strong>
                        <span class="cancel-box-price">7500원</span>
                        <div style="padding-bottom: 10px;"><strong>선택한 선물</strong>ㅇㅇㅇ</div>
                        <div>선물:너의 손을 잡아줄 개/개개</div>
                    </div>

                </div>
            </div>
            <div class="cancel-box-footer">
            
            <form id="delFrm" name="delFrm" method="post" action="changeItem_cancelproc.jsp">
                <input class="cancel-button" type="button" value="취소하기"  onClick="check()">
                <input class="cancel-button" type="button" value="다시생각"  onClick="javascript:location.href= 'Mypage_fund.jsp'">
                <input type="hidden" name="p_idx" value="<%=p_idx %>">
			</form>

            </div>


        </div>


    </div>




</body>

</html></html>