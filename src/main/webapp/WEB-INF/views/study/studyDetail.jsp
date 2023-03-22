<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 <title>구디다이어트</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>

 </head>
 <body>
  <c:import url="../template/header.jsp"></c:import>
 
	<div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyclass.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h2 class="font-weight-light">${dto.studyName}</h2>
                    <h3 class="font-weight-light">${dto.studyCost}원</h3>
                    <hr class="my-hr2">
            		<div class="text-center">
                    <h6><strong>스터디 일정안내</strong></h6>
                    ${dto.studyPeriod} 스터디 기간
                    <br>반배정 문자 일괄 발송
                    <br>문의:010-0000-1111
                    </div>
                    <br>
                    <a class="btn btn-primary" href="#!">장바구니에 담기</a>
                </div>
            </div>
            <!-- Call to Action-->
            
            <div class="col-12 w-100 text-center">
			        <div class="row">
			        <div class="col-md-4">
			          <div class="nav-link" id="studyQnaInfo" style="cursor: pointer">상세정보</div>
			        </div>
			        <div class="col-md-4">
			         <div class="nav-link" id="studyReviewList" data-review-studyNum="${dto.studyNum}" style="cursor: pointer">구매평</div>
			        </div>
			        <div class="col-md-4">
			          <div class="nav-link" id="studyQnaList" data-study-studyNum="${dto.studyNum}" style="cursor: pointer">Q&amp;A</div>
			        </div>
			        <hr class="my-hr2">
			        </div>
  			</div>
  			
  			<div class="my-5" id="studyListResult">
  				<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyDetailinfomation.jpg" alt="..." />
  				<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyDetailinfomation2.jpg" alt="..." />
  			</div>
  	</div>

  <!-- Modal -->
  <div class="modal fade" id="contentsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<form>
				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here" id="contents"></textarea>
					<label for="contents">Comments</label>
				</div>
				<div id="fileList">
				<!-- <div class="mb-3">
					<label for="files" class="form-label">이미지</label>
					<input type="file" class="form-control" id="files" name="pic">
				</div> -->
				<button type="button" id="fileAdd">ADD</button>
			</div>
			</form>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">Cancel</button>
		  <button type="button" class="btn btn-primary" id="contentsConfirm" data-comment-num="">확인</button>
		</div>
	  </div>
	</div>
  </div>

 
 <!-- loader -->
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


 <style>
 .my-hr2 {
 border: 0;
 height: 2px;
 background: #ccc;
 }
 </style>
 
<script type="text/javascript" src="/resources/js/fileManager.js"></script>
	<script>
		setMax(3);
		
		//setParam('f');
	</script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
<script src="/resources/js/studyQna.js"></script>
 </body>
</html>