<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${healthMachine}

<div class="col-12">
	<div class="card">
	  <div class="card-body">
	    <h5 class="card-title">${prime.recipient}</h5>

	    <h6 class="card-subtitle mb-2 text-muted">대표주소</h6>
	    
	    <p class="card-text">${prime.address}</p>
	    <p class="card-text">${prime.recipientTel}</p>
	    <a href="./deliveryUpdate?id=${sessionMember.id}&addressNum=${prime.addressNum}" class="card-link">수정</a>
	    
	  </div>
	</div>		
</div>

</body>
</html>