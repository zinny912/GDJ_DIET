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

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<form action="./cartCheckedUpdate" method="POST" enctype="multipart/form-data" id=frm>
	<section class="cart">
		<div class="cart__information">
			<ul>
				<li>얼리버드는 매월 마지막 날, 오후 8시 (4시간)</li>
				<li>얼리버드는 선착순이므로, 결제 도중 마감 될 수 있습니다.</li>
				<li>${sessionMember.id}님의장바구니</li>
			</ul>
		</div>
		<table class="cart__list">
			<thead>
				<tr>
					<td><input type="checkbox" value="" id="checkAll"></td>
					<td colspan="2">상품정보</td>
					<td>상품금액</td>
					<td>배송비</td>
				</tr>
			</thead>
			<tbody>

				<c:set var="totalCost" value="0" />

				<c:forEach items="${list}" var="dto">
					<c:if test="${not empty dto.studyNum }">
						<c:forEach items="${dto.studyDTOs}" var="studyDTO">
							<c:forEach items="${studyDTO.studyBoardFileDTOs}"
								var="studyFileDTO">
								<tr class="cart__list__detail">
									<td style="width: 2%;"><input type="checkbox"
										value="${dto.num}" class="checks" name="num"
										id="checkboxs"></td>
									<td style="width: 13%;"><img
										src="../resources/upload/study/${studyFileDTO.fileName}"
										alt="magic mouse"></td>
									<td style="width: 41%;"><span
										class="cart__list__studyname">${studyDTO.studyName}</span>
										<div class=" price">${studyDTO.studyCost}원</div>
										<div class=" price">스터디 기간:
											${studyDTO.studyStartPeriod}~${studyDTO.studyEndPeriod}</div></td>
									<td style="width: 29%;"><span class="price">${studyDTO.studyCost}원</span></td>
									<td style="width: 29%;">무료</td>
								</tr>
								<c:set var="totalCost" value="${totalCost + studyDTO.studyCost}" />
							</c:forEach>
						</c:forEach>
					</c:if>
				</c:forEach>
				</tbody>
				<tfoot>
				   <tr>
                        <td colspan="3">
                        	<button id="delete" type="button" class="cart__list__optionbtn" onclick="checkDelete()">스터디 삭제하기</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
				</tfoot>

		 </table>
			
		
		<!-- machineCart -->
		<table class="cart__list">
			<thead>
				<tr>
					<td><input type="checkbox" value="" id="checkAll"></td>
					<td colspan="2">상품정보</td>
					<td>상품금액</td>
					<td>배송비</td>
				</tr>
			</thead>
			<tbody>

				<%-- <c:set var="totalCost" value="0" /> --%>

				<c:forEach items="${list}" var="dto">
					<c:if test="${not empty dto.realMachineNum }">
						<%-- <c:forEach items="${dto.studyDTOs}" var="studyDTO"> --%>
							<c:forEach items="${dto.healthMachineDTO.healthMachineImgDTOs}"
								var="machineFileDTO">
								<tr class="cart__list__detail">
									<td style="width: 2%;"><input type="checkbox"
										value="${dto.num}" class="checks" name="checkedItems"
										id="checkboxs"></td>
									<td style="width: 13%;"><img
										src="/resources/images/${dto.healthMachineDTO.healthMachineImgDTOs[0].fileName}"
										alt="magic mouse"></td>
									<td style="width: 41%;"><span
										class="cart__list__machineName">${dto.healthMachineDTO.machineName}</span>
										<div class=" price">${dto.cartPrice}원</div>
										<div class=" price">옵션 정보</div>
										<c:if test="${not empty dto.healthMachineDTO.option1 }">
										<div>${dto.healthMachineDTO.option1 } : ${dto.realHealthMachineDTO.optName1}</div>
										</c:if>
										<c:if test="${not empty dto.healthMachineDTO.option2 }">
										<div>${dto.healthMachineDTO.option2 } : ${dto.realHealthMachineDTO.optName2}</div>
										</c:if>
										<c:if test="${not empty dto.healthMachineDTO.option3 }">
										<div>${dto.healthMachineDTO.option3 } : ${dto.realHealthMachineDTO.optName3}</div>
										</c:if>
										<c:if test="${not empty dto.healthMachineDTO.option4 }">
										<div>${dto.healthMachineDTO.option4 } : ${dto.realHealthMachineDTO.optName4}</div>
										</c:if>
										
									</td>
									<td style="width: 29%;"><span class="price">원</span></td>
									<td style="width: 29%;">무료</td>
								</tr>
								<c:set var="totalCost" value="${totalCost + studyDTO.studyCost}" />
							</c:forEach>
						<%-- </c:forEach> --%>
					</c:if>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<%-- <form action="./cartDelete" id="frm" method="post">
                        	<c:forEach items="${list}" var="dto">
								<input type="hidden" name="num" value="${dto.num}">
							</c:forEach> --%>
						<button id="delete" type="submit" class="cart__list__optionbtn"
							onclick="checkDelete()">스터디 삭제하기</button> <!-- </form> -->
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot>
		</table>

		
		
		<!-- --------------------합계----------------- -->
		<table>
			<!-- <thead>
                	<tr class="my-5">
                		<th>
                		총 주문 상품
                		</th>
                	</tr>
                </thead> -->
			<tbody>
				<tr>
					<td style="text-align: center"><span class="price">총합계:${totalCost}원</span></td>
				</tr>
			</tbody>
		</table>


			<div class="cart__mainbtns">
				<c:if test="${list ne null}">
					<button class="cart__bigorderbtn right btn btn-primary"
						id="submitbtn" type="button">주문하기</button>
				</c:if>
			</div>
		</section>
	</form>
	
	<script type="text/javascript" src="/resources/js/cartPayment.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>