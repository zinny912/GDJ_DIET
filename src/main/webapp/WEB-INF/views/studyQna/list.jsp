<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-striped">
<c:forEach items="${list}" var="dto" >
	<tr>
		<td id="contents${dto.num}">
		${dto.contents}
		</td>
		<td>${dto.writer}</td>
		<td>${dto.regDate}</td>
		<td>
			<c:if test="${member.id eq dto.writer}">
				<button class="btn btn-info update" data-comment-num="${dto.num}" data-bs-toggle="modal" data-bs-target="#contentsModal">UPDATE</button>
			</c:if>
		</td>

		<td>
		<c:if test="${member.id eq dto.writer}">
			<button class="btn btn-danger del" data-comment-num="${dto.num}">DELETE</button>
		</c:if>
		</td>
		
	</tr>
</c:forEach>
</table>