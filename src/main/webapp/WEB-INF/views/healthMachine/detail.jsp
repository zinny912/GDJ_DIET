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



						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${dto.machineNum}</td>
							<td>${dto.categoryNum}</td>
							<td>${dto.machineName}</td>


						</tr>
					</tbody>
				</table>

				<div class="row" id="optionSelect"
					data-machineNum="${dto.machineNum}">
					<div id="opt1" data-optName="${dto.option1 }">
						<select class="form-select mb-3" id="optSelect1">
							<option class="option" id="default">${dto.option1}선택</option>
						</select>
					</div>
					<div id="opt2" data-optName="${dto.option2 }"></div>
					<div id="opt3" data-optName="${dto.option3 }"></div>
					<div id="opt4" data-optName="${dto.option4 }"></div>
				</div>

			</div>
		</div>
	</div>




	<script src="/resources/js/getOption.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>