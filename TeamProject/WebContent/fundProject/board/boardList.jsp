<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Bean.*" %>
<%@ page import="DAO.*" %>
<%@ page import="dbConnection.*" %>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 보기 페이지</title>
<!-- <link rel="stylesheet" href="board2.css">-->
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<link rel="stylesheet" href="../../css/boardList.css">



</head>
<body>
	<%
	
	request.setCharacterEncoding("UTF-8");
	//int sU_idx = (int)session.getAttribute("sU_idx");
	int sU_idx = 2;

	//String sU_nm = (String)session.getAttribute("u_nm");
	//int sPj_idx = (int)session.getAttribute("sPj_idx");
	
	%>
	<div id="test"></div>

	<div id="container_community">
		<a href="board/boardWrite.jsp">
			<div class="upload_msg">
			<!-- 글쓰기 페이지로 이동 -->
				<div class="content_container">
					<span class="profile_img"></span> 창작자에게 응원 한마디!
				</div>
				
			</div>
		</a>
		<div class="community_button">
			<div class="board_button_container">
				<div class="board_button">모든 게시글</div>
			</div>
		</div>
		<%
        	CommentDAO commentDAO = new CommentDAO();
        	
        	BoardDAO boardDAO = new BoardDAO();
        	int b_pj_idx = 1;
        	ArrayList<BoardBeans> list = boardDAO.getList(b_pj_idx);
        	//System.out.println(list);
        	for(int i = 0; i< list.size(); i++){
        		String b_nm = boardDAO.getName(Integer.toString(list.get(i).getB_u_idx()));
        		int b_u_idx = list.get(i).getB_u_idx();
        		int b_idx = list.get(i).getB_idx();
        		int c_cnt = commentDAO.getCommentCnt(Integer.toString(b_idx));
        		String b_dt = list.get(i).getB_time().substring(0, 11);
        		String b_content = list.get(i).getB_content();
        		if(b_u_idx == sU_idx){
        			// 자기가 쓴 게시글이 있는경우
        			%>
		<!-- 후원한 회원 게시 카드 -->
		<div class="card_board">
			<div class="card_info">
				<!--<div class="maker_alert_box">창작자 업데이트</div>-->
				<div class="card_wirter_profile">
					<span class="cd_profile_img"></span>
					<div class="bd_info">
						<div class="bd_name">
							<div class="bd_name_content"><%=b_nm %></div>
						</div>
						<span class="bd_reg_dt"><%=b_dt %></span>
					</div>
					<!-- 글수정 페이지로 이동 -->
					<a href="/Bumblbug/ProjectPageBEdit?b_idx=<%= b_idx %>"> <img
						class="aaaa" style="width: 30px; height: 30px;"
						src="board/images/gearIcon.png">
					</a>
				</div>
			</div>
	
		<!-- view 페이지 -->
			<a href="../fundProject/ProjectPageBView.jsp?b_idx=<%=b_idx%>&pj_idx=<%=b_pj_idx%>">
				<div class="card_content_st">
					<div class="card_content">
						<%= b_content%>
					</div>

				</div>
			</a> <a href="/Bumblbug/ProjectPageBView.jsp?b_idx=<%=b_idx%>&pj_idx=<%=b_pj_idx%>">
				<div class="card_comment_no">
					<i class="comment_icon"><img style="width: 16px; height: 16px;"
						src="board/images/kakao.png"></i>
					<%=c_cnt %>
				</div>
				</a>
		</div>
		
		<%
        		}else{
 						//자신이 쓴 게시글이 없는경우
        		 %>

		<!-- 후원한 회원 게시 카드 -->
		<div class="card_board">
			<div class="card_info">
				<!--<div class="maker_alert_box">창작자 업데이트</div>-->
				<div class="card_wirter_profile">
					<span class="cd_profile_img"></span>
					<div class="bd_info">
						<div class="bd_name">
							<div class="bd_name_content"><%=b_nm %></div>
						</div>
						<span class="bd_reg_dt"><%=b_dt %></span>
					</div>
				</div>
			</div>
			<a href="board/boardView.jsp?b_idx=<%=b_idx %>">
				<div class="card_content_st">
					<div class="card_content">
						<%= b_content %>
					</div>

				</div>
			</a> <a href="board/boardView.jsp?b_idx=<%=b_idx %>">
				<div class="card_comment_no">
					<i class="comment_icon"><img style="width: 16px; height: 16px;"
						src="board/images/kakao.png"></i>
					<%=c_cnt %>
				</div>
			</a>
		</div>

		<%
        	}
       	}
%>


	</div>

</body>
</html>