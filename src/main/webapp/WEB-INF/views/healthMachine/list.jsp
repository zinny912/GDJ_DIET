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
	</div>
	<a href="./add">add</a>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>