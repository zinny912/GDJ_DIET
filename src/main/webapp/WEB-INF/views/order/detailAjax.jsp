<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


			<c:forEach items="cartDTOs" var="cartDTO">
				<c:forEach items="${studyDTOs}" var="studyDTO">
				<c:if test="${cartDTO.studyNum eq studyDTO.studyNum}">

						<div class="card">
						  <div class="card-body">
								<a href="/study/studyDetail?studyNum=${cartDTO.studyNum}" class="moveProduct">
								    <img src="/resources/images/${studyDTO.studyBoardFileDTOs[0].fileName}" width="78" height="78" class="product-img img">
								    </a>
								    <span class="option-item-name" style="font-size: 25px">${studyDTO.studyName}</span>
								    <div>
								    <button type="button" class="btn btn-secondary btn-addCart" data-addCart="${studyDTO.studyNum}"  data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="Top popover"
								    >장바구니 담기</button>
								    <button type="button" class="btn btn-secondary">리뷰 작성하기</button>
								    </div>
								
								<h5 class="card-title">${studyDTO.studyName}</h5>
						  </div>
	
					</div>		
				</c:if></c:forEach>
				
				<c:forEach items="${HealthMachineDTOs}" var="HealthMachineDTO">
					<c:forEach items="${HealthMachineDTO.realHealthMachineDTOs}" var="RealHealthMachineDTO">
				<c:if test="${cartDTO.realMachineNum eq RealHealthMachineDTO.realMachineNum}">


						<div class="card">
						  <div class="card-body">

<a href="/healthMachine/detail?machineNum=${cartDTO.realMachineNum}" class="moveProduct">
<img src="/resources/images/${realHealthMachineDTO.healthMachineImgDTOs[0].fileName}" width="78" height="78" class="product-img img">
</a>
<span class="option-item-name" style="font-size: 25px">${HealthMachineDTO.machineName}, ${realHealthMachineDTO.optName1}, ${realHealthMachineDTO.optName2}, ${realHealthMachineDTO.optName3}, ${realHealthMachineDTO.optName4}
</span> <!-- 상품세부정보삽입 -->
<div>
<button type="button" class="btn btn-secondary btn-addCart to-cart-popper" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="Top popover"
	data-addCart="${cartDTO.machineNum}">장바구니 담기</button>
<button type="button" class="btn btn-secondary">리뷰 작성하기</button>
</div>

						  </div>
						</div>		
	
				</c:if></c:forEach></c:forEach>
				
			</c:forEach>

