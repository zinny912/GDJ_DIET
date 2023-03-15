<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
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
			<c:forEach items="${list}" var ="dto">
				<tr>
					<td>${dto.machineNum }</td>
					<td>${dto.categoryNum }</td>
					<td><a href="./detail?machineNum=${dto.machineNum}">${dto.machineName }</a></td>
					<td>${dto.machineScore }</td>
					<td>${dto.machineDetail }</td>
					<td>${dto.price }</td>
					<td>${dto.stock }</td>
					<td>${dto.sale }</td>
					
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="./add">add</a>
</body>
</html>