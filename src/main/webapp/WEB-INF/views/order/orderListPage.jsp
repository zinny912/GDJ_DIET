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
		<div class="orderDetail ${orderDTO}" data-orderDTO="${orderDTO}">
		<!-- 여기에 deatailDTO를 보내고 상품DTO를 받아야함. -->
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