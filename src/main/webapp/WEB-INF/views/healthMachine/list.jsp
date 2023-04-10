<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<c:import url="../template/common_css.jsp"></c:import>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-12 heading-section ftco-animate text-center">
					<h2 class="mb-1">운동기구 목록</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${list}" var="dto">
				<div class="col-md-4">
					<div class="classes w-100 ftco-animate">
						<a href="./detail?machineNum=${dto.machineNum }" class="img w-100 mb-3"
							style="background-image: url(/resources/images/${dto.healthMachineImgDTOs[0].fileName});"></a>
						<div class="text w-100 text-center">
							<h3>
								<a href="./detail?machineNum=${dto.machineNum }">${dto.machineName }</a>
							</h3>
							<p id=price>${dto.price }</p>
							<h5>${dto.salePrice }</h5>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<div>
				<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
					<a href="./add" class="btn btn-primary">운동기구 추가하기</a>
				</c:if>
			</div>
		</div>
	</section>


	<%-- <div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>NUM</th>
						<th>category</th>
						<th>machinename</th>
						<th>score</th>
						<th>price</th>

						<th>saleprice</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.machineNum }</td>
							<td>${dto.categoryNum }</td>
							<td><a href="./detail?machineNum=${dto.machineNum }">${dto.machineName }</a></td>
							<td>${dto.machineScore }</td>
							<td>${dto.price }</td>
							<td>${dto.salePrice }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div> --%>
	
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>