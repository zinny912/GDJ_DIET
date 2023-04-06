<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${machine}" var="dto">
		<option value="${dto.machineNum}">${dto.machineName}</option>
</c:forEach>
