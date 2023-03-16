<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="col-md-5 mx-auto text-center border border-primary pb-3">HealthMachine
				detail And OptionAdd page</h1>

			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>NUM</th>
							<th>category</th>
							<th>machinename</th>
							<th>score</th>
							<th>detail</th>
							<th>price</th>
							<th>stock</th>
							<th>sale</th>


						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.machineNum}</td>
								<td>${dto.categoryNum}</td>
								<td>${dto.machineName}</td>
								<td>${dto.machineScore}</td>
								<td>${dto.machineDetail}</td>
								<td>${dto.price}</td>
								<td>${dto.stock}</td>
								<td>${dto.sale}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="form-floating">
					<select class="form-select" id="floatingSelect"
						aria-label="상위옵션">
						<c:forEach items="${list }" var="dto" varStatus="i">
						<option value="${dto.healthMachineTopOptionDTO.topOptionName}" id="${dto.healthMachineTopOptionDTO.topOptionNum}">${dto.healthMachineTopOptionDTO.topOptionName}</option>
						</c:forEach>
					</select> <label for="floatingSelect">Works with selects</label>
				</div>

			</div>
		</div>

	</div>




	<script src="/resources/js/healthMachineAdd.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>