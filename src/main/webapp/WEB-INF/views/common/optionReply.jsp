<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${optList}" var="option">
	<c:if test="${not empty option.optId1}">
		
		<li class="dropdown-item cursor-pointer" id="op1" data-id="${option.optId1}" data-name="${option.optName1}">${option.optName1}</li>
	</c:if>
	<c:if test="${not empty option.optId2}">
		<li class="dropdown-item cursor-pointer" id="op2" data-id="${option.optId2}" data-name="${option.optName2}">${option.optName2}</li>
	</c:if>
	<c:if test="${not empty option.optId3}">
		<li class="dropdown-item cursor-pointer" id="op3" data-id="${option.optId3}" data-name="${option.optName3}">${option.optName3}</li>
	</c:if>
	<c:if test="${not empty option.optId4}">
		<li class="dropdown-item cursor-pointer" id="op4" data-id="${option.optId4}"  data-name="${option.optName4}">${option.optName4}</li>
	</c:if>
</c:forEach>

