<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
   .my-table tr:nth-child(even) {
    background-color: #ffb5b52c; /* 짝수 줄 배경색 */
  }
  
  .my-table tr:nth-child(odd) {
    background-color: #ffffff; /* 홀수 줄 배경색 */
  }

 </style>

</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container px-4 px-lg-5">

		<div
			class="row gx-4 gx-lg-5 align-items-center my-3 border border-secondary-subtle" >
			<div class="col-lg-7 d-flex justify-content-center align-items-center">
		  <img class="img-fluid rounded mb-4 mb-lg-0"
		    src="/resources/images/${dto.healthMachineImgDTOs[0].fileName}"
		    alt="..." />
			</div>
			<div class="col-lg-5 text-center">
				<h2>
					<strong>${dto.machineName}</strong>
				</h2>
				<h6 class="font-weight-light" style="text-decoration: line-through;">${dto.price}원</h6>
				<h1 class="font-weight-light" style="color: red">${dto.salePrice}원</h1>
				<hr class="my-hr2">
				<div class="text-center" id="optionSelect"
					data-machineNum="${dto.machineNum}">
					<h6 class="font-weight-light">옵션선택</h6>
					<div class="dropdown" id="opt1" data-optName="${dto.option1 }">

						<button class="btn dropdown-toggle" id="optbtn1">${dto.option1}을
							선택해 주세요</button>
						<div class="dropdown-menu">
							<ul style="list-style: none;" id='optSelect1'>

							</ul>
						</div>
					</div>
					<div class="dropdown" id="opt2" data-optName="${dto.option2 }"></div>
					<div class="dropdown" id="opt3" data-optName="${dto.option3 }"></div>
					<div class="dropdown" id="opt4" data-optName="${dto.option4 }"></div>
				</div>
				<br>
				<form id="frm">
					<input type="hidden" name="machineNum" value="${dto.machineNum}">
					<!-- <input type="hidden" id="optId1" name="optId1"> <input
						type="hidden" id="optId2" name="optId2"> <input
						type="hidden" id="optId3" name="optId3"> <input
						type="hidden" id="optId4" name="optId4"> -->
					<!-- <a class="btn btn-primary" href="#">장바구니에 담기</a> -->
					<div id="btn">
						<button id="cartAdd" type="button" class="btn btn-outline-primary"
							disabled="disabled">장바구니에 담기</button>
						<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
							<button id="del" type="button" class="btn btn-danger">운동기구삭제</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	
	<div style="text-align: right;">
	<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
	  <a href="optionAdd?machineNum=${dto.machineNum}" class="btn btn-primary" style="margin-right: 10px;">add</a>
	  <a href="update?machineNum=${dto.machineNum}" class="btn btn-primary">update</a>
	</c:if>
	</div>

	  <div class="col-12 w-100 text-center">
			        <div class="row">
			        <div class="col-md-4">
			          <div class="nav-link" id="machineQnaInfo" style="cursor: pointer">상세정보</div>
			        </div>
			        <div class="col-md-4">
			         <div class="nav-link" id="machineReviewList" data-review-machineNum="${dto.machineNum}" style="cursor: pointer">구매평(${review})</div>
			        </div>
			        <div class="col-md-4">
			          <div class="nav-link" id="machineQnaList" data-qna-machineNum="${dto.machineNum}" style="cursor: pointer">Q&amp;A(${qna})</div>
			        </div>
			        <hr class="my-hr2">
			        </div>
  		</div>
  		<div class="my-5 text-center" id="machineListResult">
	  		<c:forEach items="${dto.healthMachineImgDTOs}" var="images" begin="1">
	  			<img class="img-fluid rounded mb-4 mb-lg-0" style="width=100%;" src="/resources/images/${images.fileName}" alt="..." />
	  		</c:forEach>
  			</div>
	</div>
	
	<!-- Modal -->
  <div class="modal fade" id="contentsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 쓰기</h1>
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
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/getOption.js"></script>
	<script src="/resources/js/machineBoard.js"></script>
</body>
</html>