<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="DAO.BoardDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "Bean.BoardBeans" %>
<%@ page import = "DAO.CommentDAO" %>
<%@ page import = "Bean.CommentBeans" %>

  <!-- session 부분 -->  
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String sName = (String)session.getAttribute("u_nm");	
	String sU_idx = (String)session.getAttribute("u_idx");
	String pj_idx = (String)session.getAttribute("pj_idx");
%>

<!-- request 부분 -->
<%
String b_idx = request.getParameter("b_idx");

%>    
<!-- boardDAO -->
<%
	BoardDAO boardDAO = new BoardDAO();
	ArrayList<BoardBeans> blist = new ArrayList<BoardBeans>();
	
	blist = boardDAO.getBoard(b_idx);
	//--- test 코드-------
	//System.out.println(list);
	//------------------
	String b_nm = boardDAO.getName(Integer.toString(blist.get(0).getB_u_idx()));
	String b_time = blist.get(0).getB_time().substring(0,11);
	int days = boardDAO.getDate(b_time);
	String b_content = blist.get(0).getB_content();
	//System.out.println(b_nm);
	//...................
%>
<!-- CommentDAO -->
<%
	CommentDAO cDAO = new CommentDAO();
	ArrayList<CommentBeans> clist = new ArrayList<CommentBeans>();
	clist = cDAO.getComments(b_idx);
	int c_cnt = cDAO.getCommentCnt(b_idx);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../../css/boardView.css">

<title>게시글 상세보기</title>
</head>
<body>
	<div class="wrap_view">
	<a href="../fundProject/ProjectPageBList.jsp">
        <div class="back_bt_container"><button class="back_bt">커뮤니티로 돌아가기</button></div>
        </a>
        <div class="container_content">
            <div class="board_header">
                <div class="head_name">게시글 상세보기</div>
            </div>
            
            <div class="wrap_content">
                <div class="board_content_container">
                    <div class="content_header">
                        <span class="cd_profile_img"></span>
                        <div class="bd_info">
                            <div class="bd_name">
                                <div class="bd_name_content"><%=b_nm %></div>
                            </div>
                            <span class="bd_reg_dt"><%=days %>일 전</span>
                        </div>
                    </div>
                    <div class="content_main">
                        <div class="card_content">
                            <%=b_content %>
                        </div>
                    </div>
                    <div class="board_comment">
                        <strong><%=c_cnt %></strong>개의 댓글이 있습니다.
                    </div>
                </div>
                <!-- boardComment부분 -->
                <%
                	for(int i = 0; i < clist.size(); i++){
                		String nm = cDAO.getName(Integer.toString(clist.get(i).getC_u_idx()));
                		String c_dt = clist.get(i).getC_dt().substring(0, 16);
                		System.out.println(c_dt);
                		String c_content = clist.get(i).getC_content();
                	%>
                <div class="board_comment_container">
                    <div class="profile_img_css"><span class="profile_img"></span></div>
                    <div class="comment_container">
                        <div class="comment_info">
                            <div class="comment_nm_container">
                                <div class="comment_nm"><%= nm %></div>
                            </div>
                            <div class="comment_reg_dt"><%=c_dt %></div>
                        </div>
                        <div class="comment_content"><%=c_content %></div>
                    </div>
                </div>
                <%
                	}
                %>
                <!-- comment input창 -->
                <div class="comment_input_container">
                    <div class="comment_profile_img"></div>
                    <div class="comment_input">
                        <form name="cForm" method="POST" action="commentWriteP.jsp?b_idx=<%=b_idx%>">
                            <input name=c_content class="input_cm" type="text" placeholder="댓글을 작성해주세요.">
                            
                    </div>
                    <div><button type="submit" class="cm_bt">올리기</button></div>
                </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>