<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>TITLE</th>
				<th>WRITER</th>
				<th>DATE</th>
				<th>HIT</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><c:forEach begin="1" end="${dto.depth}">--</c:forEach>
					<a href="/studyQna/detail?studyNum=${dto.studyNum}&num=${dto.num}">${dto.title}</a></td>
					<td>${dto.writer}</td>
					<td>${dto.regDate}</td>
					<td>${dto.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 페이징 -->
<div class="row">
	<nav aria-label="Page navigation example">
		<ul class="pagination ">
			<li class="page-item "><a class="page-link text-dark" href="#"
				aria-label="Previous" data-board-page="1"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item ${pager.before?'disabled':''}"><a
				class="page-link text-dark" href="#" aria-label="Previous"
				data-board-page="${pager.startNum-1}"> <span aria-hidden="true">&lsaquo;</span>
			</a></li>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link text-dark" href="#"
					data-board-page="${i}">${i}</a></li>
			</c:forEach>

			<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
				<%--${pager.after eq false ? 'disabled' : ''} --%> <a
				class="page-link text-dark" href="#" aria-label="Next"
				data-board-page="${pager.lastNum+1}"> <span aria-hidden="true">&rsaquo;</span>
			</a>
			</li>
			<li class="page-item ">
				<%--${pager.after eq false ? 'disabled' : ''} --%> <a
				class="page-link text-dark" href="#" aria-label="Next"
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
				<option class="searchOption" value="title" ${pager.kind eq 'title'?'selected':''}>Title</option>
				<option class="searchOption" value="writer" ${pager.kind eq 'writer'?'selected':''}>Writer</option>
			</select>
		</div>
		<div class="col-auto">
			<label for="search" class="visually-hidden">Search</label> <input
				type="text" class="form-control" style="font-size:15px;" value="${pager.search}"
				name="search" id="search" placeholder="검색어를 입력하세요.">
		</div>
		<div class="col-auto">
			<button type="button" class="btn btn-primary mb-3" id="searchbutton">검색</button>
		</div>
		
		<div class="row my-3">
			<form class="col-md-7" action="/studyQna/add">
			<input type="hidden" name="studyNum" value="${pager.studyNum}">
			<button class="btn btn-primary" type="submit">상품문의</button> 
			</form>			
		</div>
</div>

