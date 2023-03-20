<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./common_css.jsp"></c:import>
</head>
<body>
더미홈홈
<a href="/member/myPage">마이페이지</a>
<a href="/member/join">가입</a>

<div id="dum">
</div>


<c:choose>
	<c:when test="${sessionMember eq null}"><a href="/member/login">로그인</a>	</c:when>
	<c:when test="${sessionMember ne null}"><a onclick="kakaoLogout()" href="/member/logout">로그아웃</a></c:when>
</c:choose>


<h3>세션: ${sessionMember}</h3>



<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal">
  회원탈퇴
</button>

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body margin-bottom-xxxl">
			<div>가입된 회원정보가 모두 삭제됩니다. 작성하신 게시물은 삭제되지 않습니다.</div>
			<div>탈퇴 후 같은 계정으로 재가입 시 기존에 가지고 있던 적립금은 복원되지 않으며, 사용 및 다운로드했던 쿠폰도 사용 불가능합니다.</div>
			<div>회원 탈퇴를 진행하시겠습니까?</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="memberDeleteBtnModal" onclick="javascript:modalMemberDelete()">탈퇴하기</button>
        <button type="button" class="btn btn-secondary" id="modalClose" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<a href="javascript:kakaoInfo()">카카오 info</a>
<a href="javascript:kakaoInfo2()">카카오 info2</a>
<a href="javascript:kakaoInfoLoginPage()">카카오 info login page</a>

<c:import url="./common_js.jsp"></c:import>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script><!-- kakaoAPI -->
<script src="/resources/js/member/kakaoLogin.js"></script>
<script src="/resources/js/member/memberDeleteJSON.js"></script><!--kakaoLogin.js에서 del기능호출-->
<script src="/resources/js/member/kakaoInfo.js"></script>


<!-- <script src="/resources/js/member/kakao.js"></script> -->

<script>



</script>

</body>
</html>