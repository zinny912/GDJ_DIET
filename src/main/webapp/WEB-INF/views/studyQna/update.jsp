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
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>

<body>

<div class="container-fluid">
	<div class="row justify-content-center">
		<h1 class="col-md-7 text-center my-5">Q&amp;A 상품문의 수정</h1>
	</div>	
	
	<div class="row justify-content-center">
		<form class="col-md-7" action="./update" method="post">
			<input type="hidden" name="num" value="${dto.num}" id="num">
			<input type="hidden" name="studyNum" value="${dto.studyNum}" id="studyNum"> 	
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label> 
				<c:if test="${not empty member}">
					<input type="text" name="writer" class="form-control" id="writer" value="${member.id}" readonly>
				</c:if>
				<c:if test="${empty member}">
					<input type="text" name="writer" class="form-control" id="writer" value="${dto.writer}">
					<!-- dto.writer대신 member.id로 추후 멤버 추가하고 바꾸기 -->
				</c:if>
			</div>
			
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> 
				<input type="text" name="title" class="form-control" id="title" placeholder="제목 입력">
			</div>
	
			<div class="mb-3">
				<label for="contents" class="form-label">상세내용</label>
				<textarea name="contents" class="form-control" id="contents" placeholder="설명입력" rows="7"></textarea>
			</div>
			
			<div id="fileList">
<!-- 				<div class="input-group mb-3", id="f'+idx+'">
						<input type="file" class="form-control" name="'+param+'">
						<button type="button class="btn btn-outline-danger dels" data-dels-id="f'+idx+'">X</button>
					</div> -->
			</div>
		
			<div class="mb-3">
				<button class="btn btn-primary" type="submit">글쓰기</button> 
			</div>
		</form>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script>
		$('#contents').summernote();
	</script>
</body>
</html>