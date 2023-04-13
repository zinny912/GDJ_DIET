<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>

</head>
<body>
<!-- 안쓰는듯? -->
	<c:import url="../template/header.jsp"></c:import>

	<div class="container-fluid">
		<div class="row">
		
<div class="col-2 border border-primary" >
<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="/order/list">주문/배송</a>
  </li>
  <li class="nav-item">
  <c:if test="${sessionMember.studyNum eq null}">
  	<a class="nav-link" href="/study/studyList">수업</a>
  </c:if>
    <c:if test="${sessionMember.studyNum ne null}">
  	<a class="nav-link" href="/member/myPage">수업</a>
  </c:if>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="/member/update">개인정보</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="/member/delivery">배송지 설정</a>
  </li>

</ul>
</div>
			
	<div class="col-10">			
<!-- 긁 -->		

<div class="d-flex  justify-content-center">



<!-- oder반복 -->
        <div class="card card-1">

            <div class="card-body">
            
                <div class="row justify-content-between mb-3">
                    <div class="col-auto"> <h6 class="color-1 mb-0 change-color">Receipt</h6> </div>
                    <div class="col-auto  "> <small>Receipt Voucher : 1KAU9-84UIL</small> </div>
                </div>
                
                
<!-- study반복 -->





 
                
                
                <!-- order정보 -->
                <div class="row mt-4">
                    <div class="col">
                        <div class="row justify-content-between">
                            <div class="col-auto"><p class="mb-1 text-dark"><b>Order Details</b></p></div>
                            <div class="flex-sm-col text-right col"> <p class="mb-1"><b>Total</b></p> </div>
                            <div class="flex-sm-col col-auto"> <p class="mb-1">${orderDTO.price}</p> </div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"> <b>Discount</b></p> </div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">xx원</p></div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"><b>GST xx%</b></p></div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">xx</p></div>
                        </div>
                        <div class="row justify-content-between">
                            <div class="flex-sm-col text-right col"><p class="mb-1"><b>Delivery Charges</b></p></div>
                            <div class="flex-sm-col col-auto"><p class="mb-1">Free?</p></div>
                        </div>
                    </div>
                </div>
                <div class="row invoice ">
                    <div class="col"><p class="mb-1"> Invoice Number : ${orderDTO.orderNum}</p><p class="mb-1">Invoice Date : ${orderDTO.orderDate}</p></div>
                </div>
            </div>

        </div><!-- oder반복 -->
        
        
    </div>
<!-- 긁 -->
	</div>
	
        </div>
    </div>
   
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/js/order/orderList.js"></script>

	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>