<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>구디다이어트 장바구니</title>
<meta charset="UTF-8">

<c:import url="../template/common_css.jsp"></c:import>
<link href="/resources/css/cartList.css" rel="stylesheet" />

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<form action="./cartCheckedUpdate" method="POST" enctype="multipart/form-data" id=frm>
	<section class="cart">
	<c:set var="totalCost" value="0" />
		<div class="cart__information">
			<ul>
				<li>얼리버드는 매월 마지막 날, 오후 8시 (4시간)</li>
				<li>얼리버드는 선착순이므로, 결제 도중 마감 될 수 있습니다.</li>
				<li>${sessionMember.id}님의장바구니</li>
			</ul>
		</div>
		<table class="cart__list" id="cartStudyList">
			<thead>
				<tr>
					<td><input type="checkbox" value="" id="studyCheckAll" class="checkAll" data-this-check="studyCheckAll"></td>
					<td colspan="2">상품정보</td>
					<td>상품금액</td>
					<td>배송비</td>
				</tr>
			</thead>
			<tbody>

				

				<c:forEach items="${list}" var="dto">
					<c:if test="${not empty dto.studyNum }">
						<c:forEach items="${dto.studyDTOs}" var="studyDTO">
							<c:forEach items="${studyDTO.studyBoardFileDTOs}"
								var="studyFileDTO">
								<tr class="cart__list__detail">
									<td style="width: 2%;"><input type="checkbox" value="${dto.num}" class="checks" name="checkedItems" id="checkboxs">
									
									</td>
									<td style="width: 13%;"><img
										src="../resources/upload/study/${studyFileDTO.fileName}"
										alt="magic mouse"></td>
									<td style="width: 41%;"><span
										class="cart__list__studyname">${studyDTO.studyName}</span>
										<div class=" price">${studyDTO.studyCost}원</div>
										<div class=" price">스터디 기간:
											${studyDTO.studyStartPeriod}~${studyDTO.studyEndPeriod}</div></td>
									<td style="width: 29%;"><span class="price cartPrice" id="cartPrice">${studyDTO.studyCost}</span>원</td>
									<td style="width: 29%;">무료</td>
								</tr>
								<%-- <c:set var="totalCost" value="${totalCost + studyDTO.studyCost}" /> --%>
							</c:forEach>
						</c:forEach>
					</c:if>
				</c:forEach>
					<c:if test="${empty list}">
						<div style="text-align: center; margin-top: 50px;">
							<img src="/resources/images/cart.png" width="200px">
							<div style="font-size: 1.5em; margin-top: 20px;">장바구니가
								비어있습니다.</div>
						</div>
					</c:if>
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
		<table class="cart__list" id="cartMachineList">
			<thead>
				<tr>
					<td>
					<input type="checkbox" value="" id="machineCheckAll"  class="checkAll" data-this-check="machineCheckAll">
					
					</td>
					<td ></td>
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
								<tr class="cart__list__machine__detail" >
									<td style="width: 2%;">
									<input type="checkbox"
										value="${dto.num}" class="checks" name="checkedItems" 
										id="checkboxs">
										<input type="hidden" value="${dto.num }" name="cartNum">
									
										
										</td>
									<td style="width: 13%;"><img
										src="/resources/images/${dto.healthMachineDTO.healthMachineImgDTOs[0].fileName}"
										alt="magic mouse"></td>
									<td style="width: 59%;" colspan="2"><span
										class="cart__list__studyname">${dto.healthMachineDTO.machineName}</span>
										
										<div class="price">옵션 정보</div>
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
									<!-- <td></td> -->
									<td style="width: 13%;">
									<%-- <span class="price" style="text-decoration: line-through;">${dto.healthMachineDTO.price}원</span> --%>
									<span class="price cartPrice" style="font-size: 15px" id="cartPrice" >${dto.cartPrice*dto.count}</span>원
									
									</td>
									<td style="width: 13%;">
									<span class="price machineval" style="font-size: 15px;" id="count">${dto.count}</span>
									<input class="machineCount" type="hidden" value="" name="count">
									<div class="countBtn">
										<button type="button" class="btn btn-primary plusbtn" style="border:none">+</button>
										<button type="button" class="btn btn-primary minusbtn" style="border:none">-</button>
									</div>
									</td>
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
						<button id="delete" type="button" class="cart__list__optionbtn"
							onclick="checkDelete()">상품삭제하기</button> <!-- </form> -->
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot>
		</table>

		
		
		<!-- --------------------합계----------------- -->
		<c:set var="deliveryPrice" value="0" />
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
					<td style="text-align: center">상품가격 : <span class="price" id="totalPrice">${totalCost}</span>원 + 배송비 : 
					<c:choose>
						<c:when test="${deliveryPrice != 0}">
							<span class="price" id="deliveryPrice" data-deliveryPrice=${deliveryPrice }>${deliveryPrice}원</span>
						</c:when>
						<c:otherwise>
						<span class="price" id="deliveryPrice" data-deliveryPrice=${deliveryPrice }>무료</span>
						</c:otherwise>
					</c:choose>
					
					</td>
					<td style="text-align: center" class="cart__list__studyname">총 합계 : <span class="price" id="totalCost"></span>
					<input id="p" type="hidden" value="" name="totalCost">
					</td>
				</tr>
			</tbody>
		</table>


			<div class="cart__mainbtns">
				<c:if test="${list ne null}">
					<button  class="cart__bigorderbtn right btn btn-primary"
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