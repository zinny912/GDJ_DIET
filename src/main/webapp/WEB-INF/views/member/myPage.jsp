<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<c:import url="./common_css.jsp"></c:import>
</head>
<body>

	<div class="container-fluid text-center">
			
			  <div class="row">
			    <div class="col mx-5 bg-warning">
			     <h1>My Page</h1>
			    </div>
			   </div>

				<div class="row">
  				  <div class="col mx-5 bg-success bg-opacity-50">
					<h3>id: ${sessionMember.id}</h3>
					<h3>pw: ${sessionMember.pw}</h3>
					<h3>name: ${sessionMember.names}</h3>
					<h3>address: ${sessionMember.address}</h3>
					<h3>phone: ${sessionMember.phone}</h3>
					<h3>email: ${sessionMember.email}</h3>
					<h3>등급: </h3>	
					<h3 id="kakao-id">나야나</h3>
					<a href="./update" class="btn btn-info">회원수정</a>
  				  </div>
				</div>
				
	</div>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<c:import url="./common_js.jsp"></c:import>
</body>
</html>