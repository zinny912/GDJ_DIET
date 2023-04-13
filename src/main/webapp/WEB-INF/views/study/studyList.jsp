<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <title>구디다이어트</title>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<c:import url="../template/common_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>

</head>
<body>


	<div class="container">
		<div class="row justify-content-center my-3 pb-3">
			<div class="col-md-12 heading-section ftco-animate text-center"
				style="line-height: 5%">
				<h3 class="mb-1">루틴 스터디</h3>
				<br>
				<h3>Routine Study</h3>
			</div>
		</div>
	</div>

		<section class="ftco-section">
			<div class="container">
				<div class="row">
								<div>
					<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
						<a href="./studyAdd" class="btn btn-primary" style="margin:0 0 0.5%">스터디 추가하기</a>
					</c:if>
				</div>
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
			</div>
		</section>

<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
		<c:import url="../template/footer.jsp"></c:import>
		<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>