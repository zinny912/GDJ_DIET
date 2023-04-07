<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>

 <style>
 .my-hr2 {
 border: 0;
 height: 2px;
 background: #ccc;
 }

 </style>

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container px-4 px-lg-5">

		<div
			class="row gx-4 gx-lg-5 align-items-center my-3 border border-secondary-subtle" >
			<div class="col-lg-7 d-flex justify-content-center align-items-center">
		  <img class="img-fluid rounded mb-4 mb-lg-0"
		    src="/resources/images/${dto.healthMachineImgDTOs[0].fileName}"
		    alt="..." />
			</div>
			<div class="col-lg-5 text-center">
				<h2>
					<strong>${dto.machineName}</strong>
				</h2>
				<h6 class="font-weight-light" style="text-decoration: line-through;">${dto.price}원</h6>
				<h1 class="font-weight-light" style="color: red">${dto.salePrice}원</h1>
				<hr class="my-hr2">
				<div class="text-center" id="optionSelect"
					data-machineNum="${dto.machineNum}">
					<h6 class="font-weight-light">옵션선택</h6>
					<div class="dropdown" id="opt1" data-optName="${dto.option1 }">

						<button class="btn dropdown-toggle" id="optbtn1">${dto.option1}을
							선택해 주세요</button>
						<div class="dropdown-menu">
							<ul style="list-style: none;" id='optSelect1'>

							</ul>
						</div>
					</div>
					<div class="dropdown" id="opt2" data-optName="${dto.option2 }"></div>
					<div class="dropdown" id="opt3" data-optName="${dto.option3 }"></div>
					<div class="dropdown" id="opt4" data-optName="${dto.option4 }"></div>
				</div>
				<br>
				<form id="frm">
					<input type="hidden" name="machineNum" value="${dto.machineNum}">
					<!-- <input type="hidden" id="optId1" name="optId1"> <input
						type="hidden" id="optId2" name="optId2"> <input
						type="hidden" id="optId3" name="optId3"> <input
						type="hidden" id="optId4" name="optId4"> -->
					<!-- <a class="btn btn-primary" href="#">장바구니에 담기</a> -->
					<div id="btn">
						<button id="cartAdd" type="button" class="btn btn-outline-primary"
							disabled="disabled">장바구니에 담기</button>
						<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
							<button id="del" type="button" class="btn btn-danger">운동기구삭제</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	
	<div style="text-align: right;">
	  <a href="optionAdd?machineNum=${dto.machineNum}" class="btn btn-primary" style="margin-right: 10px;">add</a>
	  <a href="update?machineNum=${dto.machineNum}" class="btn btn-primary">update</a>
	</div>

	  <div class="col-12 w-100 text-center">
			        <div class="row">
			        <div class="col-md-4">
			          <div class="nav-link" id="machineQnaInfo" style="cursor: pointer">상세정보</div>
			        </div>
			        <div class="col-md-4">
			         <div class="nav-link" id="machineReviewList" data-review-machineNum="${dto.machineNum}" style="cursor: pointer">구매평</div>
			        </div>
			        <div class="col-md-4">
			          <div class="nav-link" id="machineQnaList" data-qna-machineNum="${dto.machineNum}" style="cursor: pointer">Q&amp;A</div>
			        </div>
			        <hr class="my-hr2">
			        </div>
  		</div>
  		<div class="my-5" id="machineListResult">
	  		<c:forEach items="${dto.healthMachineImgDTOs}" var="images" begin="1">
	  			<img class="img-fluid rounded mb-4 mb-lg-0" style="width=100%;" src="/resources/images/${images.fileName}" alt="..." />
	  		</c:forEach>
  			</div>
	</div>
	
			

	


	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/getOption.js"></script>
	<script src="/resources/js/machineBoard.js"></script>
</body>
</html>