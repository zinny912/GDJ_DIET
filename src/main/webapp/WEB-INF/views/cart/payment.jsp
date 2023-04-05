<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 <title>구디다이어트</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 <link href="/resources/css/cartList.css" rel="stylesheet"/>

  <style>
    .bordered {
      border: 3px solid #ddd;
      border-radius: 10px;
      padding: 30px;
      margin: 10px;
    }
    .info {
    	font-size: 14px;
    	font-weight: bold;
    	color: lightslategrey;
    }
  </style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

    <div class="cart">
        <div class="text-center my-3">
            <h3>결제하기</h3>
        </div>
        <table class="cart__list">
                <thead>
                    <tr>
                        <td></td>
                        <td colspan="2">상품정보</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                	
                	<c:set var="totalCost" value="0" />

				<c:forEach items="${list}" var="dto">
					<c:forEach items="${dto.studyDTOs}" var="studyDTO">
						<c:forEach items="${studyDTO.studyBoardFileDTOs}"
							var="studyFileDTO">
							<tr class="cart__list__detail">
								<td style="width: 2%;"></td>
								<td style="width: 13%;"><img
									src="../resources/upload/study/${studyFileDTO.fileName}"
									alt="magic mouse"></td>
								<td style="width: 41%;"><span class="cart__list__studyname">${studyDTO.studyName}</span>
									<div class=" price">${studyDTO.studyCost}원</div>
									<div class=" price">스터디 기간:
										${studyDTO.studyStartPeriod}~${studyDTO.studyEndPeriod}</div></td>
								<td style="width: 29%;"><span class="price">${studyDTO.studyCost}원</span></td>
								<td style="width: 29%;">무료</td>
							</tr>
							<c:set var="totalCost" value="${totalCost + studyDTO.studyCost}" />
						</c:forEach>
					</c:forEach>
				</c:forEach>
				</tbody>
		 </table>
		 

<div class="container my-3">
    <div class="row">
      <div class="col-md-6">
        <div class="bordered">
          <h3 class="text-center mb-4">주문자 정보</h3>
          <p class="info" id="ordererName"><strong>${sessionMember.names}</strong> </p>
          <p class="info" id="ordererPhone"><strong>${sessionMember.phone}</strong> </p>
          <p class="info" id="ordererEmail"><strong>${sessionMember.email}</strong></p>
          <p class="info" id="ordererAddress"><strong>${sessionMember.address}</strong> </p>
        </div> 
      </div>
      <div class="col-md-6">
		<div class="bordered my-5">
			<h3 class="text-center mb-2">주문 요약</h3>
			 <c:set var="totalCost" value="0" />
			 <c:forEach items="${list}" var="dto">
				 <c:forEach items="${dto.studyDTOs}" var="studyDTO">
					<c:set var="totalCost" value="${totalCost + studyDTO.studyCost}" />
				</c:forEach>
			</c:forEach>
			<p class="info"><strong>총합계:${totalCost}원</strong> </p>
			<p class="info"><strong>배송비 무료</strong> </p>
        </div>
        
      </div>
    </div>
  </div>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn right btn btn-primary" type="submit" onclick="checkPayment()">결제하기</button>
        </div>
    </div>

<script>

function checkPayment(){
	IMP.init("imp85424567");
	IMP.request_pay({
    pg : 'html5_inicis.INIBillTst', //테스트 시 html5_inicis.INIpayTest 기재 
    pay_method : 'card',
    merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
    name : '결제:결제테스트',
    amount : 1004,
    buyer_email : $('#ordererEmail').text().trim(),
    buyer_name : $('#ordererEmail').text().trim(),
    buyer_tel : $('#ordererPhone').text().trim(),   //필수 파라미터 입니다.
    buyer_addr : $('#ordererName').text().trim(),
    buyer_postcode : '123-456',
    m_redirect_url : '/order/list',
    escrow : true, //에스크로 결제인 경우 설
    bypass : {
        acceptmethod : "noeasypay" // 간편결제 버튼을 통합결제창에서 제외(PC)
        //P_RESERVED: "noeasypay=Y"  // 간편결제 버튼을 통합결제창에서 제외(모바일) 
        //cceptmethod: 'cardpoint'  // 카드포인트 사용시 설정(PC) 
      	// P_RESERVED : 'cp_yn=Y'     // 카드포인트 사용시 설정(모바일) 
    },
    period : {
       from : "20200101", //YYYYMMDD
       to : "20201231"   //YYYYMMDD
    }
}, function(rsp) { // callback 로직
	 if (rsp.success) {
		// 결제 성공 시 로직
		 	console.log("success")
	      } else {
	        // 결제 실패 시 로직
	        console.log("fail")
	      }
	    })
};
</script>

<script src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- <script src="https://cdn.iamport.kr/v1/iamport.js"></script> -->
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>