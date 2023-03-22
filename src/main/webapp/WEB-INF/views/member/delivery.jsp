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
<c:import url="../template/header.jsp"></c:import>
<input type="hidden" id="originId" value="${sessionScope.sessionMember.id}">

<div class="container-fluid">
	<div class="row">
	<c:import url="./memberHeader.jsp"></c:import>
	
	
    <div class="col-10">
      <div class="row">


<c:forEach items="${deliveryList}" var="i">
<div class="col-12">
	<div class="card">
	  <div class="card-body">
	    <h5 class="card-title">${i.recipient}</h5>
	    
	    <c:if test="${sessionMember.address eq i.address}">
	    <h6 class="card-subtitle mb-2 text-muted">대표주소</h6>
	    </c:if>
	    
	    <p>나오니? ${i.deliveryNum}</p>
	    
	    <p class="card-text">${i.address}</p>
	    <p class="card-text">${i.recipientTel}</p>
	    <a href="./deliveryUpdate?id=${sessionMember.id}&deliveryNum=${i.deliveryNum}" class="card-link">수정</a>
	    <a href="./deliveryDelete?deliveryNum=${i.deliveryNum}" class="card-link">삭제</a>
	  </div>
	</div>		
</div>
</c:forEach>

<div class="col-12">
	<button type="button" onclick="location.href='./deliveryNew';">추가</button>
</div>

      </div>
    </div>	
	
	
	</div>
</div>


<c:import url="../template/footer.jsp"></c:import>

<c:import url="../template/common_js.jsp"></c:import>
<script src="/resources/js/member/memberUpdate.js"></script>
<script src="/resources/js/member/memberAgree.js"></script>

</body>
</html>