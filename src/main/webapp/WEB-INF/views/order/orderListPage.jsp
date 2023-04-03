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
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">
	<div class="row">
<c:import url="../member/memberHeader.jsp"></c:import>

    <div class="col-10">
      <div class="row">
      		
	<c:forEach items="${orderList}" var="orderDTO" varStatus="i">
<div class="orderList">




<div class="col-12">
	<div class="card">
	  <div class="card-body">
	    <h5 class="card-title">${orderDTO.orderDate} 주문</h5>

		<!-- detail page -->
		<c:forEach items="${orderDTO.orderDetailDTOs}" var="orderDetailDTO">
			<!-- detail card -->
			<div class="col-12">
				<div class="card">
				  <div class="card-body orderDetails" id="${orderDetailDTO.orderDetailNum}" data-orderDetailDTO="${orderDetailDTO.orderDetailNum}">
<%-- 				    <h5 class="card-title">${prime.recipient}</h5> --%>
			
<!-- 				    <h6 class="card-subtitle mb-2 text-muted">대표주소</h6> -->
				    
<%-- 				    <p class="card-text">${prime.address}</p> --%>
<%-- 				    <p class="card-text">${prime.recipientTel}</p> --%>
<%-- 				    <a href="./deliveryUpdate?id=${sessionMember.id}&addressNum=${prime.addressNum}" class="card-link">수정</a> --%>
				    
				  </div>
				</div>		
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



<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
<script src="/resources/js/order/orderList.js"></script>
</body>
</html>