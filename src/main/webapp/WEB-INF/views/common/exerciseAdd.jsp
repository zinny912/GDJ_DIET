<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${machineList}" var="machine">
	<c:if test="${not empty machine.machineNum}">
		<option class="option" id="${machine.machineNum}" value="${machine.machineNum}">${machine.machineName}</option>
	</c:if>
</c:forEach>