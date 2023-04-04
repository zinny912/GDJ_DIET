<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>재고</th>
			<th>${dto.option1 }</th>
			<c:if test="${not empty dto.option2 }">
				<th>${dto.option2 }</th>
			</c:if>
			<c:if test="${not empty dto.option3 }">
				<th>${dto.option3 }</th>
			</c:if>
			<c:if test="${not empty dto.option4 }">
				<th>${dto.option4 }4</th>
			</c:if>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${dto.realHealthMachineDTOs }" var="option" varStatus="i">
			<tr class="cursor-pointer" data-realMachineNum=${option.realMachineNum }>
				<td>${i.index+1}</td>
				<td>${option.stock}</td>
				<td>${option.optName1}</td>
				<c:if test="${not empty dto.option2 }">
					<td>${option.optName2}</td>
				</c:if>

				<c:if test="${not empty dto.option3 }">
					<td>${option.optName3}</td>
				</c:if>

				<c:if test="${not empty dto.option4 }">
					<td>${option.optName4}</td>
				</c:if>

			</tr>
		</c:forEach>

	</tbody>
</table>
