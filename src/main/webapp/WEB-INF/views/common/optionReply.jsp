<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${optList}" var="option">
	<c:if test="${not empty option.opt1Id}">
		<option class="option" id="${option.opt1Id}" value="${option.opt1Id}">${option.opt1Name}</option>
	</c:if>
	<c:if test="${not empty option.opt2Id}">
		<option class="option" id="${option.opt2Id}" value="${option.opt2Id}">${option.opt2Name}</option>
	</c:if>
	<c:if test="${not empty option.opt3Id}">
		<option class="option" id="${option.opt3Id}" value="${option.opt3Id}">${option.opt3Name}</option>
	</c:if>
	<c:if test="${not empty option.opt4Id}">
		<option class="option" id="${option.opt4Id}" value="${option.opt4Id}">${option.opt4Name}</option>
	</c:if>
</c:forEach>

