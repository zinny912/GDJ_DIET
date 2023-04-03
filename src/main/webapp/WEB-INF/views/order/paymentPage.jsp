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

<div class="container-fluid">
	<div class="row d-flex justify-content-center align-items-center h-100">
<div class="col-8">	

	<h3>customer</h3>
	<table class="table">

	
		<tbody>
<tr>
	<td>아이디
	</td>
	<td>XX
	</td>
</tr>
<tr>
	<td>이메일
	</td>
	<td>XX
	</td>
</tr>
<tr>
	<td>휴대폰 번호
	</td>
	<td>XX
	</td>
</tr>



			
		</tbody>
	</table>
	
	<div>
		<h2>배송지
			<button class="btn btn-secondary btn_delivery_change" style="margin-left: 80%;">변경</button>
		</h2>
	</div>

	<table class="table">

	
		<tbody>
<tr>
	<td>아이디
	</td>
	<td>XX
	</td>
</tr>
<tr>
	<td>이메일
	</td>
	<td>XX
	</td>
</tr>
<tr>
	<td>휴대폰 번호
	</td>
	<td>XX
	</td>
</tr>



			
		</tbody>
	</table>	

	
	</div>
</div>	
	
</div>

<script src="/resources/js/order/payment.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>