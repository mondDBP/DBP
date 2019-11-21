<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String p_idx = request.getParameter("p_idx");
    String pay_idx = request.getParameter("pay_idx");
    String f_idx = request.getParameter("f_idx");
    
    
    %>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>jQuery Style</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   
   
    
    
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            color: #676363;

        }
        ul{
            color: #676363;
            font-size: 15px;
            list-style: none;

        }
        li{
            display: inline-block;
        }

        body{
            overflow-x: hidden;
            min-height: 100%;
            height: auto;
        }
        .header{
            width: 100%;
            background-color: #fff;
            border-bottom: 1px solid #efefef;
            
        }
        .header-title{
            
            font-size: 22px;
            text-align: center;
            
            padding: 20px;
           
        }
        .scanline{
            width: 100%;
            
            position: relative;
            background: #fafafa
        }
        .b-align{
            text-align: center;
            padding: 50px;
            background-repeat: no-repeat;
            background-position: 50%;
            background-size: cover;
            
        }
        .b-menu-item{
            padding: 10px;
            text-decoration: none;
            
        }
        
        .dek{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .b-container-wrap{
            padding-top: 20px;
            position: relative;
        }
        .b-container{
            width: 700px;
            margin: 0 auto;
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
                
                    <a href="changeItem_cancel.jsp?p_idx=<%=p_idx %>&pay_idx=<%=pay_idx %>" class="b-menu-item">취소하기</a>
               
                </li>
            </ul>

        </div>
    </div>
    <div class="b-container-wrap">
        <div class="b-container">
            
	<!-- ------------------------------------------------------------ -->
            <jsp:include page="MypagePresentbox.jsp"></jsp:include>
    <!-- ------------------------------------------------------------ -->        
        </div>

    </div>

    


</body>

</html>
