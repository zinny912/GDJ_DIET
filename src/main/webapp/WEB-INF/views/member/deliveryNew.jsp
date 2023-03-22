<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>



<form action="./deliveryAdd" method="post">

<input type="text" hidden="" name="id" value="${sessionMember.id}">

<div class="input-group mb-3">
  <span class="input-group-text">@</span>
  <div class="form-floating">
    <input type="text" name="recipient" class="form-control" id="floatingInputGroup1" placeholder="받는사람">
    <label for="floatingInputGroup1" style="color: graytext;">받는사람</label>
  </div>
</div>
<div class="input-group mb-3">
  <span class="input-group-text">@</span>
  <div class="form-floating">
    <input type="text" name="recipientTel" class="form-control" id="floatingInputGroup2" placeholder="휴대폰">
    <label for="floatingInputGroup2" style="color: gray;">휴대폰</label>
  </div>
</div>

<div class="input-group mb-3">
  <span class="input-group-text">@</span>
  <div class="form-floating">
	<input type="text" name="address" class="form-control" id="sample3_address" onclick="sample3_execDaumPostcode()" placeholder="우편번호 찾기">
  <label for="sample3_address" style="color: gray;">우편번호 찾기</label>
    </div>
  <div class="form-floating">  
	<input type="text" name="address" class="form-control" id="sample3_detailAddress" placeholder="상세주소">
  <label for="sample3_detailAddress" style="color: gray;">상세주소</label>
  </div>
</div>

<div class="form-check">
  <input class="form-check-input" type="checkbox" name="primaryAddress" value="1" id="flexCheckChecked">
  <label class="form-check-label" for="flexCheckChecked">
    기본 배송지로
  </label>
</div>

<button type="submit" class="btn btn-primary">제출</button>
</form>

<!-- <input type="text" id="sample3_postcode" placeholder="우편번호"> -->
<!-- <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br> -->
<!-- <input type="text" id="sample3_address" placeholder="주소"><br> -->
<!-- <input type="text" id="sample3_detailAddress" placeholder="상세주소"> -->
<!-- <input type="text" id="sample3_extraAddress" placeholder="참고항목"> -->

<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }



                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample3_postcode').value = data.zonecode;//우편번호안써...
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>

<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>