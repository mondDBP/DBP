<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Bean.*" %>
<%@ page import="DAO.*" %>
<%@ page import="dbConnection.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정 페이지</title>
<script src="https://cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script>
<link rel="stylesheet" href="../../css/boardEdit.css">

<%
	String b_idx = (String)request.getParameter("b_idx");
	//test code
	out.println("수정하기 위한 게시판 idx : " + b_idx);
	//
%>
<%
	//------------BoardDAO ---------------
	BoardDAO boardDAO = new BoardDAO();
	String b_content = boardDAO.getContent(b_idx);
	
	

%>
</head>
<body>

	<a href="./boardList.jsp">
    <div class="back_bt_container"><button type="button" class="back_bt">커뮤니티로 돌아가기</button></div>
    </a>
    
    <div class="edit_container">
        <div class="title_boardWrite">게시글 작성하기 
        	<a href="boardDeleteP.jsp?b_idx=<%=b_idx%>">
        	<div class="trash">
        		<img style="width:30px; height: 30px;" alt="삭제" src="images/trashcan.png">
        		</div>
        	</a>
        </div>
        
        <form name="bForm" method="POST" action="boardEditP.jsp">
        <input type=hidden name = b_idx value=<%=b_idx%>>
        <div class="edit_area"><textarea name="b_content"><%=b_content %></textarea></div>
        <div class="update_bt_container">
            <div class="bt_container"><button type="submit" class="update_bt">수정하기</button></div>
        </div>
    </form>
    </div>

    <script>
        CKEDITOR.replace('b_content');
    </script>

	
</body>
</html>