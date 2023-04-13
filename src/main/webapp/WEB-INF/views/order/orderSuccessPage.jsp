<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/style.css">
<style type="text/css">
img { display : block;
       margin : auto;}
</style>
</head>
<body>
<div class="row mx-auto">
	<div class="col-3 w-100 mx-auto my-5 border">
		<form action="/member/myPage" method="get" id="frm">
            
           <a class="navbar-brand w-100 mt-3 text-center" style="font-size:25px" href="/"> 
            결제 완료</a>
            <div class="underline"></div>
			<div id="img" style="cursor: pointer; margin-top:15px;">
				<img alt="..." src="/resources/images/paysuccess.png">
				<div class="text-center justify-content-center">
                    <div>
                    <p style="color:tomato; font-weight: bolder;">결제에 성공하였습니다<br></p>
                
                    <p>구매해주셔서 감사합니다<br>
                    배송은 평일 기준 2~3일 소요됩니다</p>
                    </div>
                

                </div>
                <div class="underline"></div>
                <div class="row col-4 my-2">
					<a href="/">HOME</a>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</html>