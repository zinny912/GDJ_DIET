<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">
	<div class="row">
		
<div class="orderList">
	
	<c:forEach items="${orderList}" var="orderDTO" varStatus="i">
	<div class="exTable_orderSetOne">
		<div class="orderStatus">
			처리상태: ${orderDTO.orderStatus}
		</div>
		<div class="orderDetail">
		<!-- 여기에 deatailDTO를 보내고 상품DTO를 받아야함. -->

<div id="orderDTO_${i.index}" data-detail="${orderDTO}">
		



<!-- ajax융합 -->
<c:if test="${orderDetailDTO.orderNum eq orderDTO.orderNum}">

	<div id="orderDetailDTO_${j.index}" data-detail="${orderDetailDTO}">
		
	</div>
	
</c:if>
<!-- ajax융합 -->





<%-- 			<c:forEach items="${orderDetailDTOs}" var="orderDetailDTO"> --%>
<%-- 				<c:forEach items="${studyDTOs}" var="studyDTO"> --%>
<%-- 					<c:if test="${orderDetailDTO.studyNum eq studyDTO.studyNum}"> --%>
<%-- 						수업이름: ${studyDTO.studyName} --%>
<%-- 						가격: ${studyDTO.studyCost} --%>
<%-- 					</c:if> --%>
<%-- 				</c:forEach> --%>

<%-- 				<c:forEach items="${healthMachineDTOs}" var="healthMachineDTO"> --%>
<%-- 					<c:if test="${healthMachineDTO.machineNum eq orderDetailDTO.machineNum}"> --%>
<%-- 						상품정보: ${healthMachineDTO.machineName},  --%>
<%-- 						<c:forEach items="${realHealthMachineDTOs}" var="realHealthMachineDTO"> --%>
<%-- 							<c:if test="${realHealthMachineDTO.machineNum eq healthMachineDTO.machineNum}"> --%>
								
<%-- 							</c:if> --%>
<%-- 						</c:forEach> --%>
<%-- 					</c:if> --%>
<%-- 				</c:forEach> --%>
<%-- 			</c:forEach> --%>
			
			
</div>			

		</div>	
	</div>

	</c:forEach>
	
</div>
		
	</div>
</div>

<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
<script src="/resources/js/order/orderList.js"></script>
</body>
</html>