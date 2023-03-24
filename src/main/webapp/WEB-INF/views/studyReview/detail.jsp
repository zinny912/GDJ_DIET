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
	<style>
  	.my-hr2 {
    border: 0;
    height: 2px;
    background: #ccc;
  	}
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
    
<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-lg-5">
			<h5><strong>
				<c:choose>
						<c:when test="${dto.score eq 0}">
							<p>☆☆☆☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 1}">
							<p>★☆☆☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 2}">
							<p>★★☆☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 3}">
							<p>★★★☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 4}">
							<p>★★★★☆</p>
						</c:when>
						<c:when test="${dto.score eq 5}">
							<p>★★★★★</p>
						</c:when>
					</c:choose>
			</strong></h5>
		</div>
			<p>${dto.contents}</p>
			<div class="col-lg-5">
			<h6><strong>${dto.writer}</strong></h6>
			<h6><strong>${dto.regDate}&nbsp;&nbsp;조회수: ${dto.hit}</strong></h6>
			</div>
			<div class="my-3">
				<form action="./update" id="frm">
					<input type="hidden" name="studyNum" value="${dto.studyNum}">
					<input type="hidden" name="num" value="${dto.num}">
					<c:if test="${dto.writer eq sessionMember.id}">
						<button id="update" type="submit" class="btn btn-primary">UPDATE</button>
						<button id="delete" type="button" class="btn btn-primary">DELETE</button>
					</c:if>
				</form>
			</div>
		
		<div class="my-2" id="studyQnaReplyResult">
			<textarea class="form-control" rows="3" id="replyContents"></textarea>
		</div>
				
		<div class="mb-3">
		<c:if test="${not empty sessionMember}"> 
			<button type="button" class="btn btn-primary" id="replyAdd" data-study-studyNum="${dto.studyNum}">댓글작성</button>
		</c:if></div>
		
		
	</div>
</div>


<c:import url="../template/footer.jsp"></c:import>
<script src="../resources/js/boardForm.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>