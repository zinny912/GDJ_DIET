<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

  <div class="container-fluid">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">로</p>

                <form class="mx-1 mx-md-4" id="loginForm" action="./login" method="post">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="id" name="id" class="form-control" placeholder="아이디"/>
                           <label class="form-label" id="idLabel" for="id"></label>
                      <input type="password" id="password" name="pw" class="form-control" placeholder="비밀번호"/>
                      <label class="form-label" for="Password" id="passwordLabel"></label>
                    </div>
                  </div>
                  
                  <!-- 카카오용 -->
                  <input type="text" hidden="" id="email" name="email" class="form-control"/>
                  <input type="text" hidden="" id="name" name="names" class="form-control"/>
                  <!-- <input type="text" id="loginType" name="loginType" hidden="" value="general" class="form-control"/> -->
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <button type="button" id="submitBtn" class="btn btn-dark col-12">로그인</button>
                  </div>
                 
                  <div class="d-flex flex-row align-items-center mb-4">
                  <a class="btn btnKakao px-2 pb-5" href="javascript:loginWithKakao()">카카오 로그인/회원가입</a></div>
                  
                </form>

              </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>	

	
	
	

	
	<button class="api-btn" onclick="kakaoLogout()">카카오로그아웃</button>
<a href="javascript:kakaoInfoLoginPage()">카카오 info</a>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="/resources/js/member/memberLogin.js"></script>
<script src="/resources/js/member/kakaoLogin.js"></script>
<script src="/resources/js/member/kakaoInfo.js"></script>
</body>
</html>