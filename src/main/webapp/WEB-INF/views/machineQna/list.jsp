<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
    <table class="table my-table">
        <thead>
            <c:if test="${not empty list}">
                <tr>
                    <th style="text-align: left;">TITLE</th>
                    <th>WRITER</th>
                    <th>DATE</th>
                    <th>HIT</th>
                </tr>
            </c:if>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="dto">
                <tr>
                    <td>
                    	<c:choose>
                    	<c:when test="${dto.depth ge 1}">
                        <div style="margin-left: ${dto.depth * 20}px">
                            <img src="/resources/images/reply.png" style="float: left;">
                            <a href="/machineQna/detail?machineNum=${dto.machineNum}&num=${dto.num}" style="text-align: left;">${dto.title}</a>
                        </div>
                        </c:when>
                        <c:otherwise>
                        	 <a href="/machineQna/detail?machineNum=${dto.machineNum}&num=${dto.num}" style="text-align: left;">${dto.title}</a>
                       	</c:otherwise>
                       	</c:choose>
                    </td>
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
			<li class="page-item "><a class="page-link text-dark page-qna" href="#"
				aria-label="Previous" data-board-page="1"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item ${pager.before?'disabled':''}"><a
				class="page-link text-dark page-qna" href="#" aria-label="Previous"
				data-board-page="${pager.startNum-1}"> <span aria-hidden="true">&lsaquo;</span>
			</a></li>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link text-dark page-qna" href="#"
					data-board-page="${i}">${i}</a></li>
			</c:forEach>

			<li class="page-item ${pager.after eq false ? 'disabled' : ''}">
				<%--${pager.after eq false ? 'disabled' : ''} --%> <a
				class="page-link text-dark page-qna" href="#" aria-label="Next"
				data-board-page="${pager.lastNum+1}"> <span aria-hidden="true">&rsaquo;</span>
			</a>
			</li>
			<li class="page-item ">
				<%--${pager.after eq false ? 'disabled' : ''} --%> <a
				class="page-link text-dark page-qna" href="#" aria-label="Next"
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
		
		<c:if test="${not empty sessionMember}">
		<div class="row my-3">
			<form class="col-md-7" action="/machineQna/add">
			<input type="hidden" name="machineNum" value="${pager.machineNum}">
			<button class="btn btn-primary float-start" type="submit">상품문의</button> 
			</form>			
		</div>
		</c:if>
</div>

