<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	request.setCharacterEncoding("utf-8"); // 인코딩 타입 설정 %>
<%  // upload.jsp(hidden)로 부터 넘어온 값들을 구함
	String fileName = request.getParameter("fileName");
	String orgfileName = request.getParameter("orgfileName");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	첨부파일(클릭시 다운로드)<br>
	<!-- download.jsp 파일로 저장된 파일의 이름을 넘겨줌 -->
	- 파일1 : <a href="download.jsp?fileName=<%=fileName %>"><%=orgfileName %></a><br>
</body>
</html>