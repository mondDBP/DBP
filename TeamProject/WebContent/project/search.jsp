<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script>
	function keyword_check(){
		if(document.search.keywd.value==''){ //검색어가 없을 경우  
	  		alert('검색어를 입력하세요'); //경고창 띄움 
	  		document.search.keywd.focus(); //다시 검색창으로 돌아감 
	  		return false; 
		}
	  	else {
	  		return true;
	  	}
	 }

	function back() {
		history.go(-1);
	}
</script>
</head>
<body>
<b>프로젝트 검색</b>
<form name="search" method="post" action="<c:url value='/project/list/result' />" onsubmit="return keyword_check();">
	<input type="text" style="width:200" name="keywd">
	<input type="submit" value="검색"><br>
	<input type="button" value="취소" onClick="back()">
</form>
</body>
</html>