<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-hover">
<c:forEach items="${list}" var="dto" >
		<ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="/resources/images/reviewcomment.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>${dto.writer}</h3>
                    <div class="meta">${dto.regDate}</div>
                    <div class="row">
                    	<div class="col-11">
                    		<p id="comments${dto.num}"> ${dto.comments}</p>
                  		</div>
                  		<div class="col-1">
							<c:if test="${sessionMember.id eq dto.writer}">
								<button class="del" data-comment-num="${dto.commentNum}" style="border: none; background-color: transparent;">
								<img src="https://static.willbes.net/public/images/njob/common/ic_closeBg_w.svg">
								</button>
							</c:if>                  			
                  		</div>
                  	</div> 
                    <!-- <p><a href="#" class="reply">Reply</a></p> -->
			</li>
		 </ul>
</c:forEach>
</table>

<!-- 페이징 -->
		<div class="row">
			<nav aria-label="Page navigation example">
			  <ul class="pagination ">
			  <li class="page-item ">
			      <a class="page-link text-dark page-comment" href="#" aria-label="Previous" data-board-page="1">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item ${pager.before?'disabled':''}">
			      <a class="page-link text-dark page-comment" href="#" aria-label="Previous" data-board-page="${pager.startNum-1}">
			        <span aria-hidden="true">&lsaquo;</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link text-dark page-comment" href="#" data-board-page="${i}">${i}</a></li>
				</c:forEach>
				
			    <li class="page-item ${pager.after eq false ? 'disabled' : ''}"> <%--${pager.after eq false ? 'disabled' : ''} --%>  
			      <a class="page-link text-dark page-comment" href="#" aria-label="Next" data-board-page="${pager.lastNum+1}">
			        <span aria-hidden="true">&rsaquo;</span>
			      </a>
			    </li><li class="page-item "> <%--${pager.after eq false ? 'disabled' : ''} --%>  
			      <a class="page-link text-dark page-comment" href="#" aria-label="Next" data-board-page="${pager.totalPage}">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
