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
    
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
    
<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-lg-5">
			<h5><strong>${dto.title}</strong></h5>
			<h6><strong>${dto.writer}</strong></h6>
		</div>
		<hr class="my-hr2">
			<p>${dto.contents}</p>
			<div class="my-3">
				<form action="./update" id="frm">
					<input type="hidden" name="machineNum" value="${dto.machineNum}">
					<input type="hidden" name="num" value="${dto.num}">
					<c:if test="${dto.writer eq sessionMember.id}">
						<button id="update" type="submit" class="btn btn-primary">QNA수정</button>
						<button id="delete" type="button" class="btn btn-primary">QNA삭제</button>
					</c:if>
				</form>
			</div>
		<hr class="my-hr2">
		
		<div class="my-2" id="studyQnaReplyResult">
		
		</div>
				
		<div><c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}"> 
		<a href="./reply?machineNum=${dto.machineNum}&num=${dto.num}" class="btn btn-primary">답글</a> 
		</c:if></div>
		
		
	</div>
</div>

  <style>
  	.my-hr2 {
    border: 0;
    height: 2px;
    background: #ccc;
  }
  </style>
<c:import url="../template/footer.jsp"></c:import>
<script src="../resources/js/boardForm.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>