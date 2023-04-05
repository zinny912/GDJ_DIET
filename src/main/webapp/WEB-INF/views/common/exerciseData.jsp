<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover">
<c:forEach items="${exercise}" var="dto" >
		<ul class="exercise-list">
                <li class="exercise">
                  <div class="vcard bio">
                    <img src="/resources/images/reviewcomment.jpg" alt="Image placeholder">
                  </div>
                  <div class="exercise-body">
                    <h3>${dto.title}</h3>
                    <div class="meta">${dto.day}</div>
                    <div class="row">
                    	<div class="col-11">
                    		<p id="comments${dto.num}"> ${dto.title}</p>
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

