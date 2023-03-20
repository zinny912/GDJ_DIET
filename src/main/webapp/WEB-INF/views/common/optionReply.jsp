<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${optList}" var="option">
	<c:if test="${not empty option.optId1}">
		<option class="option" id="${option.optId1}" value="${option.optId1}">${option.optName1}</option>
	</c:if>
	<c:if test="${not empty option.optId2}">
		<option class="option" id="${option.optId2}" value="${option.optId2}">${option.optName2}</option>
	</c:if>
	<c:if test="${not empty option.optId3}">
		<option class="option" id="${option.optId3}" value="${option.optId3}">${option.optName3}</option>
	</c:if>
	<c:if test="${not empty option.optId4}">
		<option class="option" id="${option.optId4}" value="${option.optId4}">${option.optName4}</option>
	</c:if>
</c:forEach>

