<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>

<c:forEach items="${list}" var="dto">
	<div>
		<div>${dto.title}</div>
		<div>${dto.viedoId}</div>
		<div>${dto.machineNum}</div>
		<div>${dto.startDay}</div>
		<div>${dto.endDay}</div>
		
	</div>
</c:forEach>