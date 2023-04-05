<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <c:import url="../template/common_css.jsp"></c:import> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
<!-- <c:import url="../template/header.jsp"></c:import> -->

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






<div class="flex-center" style="height: 100%; display: flex; align-items: center; justify-content: center;">
  <button class="btn btn-primary ex-popover" tabindex="0" data-toggle="popover" data-trigger="focus" data-popover-content="#a2">Popover Example</button>
  </div>
  
  

  
  <div id="a2" class="hidden" hidden>
    <div class="popover-heading">This is the heading for #2</div>
  
    <div class="popover-body">
    This is the body for #2<br> With <b>html</b> content
    <button class="btn btn-primary mx-auto">Button</button>
    </div>
  </div>



  
<!-- <script>
$(function() {
  $("[data-toggle=popover]").popover({
    html: true,
    placement:"bottom",
    content: function() {
      var content = $('.ex-popover').attr("data-popover-content");
      console.log($('.ex-popover').attr("data-popover-content"))
      return $('#a2').children(".popover-body").html();
    },
    title: function() {
      var title = $('.ex-popover').attr("data-popover-content");
      console.log('.ex-popover')
      return $('#a2').children(".popover-heading").html();
    }
  });
});


</script> -->






<!--popover함수 내에서-->

<button type="button" class="btn btn-lg btn-danger" data-bs-toggle="popover" data-bs-title="Popover title" data-bs-content="">Click to toggle popover</button>

<!-- <script>
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
  const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl,{html: true}))
</script> -->

<script>
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, {
  title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))
</script>

<!-- <script>
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, {
  title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content: "<button class='btn'>장장</button>", html: true, placement: "right"}))
</script> -->

<!-- <button class='btn btn-danger'>장장</button>
<a href='' type='button'>버튼</a> -->

<!-- <c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import> -->



</body>
</html>