<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
<script src="https://cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script>
<!-- <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script> -->
<link rel="stylesheet" href="../../css/boardWrite.css">
</head>
<body>

	<a href="./boardList.jsp">
    <div class="back_bt_container"><button type="button" class="back_bt">커뮤니티로 돌아가기</button></div>
    </a>
    <form name="bForm" method="POST" action="boardWriteP.jsp">
    <div class="edit_container">
        <!--<div class="title_boardWrite">게시글 작성하기</div>-->
        <div class="edit_area"><textarea name="b_content"></textarea></div>
        <div class="upload_bt_container">
            <div class="bt_container"><button type="submit" class="upload_bt">올리기</button></div>
        </div>

    </div>
    </form>
    <script>
        CKEDITOR.replace('b_content');
    </script>

	
</body>
</html>