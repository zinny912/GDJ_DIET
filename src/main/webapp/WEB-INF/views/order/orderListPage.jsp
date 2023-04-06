<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:import url="../template/common_css.jsp"></c:import>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"> -->
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">
	<div class="row">
<c:import url="../member/memberHeader.jsp"></c:import>

    <div class="col-10">
      <div class="row">
      		
	<c:forEach items="${orderDTOs}" var="orderDTO" varStatus="i">
<div class="orderList">




<div class="col-12">
	<div class="card">
	  <div class="card-body">
	    <h5 class="card-title">${orderDTO.orderDate} 주문</h5>

		<!-- detail page -->
		<c:forEach items="${orderDTOs}" var="orderDTO">
			<div hidden="" class="orderNum" data-orderNum="${orderDTO.orderNum}"></div>
			<div class="col-12 cartListIn">
			
			</div>	
		</c:forEach>
		<!-- detail page -->
	    
	  </div>
	</div>		
</div>




</div>
	</c:forEach>		
	</div>
</div>

	</div>
</div>


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

<div class="container container-fluid">
 
</div>

<c:import url="../template/common_js.jsp"></c:import>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>

<c:import url="../template/footer.jsp"></c:import>

<script src="/resources/js/order/orderList.js"></script>
<script src="/resources/js/member/memberDelete.js"></script>



<!-- <script>
  const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, {
  title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))
</script> -->

</body>
</html>