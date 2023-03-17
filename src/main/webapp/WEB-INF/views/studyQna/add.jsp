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
     
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/css/flaticon.css">
    <link rel="stylesheet" href="/resources/css/icomoon.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>

<body>

<div class="container-fluid">
	<div class="row justify-content-center">
		<h1 class="col-md-7 text-center my-5">Q&amp;A 상품문의</h1>
	</div>	
	
	<div class="row justify-content-center">
		<form class="col-md-7" action="./add" method="post" enctype="multipart/form-data">
			<input type="hidden" name="studyNum" value="1" id="studyNum"> 	
			<div class="mb-3">
				<label for="writer" class="form-label">작성자</label> 
				<c:if test="${not empty member}">
					<input type="text" name="writer" class="form-control" id="writer" value="${member.id}" readonly>
				</c:if>
				<c:if test="${empty member}">
					<input type="text" name="writer" class="form-control" id="writer" value="${member.id}">
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
				<button type="button" class="btn btn-primary" id="fileAdd">ADD</button>
			</div>
		
			<div class="mb-3">
				<button class="btn btn-outline-success" type="submit">글쓰기</button> 
			</div>
		</form>
	</div>
</div>

	<c:import url="../template/common_js.jsp"></c:import>
	<script>
		$('#contents').summernote();
	</script>
</body>
</html>