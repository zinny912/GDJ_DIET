<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container-fluid">
		<!-- Heading Row-->
		<div class="row gx-4 gx-lg-5 align-items-center my-5 border border-secondary-subtle">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-0"
					src="/resources/images/${dto.healthMachineImgDTOs[0].oriName}"
					alt="..." />
			</div>
			<div class="col-lg-5 text-center">
				<h2><strong>${dto.machineName}</strong></h2>
				<h6 class="font-weight-light" style="text-decoration:line-through;">${dto.price}원</h6>
				<h1 class="font-weight-light" style="color:red">${dto.salePrice}원</h1>
				<hr class="my-hr2">
				<div class="text-center" id="optionSelect"
					data-machineNum="${dto.machineNum}">
					<h6 class="font-weight-light">
						옵션선택
					</h6>
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
					<input type="hidden" id="optId1" name="optId1">
					<input type="hidden" id="optId2" name="optId2">
					<input type="hidden" id="optId3" name="optId3">
					<input type="hidden" id="optId4" name="optId4">
					<!-- <a class="btn btn-primary" href="#">장바구니에 담기</a> -->
					<div id="btn">
					<button id="cartAdd" type="button" class="btn btn-primary">장바구니에
						담기</button>
					<button id="del" type="button" class="btn btn-danger">운동기구삭제</button>
				</div>
				</form>
			</div>
		</div>

	</div>

	<a href="optionAdd?machineNum=${dto.machineNum}">add</a>



	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/getOption.js"></script>
</body>
</html>