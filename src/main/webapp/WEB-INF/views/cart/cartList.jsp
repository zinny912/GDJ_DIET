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

</head>
<body>
<c:import url="../template/header.jsp"></c:import>

    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>얼리버드는 매월 마지막 날, 오후 8시 (4시간)</li>
                <li>얼리버드는 선착순이므로, 결제 도중 마감 될 수 있습니다.</li>
                <li>${sessionMember.id}님의 장바구니</li>
            </ul>
        </div>
        <table class="cart__list">
                <thead>
                    <tr>
                        <td><input type="checkbox" value="" id="checkAll"></td>
                        <td colspan="2">상품정보</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                
                	<c:forEach items="${list}" var="dto"> 
                        <c:forEach items="${dto.studyDTOs}" var="studyDTO">
						<c:forEach items="${studyDTO.studyBoardFileDTOs}" var="studyFileDTO">
							<tr class="cart__list__detail">
								<td style="width: 2%;"><input type="checkbox" value="${dto.num}" class="checks" name="checkedItems"></td>
								<td style="width: 13%;">
									<img src="../resources/upload/study/${studyFileDTO.fileName}" alt="magic mouse"></td>
								<td style="width: 41%;">
									<span class="cart__list__studyname">${studyDTO.studyName}</span>
									<div class=" price">${studyDTO.studyCost}원</div>
									<div class=" price">스터디 기간: ${studyDTO.studyStartPeriod}~${studyDTO.studyEndPeriod}</div></td>
								<td style="width: 29%;"><span class="price">${studyDTO.studyCost}원</span></td>
								<td style="width: 29%;">무료</td>
							</tr>
						</c:forEach>
					</c:forEach>
                     </c:forEach>
                     
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                        	<%-- <form action="./cartDelete" id="frm" method="post">
                        	<c:forEach items="${list}" var="dto">
								<input type="hidden" name="num" value="${dto.num}">
							</c:forEach> --%>
                        	<button id="delete" type="submit" class="cart__list__optionbtn" onclick="checkDelete()">스터디 삭제하기</button>
                        	<!-- </form> -->
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn right btn btn-primary">주문하기</button>
        </div>
    </section>

<script>
const checkAll = document.getElementById("checkAll")
const checks = document.getElementsByClassName("checks")

checkAll.addEventListener("click",function(){
    for(let i=0;i<checks.length;i++){
        checks[i].checked=checkAll.checked;
    }
});

for(let i=0;i<checks.length;i++){
    checks[i].addEventListener("click", function(){
        //for문을 중간에 종료하기 위해 boolean 타입 사용
        let result = true;
        for(let j=0;j<checks.length;j++){
            if(!checks[j].checked){
                //result = checks[j].checked
                //result = false;
                result = !result;
                break;
            }
        }
        checkAll.checked=result;
    })
};

/* function checkDelete(){
	let check = window.confirm("정말 삭제 하시겠습니까?");
	if(check){
        frm.submit();
	}
} */
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