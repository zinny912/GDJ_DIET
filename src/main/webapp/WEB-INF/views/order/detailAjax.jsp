<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 이제 ajax 필요 없음. -->
			<c:forEach items="${cartDTOs}" var="cartDTO">
				<c:forEach items="${studyDTOs}" var="studyDTO">
				<c:if test="${cartDTO.studyNum eq studyDTO.studyNum}">

						<div class="card order_number">
						  <div class="card-body">
								<a href="/study/studyDetail?studyNum=${cartDTO.studyNum}" class="moveProduct">
								    <img src="/resources/images/${studyDTO.studyBoardFileDTOs[0].fileName}" width="78" height="78" class="product-img img">
								    </a>
								    <span class="option-item-name" style="font-size: 25px">${studyDTO.studyName}</span>

								    <div>
								    <button type="button" class="btn btn-secondary btn-addCart" data-addCart-price="${cartDTO.cartPrice}" data-addCart="${studyDTO.studyNum}"  data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="Top popover"
								    >장바구니 담기</button>
								    <button type="button" class="btn btn-secondary">리뷰 작성하기</button>
								    </div>
								
								<h5 class="card-title">${studyDTO.studyName}</h5>
						  </div>
	
					</div>		
				</c:if></c:forEach>
				
				<c:forEach items="${healthMachineDTOs}" var="healthMachineDTO">
					<c:forEach items="${healthMachineDTO.realHealthMachineDTOs}" var="realHealthMachineDTO">

				<c:if test="${cartDTO.realMachineNum eq realHealthMachineDTO.realMachineNum}">


						<div class="card">
						  <div class="card-body">

<a href="/healthMachine/detail?machineNum=${healthMachineDTO.machineNum}" class="moveProduct">
<img src="/resources/images/${healthMachineDTO.healthMachineImgDTOs[0].fileName}" width="78" height="78" class="product-img img">
</a>
<span class="option-item-name" style="font-size: 25px">${HealthMachineDTO.machineName}, ${realHealthMachineDTO.optName1}, ${realHealthMachineDTO.optName2}, ${realHealthMachineDTO.optName3}, ${realHealthMachineDTO.optName4}
</span> <!-- 상품세부정보삽입 -->
<span>${cartDTO.count}개</span>

<div>
<button type="button" class="btn btn-secondary btn-addCart-machine to-cart-popper" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="Top popover"
	data-addCart="${cartDTO.realMachineNum}" data-addCart-price="${cartDTO.cartPrice}" 
	data-addCart-machineNum="${realHealthMachineDTO.machineNum}" data-addCart-op1="${realHealthMachineDTO.optId1}" data-addCartop-2="${realHealthMachineDTO.optId2}" data-addCartop-3="${realHealthMachineDTO.optId3}" data-addCartop-4="${realHealthMachineDTO.optId4}"
	>장바구니 담기</button>
<button type="button" class="btn btn-secondary">리뷰 작성하기</button>



</div>

						  </div>
						</div>		
	
				</c:if></c:forEach></c:forEach>
				
			</c:forEach>

