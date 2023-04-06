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
				<div>
					<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
						<a href="./studyAdd" class="btn btn-primary">스터디 추가하기</a>
					</c:if>
				</div>
			</div>
		</section>


		<c:import url="../template/footer.jsp"></c:import>
		<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>