<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

	<style type="text/css">
		.redResult{
			color: red;
		}
		.blueResult{
			color: blue;
		}
	</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<section class="vh-100" style="background-color: #eee;">
  <div class="container-fluid">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body">
          
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form class="mx-1 mx-md-4" action="./join" method="post">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="id" name="id" class="form-control" placeholder="아이디"/>
                           <label class="form-label" id="idLabel" for="id"></label>
					<div  class="hstack gap-3" id="emailDiv">
                      <input  type="email" id="email" name="email" class="col form-control" placeholder="이메일"/>
<!--                       <button type="button" class="col-2 btn btn-secondary text-nowrap">인증</button> -->
					</div>
                    

<div id="verification_div" class="hstack gap-3">
  <input class="col form-control" id="verification_val" type="text" placeholder="인증번호">
  <button type="button" id="verification_submit" onclick="javascript:verificationSubmit()" class="col-2 btn btn-secondary text-nowrap">제출</button>
  <div class="vr "></div>
  <button type="button" id="verification_re" class="col-3 btn btn-outline-danger text-nowrap">인증번호</button> <!-- onclick="javascript:verificationRe()" -->
</div>


                      <input type="password" id="password" name="pw" class="form-control" placeholder="비밀번호"/>
                      <label class="form-label" for="Password" id="passwordLabel"></label>
                      <input type="password" id="passwordCheck" class="form-control" placeholder="비밀번호 확인"/>
                      <label class="form-label" id="passwordCheckLabel" for="passwordCheck"></label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="name" name="names" class="form-control" placeholder="이름"/>
<!--                       <label class="form-label" for="name">Your Name</label> -->
                    </div>
                  </div>



                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="phone" name="phone" class="form-control" placeholder="연락처"/>
<!--                       <label class="form-label" for="phone">연락처</label> -->
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input readonly="readonly" type="text" id="sample3_address" onclick="sample3_execDaumPostcode()" name="address" class="form-control" placeholder="주소"/>
<!--                       <label class="form-label" for="address">주소</label> -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
                      <input type="text" id="sample3_detailAddress" name="address" class="form-control" placeholder="상세주소"/>
<!--                       <label class="form-label" for="addressDetail">주소</label> -->
                    </div>
                  </div>

                  <div class="form-check d-flex justify-content-center mb-5">
                    <input class="form-check-input me-2" onClick="return false;" type="checkbox" value="" id="agree" />
                    <label class="form-check-label" for="agree">
                      I agree all statements in <a id="terms" href="javascript:mAgree()">Terms of service</a>
                    </label>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="button" id="submitBtn" class="btn btn-primary btn-lg">회원가입</button>
                  </div>

                </form>

              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- 약관동의 모달창 -->
<!-- Button trigger modal -->
<button type="button" id="modalBtn" hidden="" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agreeModal">
</button>

<!-- Modal -->
<div class="modal fade" id="agreeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-scrollable"  >
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="agreeModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="modalSubmit">Save changes</button>
        <button type="button" class="btn btn-secondary" id="modalCancel" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-secondary" id="modalClose" data-bs-dismiss="modal" hidden=""></button>
      </div>
    </div>
  </div>
</div>


<c:import url="./common_js.jsp"></c:import>

<script src="/resources/js/member/memberAgree.js"></script>


<!-- 주소api -->


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

</body>
</html>