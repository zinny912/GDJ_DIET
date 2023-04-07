<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

					<c:forEach items="${orderDTOs}" var="orderDTO">
						<div class="orderList order_number">


<c:forEach items="${orderDTO.cartDTOs}" var="cartDTO">

<c:if test="${cartDTO.studyNum ne null}">

	<div class="card">
		<div class="card-body"> 		<!-- 아니면, ${cartDTO.studyNum}, ${cartDTO.studyDTOs[0].studyNum} -->
			<a href="/study/studyDetail?studyNum=${cartDTO.studyNum}" 
				class="moveProduct"> <img
				src="/resources/images/${cartDTO.studyDTOs[0].studyBoardFileDTOs[0].fileName}"
				width="78" height="78" class="product-img img">
			</a> <span class="option-item-name" style="font-size: 25px">${cartDTO.studyDTOs[0].studyName}</span>
			<div>
				<button type="button" class="btn btn-secondary btn-addCart to-cart-popper"
					data-addCart-price="${cartDTO.cartPrice}"
					data-addCart="${cartDTO.studyNum}" data-bs-container="body"
					data-bs-toggle="popover" data-bs-placement="top"
					data-bs-content="Top popover">장바구니 담기</button>
				<button type="button" class="btn btn-secondary">리뷰
					작성하기</button>
			</div>

			<h5 class="card-title">${cartDTO.studyDTOs[0].studyName}</h5>
		</div>

	</div>
</c:if>



<!-- 기구 -->
<c:if
	test="${cartDTO.realMachineNum ne null}">


	<div class="card">
		<div class="card-body">

			<a
				href="/healthMachine/detail?machineNum=${cartDTO.realMachineNum}"
				class="moveProduct"> <img
				src="/resources/images/${cartDTO.healthMachineDTO.healthMachineImgDTOs[0].fileName}"
				width="78" height="78" class="product-img img">
			</a> <span class="option-item-name" style="font-size: 25px">${cartDTO.healthMachineDTO.machineName},
				${cartDTO.realHealthMachineDTO.optName1},
				${cartDTO.realHealthMachineDTO.optName2},
				${cartDTO.realHealthMachineDTO.optName3},
				${cartDTO.realHealthMachineDTO.optName4} </span>
			<!-- 상품세부정보삽입 -->
			<span>${cartDTO.count}개</span>
			<div>
				<button type="button"
					class="btn btn-secondary btn-addCart-machine to-cart-popper"
					data-bs-container="body" data-bs-toggle="popover"
					data-bs-placement="top" data-bs-content="Top popover"
					data-addCart="${cartDTO.realMachineNum}"
					data-addCart-price="${cartDTO.cartPrice}"
					data-addCart-machineNum="${cartDTO.realHealthMachineDTO.machineNum}"
					data-addCart-op1="${cartDTO.realHealthMachineDTO.optId1}"
					data-addCartop-2="${cartDTO.realHealthMachineDTO.optId2}"
					data-addCartop-3="${cartDTO.realHealthMachineDTO.optId3}"
					data-addCartop-4="${cartDTO.realHealthMachineDTO.optId4}">장바구니
					담기</button>
				<button type="button" class="btn btn-secondary">리뷰
					작성하기</button>



			</div>

		</div>
	</div>

</c:if>

</c:forEach>





						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>


	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#deleteModal">회원탈퇴</button>

	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body margin-bottom-xxxl">
					<div>가입된 회원정보가 모두 삭제됩니다. 작성하신 게시물은 삭제되지 않습니다.</div>
					<div>탈퇴 후 같은 계정으로 재가입 시 기존에 가지고 있던 적립금은 복원되지 않으며, 사용 및 다운로드했던
						쿠폰도 사용 불가능합니다.</div>
					<div>회원 탈퇴를 진행하시겠습니까?</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="memberDeleteBtnModal" onclick="javascript:modalMemberDelete()">탈퇴하기</button>
					<button type="button" class="btn btn-secondary" id="modalClose"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/order/orderList.js"></script>


	<script src="/resources/js/member/memberDelete.js"></script>

	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>

</body>
</html>