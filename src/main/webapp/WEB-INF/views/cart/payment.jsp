<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>구디다이어트</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:import url="../template/common_css.jsp"></c:import>
<link href="/resources/css/cartList.css" rel="stylesheet" />
<script src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
.bordered {
	border: 3px solid #ddd;
	border-radius: 10px;
	padding: 30px;
	margin: 10px;
}

.info {
	font-size: 14px;
	font-weight: bold;
	color: lightslategrey;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="cart">
		<div class="text-center my-3">
			<h3>결제하기</h3>
		</div>
		<table class="cart__list">
			<thead>
				<tr>
					<td></td>
					<td colspan="2">상품정보</td>
					<td>상품금액</td>
					<td>배송비</td>
				</tr>
			</thead>
			<tbody>

				

				<c:forEach items="${list}" var="dto">
					<c:forEach items="${dto.studyDTOs}" var="studyDTO">
						<c:forEach items="${studyDTO.studyBoardFileDTOs}"
							var="studyFileDTO">
							<tr class="cart__list__detail">
								<td style="width: 2%;"></td>
								<td style="width: 13%;"><img
									src="../resources/upload/study/${studyFileDTO.fileName}"
									alt="magic mouse"></td>
								<td style="width: 41%;"><span class="cart__list__studyname">${studyDTO.studyName}</span>
									<div class=" price">${studyDTO.studyCost}원</div>
									<div class=" price">스터디 기간:
										${studyDTO.studyStartPeriod}~${studyDTO.studyEndPeriod}</div></td>
								<td style="width: 29%;"><span class="price">${studyDTO.studyCost}원</span></td>
								<td style="width: 29%;">무료</td>
							</tr>
							
						</c:forEach>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		<!-- machineCart -->
		<table class="cart__list" id="cartMachineList">
			<thead>
				<tr>
					<!-- <td><input type="checkbox" value="" id="machineCheckAll"
						class="checkAll" data-this-check="machineCheckAll"></td> -->
					<td></td>
					<td colspan="2">상품정보</td>
					<td>상품금액</td>
					<td>개수</td>
				</tr>
			</thead>
			<tbody>


				<c:forEach items="${list}" var="dto">
					<c:if test="${not empty dto.realMachineNum }">
						<%-- <c:forEach items="${dto.studyDTOs}" var="studyDTO"> --%>
						<c:forEach items="${dto.healthMachineDTO.healthMachineImgDTOs}"
							var="machineFileDTO">
							<tr class="cart__list__machine__detail">
								<%-- <td style="width: 2%;"><input type="checkbox"
									value="${dto.num}" class="checks" name="checkedItems"
									id="checkboxs"> <input type="hidden"
									value="${dto.num }" name="cartNum"></td> --%>
								<td style="width: 15%;"><img
									src="/resources/images/${dto.healthMachineDTO.healthMachineImgDTOs[0].fileName}"
									alt="magic mouse"></td>
								<td style="width: 59%; text-align: center; " colspan="2"><span
									class="cart__list__studyname">${dto.healthMachineDTO.machineName}</span>

									<div class="price">옵션 정보</div> <c:if
										test="${not empty dto.healthMachineDTO.option1 }">
										<div>${dto.healthMachineDTO.option1 }:
											${dto.realHealthMachineDTO.optName1}</div>
									</c:if> <c:if test="${not empty dto.healthMachineDTO.option2 }">
										<div>${dto.healthMachineDTO.option2 }:
											${dto.realHealthMachineDTO.optName2}</div>
									</c:if> <c:if test="${not empty dto.healthMachineDTO.option3 }">
										<div>${dto.healthMachineDTO.option3 }:
											${dto.realHealthMachineDTO.optName3}</div>
									</c:if> <c:if test="${not empty dto.healthMachineDTO.option4 }">
										<div>${dto.healthMachineDTO.option4 }:
											${dto.realHealthMachineDTO.optName4}</div>
									</c:if></td>
								<!-- <td></td> -->
								<td style="width: 13%;">
									<%-- <span class="price" style="text-decoration: line-through;">${dto.healthMachineDTO.price}원</span> --%>
									<span class="price cartPrice" style="font-size: 15px"
									id="cartPrice">${dto.cartPrice*dto.count}</span>원

								</td>
								<td style="width: 13%;"><span class="price machineval"
									style="font-size: 15px;" id="count">${dto.count}</span>
									</td>
							</tr>
							
						</c:forEach>
						<%-- </c:forEach> --%>
					</c:if>
				</c:forEach>
			</tbody>
		</table>


		<div class="container my-3">
			<div class="row">
				<div class="col-md-6">
					<div class="bordered">
						<h3 class="text-center mb-4">주문자 정보</h3>
						<p class="info" id="ordererName">
							<strong>${sessionMember.names}</strong>
						</p>
						<p class="info" id="ordererPhone">
							<strong>${sessionMember.phone}</strong>
						</p>
						<p class="info" id="ordererEmail">
							<strong>${sessionMember.email}</strong>
						</p>
						<p class="info" id="ordererAddress">
							<strong>${sessionMember.address}</strong>
						</p>
						<form action="/member/deliveryNew" method="get">
							<input type="hidden" name="email" value="${sessionMember.email}">
							<button type="submit" class="btn btn-primary">배송지 추가</button>
						</form>
					</div>
				</div>
				<div class="col-md-6">
					<div class="bordered my-5">
						<h3 class="text-center mb-2">주문 요약</h3>
						
						<p class="info">
							<strong>총합계:${totalCost}원</strong>
						</p>
						<p class="info">
							<strong>배송비 무료</strong>
						</p>
					</div>

				</div>
			</div>
		</div>
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn right btn btn-primary" type="submit"
				onclick="checkPayment()">결제하기</button>
		</div>
	</div>



	<script type="text/javascript" src="/resources/js/payment.js"></script>
	<!-- <script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>