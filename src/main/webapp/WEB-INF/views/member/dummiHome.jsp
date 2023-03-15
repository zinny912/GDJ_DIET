<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
더미홈홈
<a href="/member/myPage">마이페이지</a>
<a href="/member/join">가입</a>

<div id="dum">
</div>


<c:choose>
	<c:when test="${sessionMember eq null}"><a href="/member/login">로그인</a>	</c:when>
	<c:when test="${sessionMember ne null}"><a onclick="kakaoLogout()" href="./logout">로그아웃</a></c:when>
</c:choose>

<a href="javascript:kakaoInfo()">카카오 info</a>
<a href="javascript:kakaoInfo2()">카카오 info2</a>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- <script src="/resources/js/kakaoLogin.js"></script> -->
<script src="/resources/js/kakaoInfo.js"></script>
<script>


</script>
</body>
</html>