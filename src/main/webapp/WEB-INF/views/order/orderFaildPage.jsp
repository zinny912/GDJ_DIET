<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/style.css">
  <style>
 img { display : block;
       margin:auto;}

    </style>
</head>
<body>
<div class="row mx-auto">
	<div class="col-3 w-100 mx-auto my-5 border">
		<form action="/member/myPage" method="get" id="frm">
            
           <a class="navbar-brand w-100 mt-3 text-center" style="font-size:25px" href="/"> 결제 실패</a>
            <div class="underline"></div>
			<div id="img" style="cursor: pointer;">
				<img alt="..." src="/resources/images/alertfail.png">
				
				<div class="text-center justify-content-center">
                    <div>
                    <p style="color:tomato; font-weight: bolder;">결제에 실패하였습니다<br></p>
                
                    <p>불편을 드려 죄송합니다<br>
                    확인하여 다시 결제바랍니다</p>
                    </div>
                

                </div>
                <div class="underline"></div>
                <div class="row col-4 my-2">
					<a href="/cart/cartList">돌아가기</a>
				</div>
			</div>
		</form>
	</div>
	
</div>

</body>
</html>