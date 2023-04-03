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
          <p class="info"><strong>${sessionMember.names}</strong> </p>
          <p class="info"><strong>${sessionMember.phone}</strong> </p>
          <p class="info"><strong>${sessionMember.email}</strong></p>
          <p class="info"><strong>${sessionMember.address}</strong> </p>
        </div> 
      </div>
      <div class="col-md-6">
        <div class="bordered">
          <h3 class="text-center mb-4">주문 요약</h3>
          <c:set var="totalCost" value="0" />
          <c:set var="totalCost" value="${totalCost + studyDTO.studyCost}" />
          <p class="info"><strong>총합계:${totalCost}원</strong> </p>
        </div>
        
      </div>
    </div>
  </div>
        <div class="cart__mainbtns">
        	<form action="/cart/payment" id="frm">
            <button class="cart__bigorderbtn right btn btn-primary" type="submit">결제하기</button>
        	</form>
        </div>
    </div>

<script>
function checkDelete(){
	  let check = window.confirm("정말 삭제 하시겠습니까?");
	  if(check){
	    let checkedItems = [];
	    $('input[name="checkedItems"]:checked').each(function() {
	      checkedItems.push($(this).val());
	    });
	    
	    $.ajax({
	      type: 'POST',
	      url: './cartDelete',
	      traditional:true,
	      data: { checkedItems: checkedItems },
	      success: function() {
	        location.reload();
	        // 처리 결과에 따라 적절한 동작 수행
	      },
	      error: function(xhr, status, error) {
	        console.log(xhr.responseText);
	        console.log(checkedItems);
	        // 에러 처리
	      }
	    });
	  }
	}
</script>

<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>