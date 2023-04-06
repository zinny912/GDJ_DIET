<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트</title>

	<style type="text/css">
		.redResult{
			color: red;
		}
		.blueResult{
			color: blue;
		}
/* 		.member__input-guide-area_set{ */
/* 			color: gray; */
/* 			font-size: 12px; */
/* 		} */
	</style>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"> -->
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:if test="${popUp eq null}">
<c:import url="../template/header.jsp"></c:import>
</c:if>
<input type="hidden" id="originId" value="${sessionScope.sessionMember.id}">

<div class="container-fluid">
	<div class="row">
	
<c:if test="${popUp eq null}">	
	<c:import url="./memberHeader.jsp"></c:import>
</c:if>	
	
    <div class="col-10">
      <div class="row toPayment-mother">


<!-- 맨 앞에 출력하려면 따로 -->
<c:forEach items="${deliveryList}" var="prime">
<c:if test="${sessionMember.address eq prime.address}">
<div class="col-12">
	<div class="card">
	  <div class="card-body">
	  	<div hidden="" class="addressNum" data-addressNum="${prime.addressNum}"></div>
	    <h5 class="card-title recipient" data-recipient="${prime.recipient}">${prime.recipient}</h5>

	    <h6 class="card-subtitle mb-2 text-muted">대표주소</h6>
	    
	    <p class="card-text address" data-address="${prime.address}">주소:	${prime.address}</p>
	    <p class="card-text recipientTel" data-recipientTel="${prime.recipientTel}">연락처:		${prime.recipientTel}</p>
	    <a href="./deliveryUpdate?id=${sessionMember.id}&addressNum=${prime.addressNum}" class="card-link">수정</a>
	    
	  </div>
	</div>		
</div>
</c:if></c:forEach>

<c:forEach items="${deliveryList}" var="i">
<c:if test="${sessionMember.address ne i.address}">
<div class="col-12">
	<div class="card">
	  <div class="card-body">
	    <h5 class="card-title recipient" >${i.recipient}</h5>

	    <p class="card-text address" >주소:	${i.address}</p>
	    <p class="card-text recipientTel" >연락처:	${i.recipientTel}</p>
	    <a href="./deliveryUpdate?id=${sessionMember.id}&addressNum=${i.addressNum}" class="card-link">수정</a>

	    <a href="./deliveryDelete?addressNum=${i.addressNum}" class="card-link">삭제</a>

		<c:if test="${popUp ne null}">
			<button class="btn btn-scondary toPayment" data-addressNum="${i.addressNum}" data-recipient="${i.recipient}" data-address="${i.address}" data-recipientTel="${i.recipientTel}" 
			>선택</button>
			<a href="./deliveryDelete?addressNum=${i.addressNum}" class="">선택2</a>
		</c:if>
	    
	  </div>
	</div>		
</div>
</c:if></c:forEach>

<div class="col-12">
	<button type="button" onclick="location.href='./deliveryNew'">추가</button>
</div>

      </div>
    </div>	
	
	
	</div>
</div>

<c:import url="../template/common_js.jsp"></c:import>
<c:if test="${popUp eq null}">
<c:import url="../template/footer.jsp"></c:import>
</c:if>
<script src="/resources/js/member/memberUpdate.js"></script>
<script src="/resources/js/member/memberAgree.js"></script>
<script src="/resources/js/member/deliveryToPayment.js"></script>
</body>
</html>