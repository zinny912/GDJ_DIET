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
      <link href="/resources/css/star.css" rel="stylesheet"/>
           <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<style>
  	.my-hr2 {
    border: 0;
    height: 2px;
    background: #ccc;
  	}
	</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
    
<div class="container px-4 px-lg-5">
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-lg-5">
			<h5><strong>
				<c:choose>
						<c:when test="${dto.score eq 0}">
							<p>☆☆☆☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 1}">
							<p>★☆☆☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 2}">
							<p>★★☆☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 3}">
							<p>★★★☆☆</p>
						</c:when>
						<c:when test="${dto.score eq 4}">
							<p>★★★★☆</p>
						</c:when>
						<c:when test="${dto.score eq 5}">
							<p>★★★★★</p>
						</c:when>
					</c:choose>
			</strong></h5>
		</div>
			<p>${dto.contents}</p>
			<div class="col-lg-5">
			<h6><strong>${dto.writer}</strong></h6>
			<h6><strong>${dto.regDate}&nbsp;&nbsp;조회수: ${dto.hit}</strong></h6>
			</div>
			<div class="my-3">
				<form action="./update" id="frm">
					<input type="hidden" id="num" name="num" value="${dto.num}">
					<input type="hidden" id="studyNum" name="studyNum" value="${dto.studyNum}">
					<c:if test="${dto.writer eq sessionMember.id}">
						<!-- <button id="update" type="submit" class="btn btn-primary">UPDATE</button> -->
						<button class="btn btn-primary reviewUpdate" data-comment-num="${dto.studyNum}" data-bs-toggle="modal" data-bs-target="#contentsModal">리뷰수정</button>
						<button id="delete" type="button" class="btn btn-primary">삭제</button>
					</c:if>
				</form>
			</div>

		<div class="my-3">
			<c:if test="${not empty sessionMember}"> 
				<div class="mb-3">
					<textarea class="form-control" rows="3" id="replyContents" data-study-reply="${dto.num}"></textarea>
				</div>		
				<div class="mb-3">
						<button type="button" class="btn btn-primary" id="replyAdd" data-study-reviewNum="${dto.num}">댓글작성</button>
				</div>
			</c:if>
		</div>
		
		<div class="my-2" id="studyQnaReplyResult" data-study-reply="${dto.num}">
			
		</div>
			
		
		
		
		
	</div>
</div>

  <!-- Modal -->
  <div class="modal fade" id="contentsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 수정</h1>
		  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			
				<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here" id="contents"></textarea>
					<label for="contents">Comments</label>
				</div>
						<form class="mb-3" name="myform" id="myform" method="post">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span> 
									<input type="radio" name="reviewStar" value="5" id="rate1" class="star">
									<label for="rate1">★</label> 
									<input type="radio" name="reviewStar" value="4" id="rate2" class="star">
									<label for="rate2">★</label> 
									<input type="radio" name="reviewStar" value="3" id="rate3" class="star">
									<label for="rate3">★</label> 
									<input type="radio" name="reviewStar" value="2" id="rate4" class="star">
									<label for="rate4">★</label> 
									<input type="radio" name="reviewStar" value="1" id="rate5" class="star">
									<label for="rate5">★</label>
							</fieldset>
						</form>					
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">Cancel</button>
		  <button type="button" class="btn btn-primary" id="contentsConfirm" data-comment-num="">확인</button>
		</div>
	  </div>
	</div>
  </div>

 <script>
		$('#contents').summernote({
			
				  callbacks: {
				    onImageUpload: function(file) {
				      // upload image to server and create imgNode...
				  	/* uploadFile(files) */
						const formData = new FormData();
						//<input type="file"
						formData.append('files', file[0])
						$.ajax({
							type:"POST",
							url:"summerFile",
							data:formData,
							//header
							cache:false,
							processData:false,
							contentType:false,
							enctype:'multipart/form-data',
							success:function(img){
								console.log("Image => ", img)
								// img = '<img src="'+img+'">'
								// $("#contents").summernote('pasteHTML', img);
								$("#contents").summernote('insertImage', img);
								 
							},
							error:function(){
								console.log('Image upload Fail')
							}
						});
				    }
				  }
		});//
		
		  function uploadFile(file){
				console.log("file", file);
				console.log("fileName => ", file[0].name);
				//<form>
				const formData = new FormData();
				//<input type="file"
				formData.append('files', file[0])
				$.ajax({
					type:"POST",
					url:"summerFile",
					data:formData,
					//header
					cache:false,
					processData:false,
					contentType:false,
					enctype:'multipart/form-data',
					success:function(img){
						console.log("Image => ", img)
						// img = '<img src="'+img+'">'
						// $("#contents").summernote('pasteHTML', img);
						$("#contents").summernote('insertNode', img);
						 
					},
					error:function(){
						console.log('Image upload Fail')
					}
				});
			  }
		
		
	</script>
<c:import url="../template/footer.jsp"></c:import>
<script src="../resources/js/studyReviewUpdate.js"></script>
<script src="../resources/js/boardForm.js"></script>
<script src="../resources/js/studyReviewReply.js"></script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>