<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../template/common_css.jsp"></c:import>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>


	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('/resources/images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-3 bread">Class Program</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<c:forEach items="${list}" var="dto">
					<div class="col-md-4">
						<div class="classes w-100 ftco-animate">
						<c:forEach items="${dto.studyBoardFileDTOs}" var="boardDTO">
							<a href="./studyDetail?studyNum=${dto.studyNum}"
								class="img w-100 mb-3"
								style="background-image: url(../resources/upload/study/${boardDTO.fileName});"></a>
							<p></p>
							</c:forEach>
							<div class="text w-100 text-center">
								<h3>
									<a href="./studyDetail?studyNum=${dto.studyNum}">${dto.studyName}</a>
								</h3>
								<p>${dto.studyStartPeriod}~${dto.studyEndPeriod}</p>
								
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
				<div><c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}"> 
					<a href="./studyAdd" class="btn btn-primary">스터디 추가하기</a> 
				</c:if></div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>