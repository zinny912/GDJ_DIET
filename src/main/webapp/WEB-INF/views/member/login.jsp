<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

	<style type="text/css">
		.redResult{
			color: red;
		}
		.blueResult{
			color: blue;
		}
		.btnKakao{display:inline-block!important;margin-top:25px;padding-left:20px;width:100%;height:45px;line-height:45px;background-color:#fee500;background-image:url('/resources/images/kakao_btn.svg');background-repeat:no-repeat;background-size:15px;background-position:15px;border-radius:6px;font-size:15px;color:#111;box-sizing:border-box}





	</style>

</head>
<body>



<div id="when_back" data-sessionMember="${sessionMember.id}"></div>

<!-- 카카오 토큰있으면 로그인 -->
<form hidden="" class="mx-1 mx-md-4" id="kloginForm" action="/member/kakaoLogin" method="post">
<input type="text" hidden="" id="kid" name="id" class="form-control" placeholder="아이디"/>
<input type="text" hidden="" id="kemail" name="email" class="form-control"/>
<input type="text" hidden="" id="kname" name="names" class="form-control"/>
<%-- <input type="text" hidden="" id="dummi" value="${sessionMember.id}"> --%>
</form>



<div class="container-fluid">
<div class="row d-flex justify-content-center">
<div class="col-6" style="
	margin-top: 20%;
">

<form class="mx-1 mx-md-4" id="loginForm" action="./login" method="post">

  <div class="d-flex flex-row align-items-center mb-4">
    <div class="form-outline flex-fill mb-0">
      <input type="text" id="id" name="id" class="form-control" placeholder="아이디"/>
           <label class="form-label" id="idLabel" for="id"></label>
      <input type="password" id="password" name="pw" class="form-control" placeholder="비밀번호"/>
      <label class="form-label" for="Password" id="passwordLabel"></label>
    </div>
  </div>

  <div class="d-flex flex-row align-items-center mb-4">
    <button type="button" id="submitBtnLogin" class="btn btn-dark col-12">로그인</button>
  </div>

  <div class="d-flex flex-row align-items-center mb-4">
    <button type="button" id="submitBtnJoin" class="btn btn-secondary col-12">가입</button>
  </div>                 

 
  <div class="d-flex flex-row align-items-center mb-4">
  <a class="btn btnKakao px-2 pb-5" href="javascript:loginWithKakao()">카카오 로그인/회원가입</a></div>
  
</form>



</div>
</div></div>












<!--   <div class="container-fluid"> -->
<!--     <div class="row d-flex justify-content-center align-items-center" > -->
<!--       <div class="" style="height: 100%;"> -->
<!--         <div class="card text-black" style="border-radius: 25px; height: 700px; height: 100%;"> -->
<!--           <div class="card-body " style="padding-top: 10%;"> -->
<!--             <div class="row justify-content-center"> -->
<!--               <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1"> -->

<!--                 <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"></p> -->

<!--                 <form class="mx-1 mx-md-4" id="loginForm" action="./login" method="post"> -->

<!--                   <div class="d-flex flex-row align-items-center mb-4"> -->
<!--                     <div class="form-outline flex-fill mb-0"> -->
<!--                       <input type="text" id="id" name="id" class="form-control" placeholder="아이디"/> -->
<!--                            <label class="form-label" id="idLabel" for="id"></label> -->
<!--                       <input type="password" id="password" name="pw" class="form-control" placeholder="비밀번호"/> -->
<!--                       <label class="form-label" for="Password" id="passwordLabel"></label> -->
<!--                     </div> -->
<!--                   </div> -->
           
<!--                   <div class="d-flex flex-row align-items-center mb-4"> -->
<!--                     <button type="button" id="submitBtnLogin" class="btn btn-dark col-12">로그인</button> -->
<!--                   </div> -->

<!--                   <div class="d-flex flex-row align-items-center mb-4"> -->
<!--                     <button type="button" id="submitBtnJoin" class="btn btn-secondary col-12">가입</button> -->
<!--                   </div>                  -->

                 
<!--                   <div class="d-flex flex-row align-items-center mb-4"> -->
<!--                   <a class="btn btnKakao px-2 pb-5" href="javascript:loginWithKakao()">카카오 로그인/회원가입</a></div> -->
                  
<!--                 </form> -->

<!--               </div> -->

<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div>	 -->


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/member/memberLogin.js"></script>
<script src="/resources/js/member/kakaoLogin.js"></script>
<script src="/resources/js/member/kakaoInfo.js"></script>



</body>
</html>