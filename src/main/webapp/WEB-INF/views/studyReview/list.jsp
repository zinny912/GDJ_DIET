<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<table class="table table-hover">
		<tbody class="table-group-divider" >
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><a style="color:tomato;" href="/studyReview/detail?studyNum=${dto.studyNum}&num=${dto.num}">${dto.contents}</a></td>
					<c:choose>
						<c:when test="${dto.score eq 0}">
							<td>☆☆☆☆☆</td>
						</c:when>
						<c:when test="${dto.score eq 1}">
							<td>★☆☆☆☆</td>
						</c:when>
						<c:when test="${dto.score eq 2}">
							<td>★★☆☆☆</td>
						</c:when>
						<c:when test="${dto.score eq 3}">
							<td>★★★☆☆</td>
						</c:when>
						<c:when test="${dto.score eq 4}">
							<td>★★★★☆</td>
						</c:when>
						<c:when test="${dto.score eq 5}">
							<td>★★★★★</td>
						</c:when>
					</c:choose>
					<td>${dto.writer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${empty list}">
		<div class="col my-5">
			<div style="text-align: center; font-size: 1.5em;">등록된 리뷰가
				없습니다.</div>
		</div>
	</c:if>
</div>

<!-- 페이징 -->
<div class="row">
	<nav aria-label="Page navigation example">
		<ul class="pagination ">
			<li class="page-item "><a class="page-link text-dark page-review" href="#"
				aria-label="Previous" data-board-page="1"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item ${pager.before?'disabled':''}"><a
				class="page-link text-dark page-review" href="#" aria-label="Previous"
				data-board-page="${pager.startNum-1}"> <span aria-hidden="true">&lsaquo;</span>
			</a></li>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link text-dark page-review" href="#"
					data-board-page="${i}">${i}</a></li>
			</c:forEach>

			<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
				<%--${pager.after eq false ? 'disabled' : ''} --%> <a
				class="page-link text-dark page-review" href="#" aria-label="Next"
				data-board-page="${pager.lastNum+1}"> <span aria-hidden="true">&rsaquo;</span>
			</a>
			</li>
			<li class="page-item ">
				<%--${pager.after eq false ? 'disabled' : ''} --%> <a
				class="page-link text-dark page-review" href="#" aria-label="Next"
				data-board-page="${pager.totalPage}"> <span aria-hidden="true">&raquo;</span>
			</a>
			</li>
		</ul>
	</nav>
</div>

<!-- 검색창 -->
<div class="row">
	
		<div class="col-auto">
			<label for="kind" class="visually-hidden">Kind</label> <select
				class="form-select" name="kind" id="kind"
				aria-label="Default select example">
				<option class="searchOption" value="contents" ${pager.kind eq 'contents'?'selected':''}>Contents</option>
				<option class="searchOption" value="writer" ${pager.kind eq 'writer'?'selected':''}>Writer</option>
			</select>
		</div>
		<div class="col-auto">
			<label for="search" class="visually-hidden">Search</label> <input
				type="text" class="form-control" style="font-size:15px;" value="${pager.search}"
				name="search" id="search" placeholder="검색어를 입력하세요.">
		</div>
		<div class="col-auto">
			<button type="button" class="btn btn-primary mb-3" id="searchbtn">검색</button>
		</div>
		
<%-- 		<div class="row my-3">
			<form class="col-md-7" action="/studyReview/add">
			<input type="hidden" name="studyNum" value="${pager.studyNum}">
			<button class="btn btn-primary" type="submit">리뷰쓰기</button> 
			</form>			
		</div> --%>

		<%-- <c:forEach items="${list}" var="dto">
		<c:if test="${dto.studyNum eq sessionMember.studyNum}"> --%>
		<c:if test="${not empty sessionMember}">
		<div class="row my-3">
			<div class="col-md-7">
				<button class="btn btn-primary add"
					data-comment-num="${pager.studyNum}" data-bs-toggle="modal"
					data-bs-target="#contentsModal">리뷰쓰기</button>
			</div>
		</div>
		</c:if>
<%-- 		</c:if>
	</c:forEach> --%>
</div>
