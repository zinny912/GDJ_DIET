<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>

	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="col-md-5 mx-auto text-center border border-primary pb-3">HealthMachine
				Addpage</h1>
		</div>
		<div class="row col-md-7 mx-auto">
			<form action="./add" method="POST" enctype="multipart/form-data"
				id="frm">
				<div class="mb-3" id="categoryList">
					<label for="categoryNum" class="form-label">카테고리</label>
					<!-- <input type="hidden" class="form-control" name="categoryNum" id="categoryId" value=""> -->
					<select class="form-select" id="categorySelect" name="categoryDTOs">
						<c:forEach items="${category }" var="dto">
							<option value="${dto.categoryNum }">${dto.categoryName }</option>
						</c:forEach>
					</select>
				</div>
				<div id="categorybtn">
				<button type="button" class="btn btn-primary" id="categoryAdd">카테고리추가</button>
				<!-- <button type="button" class="btn btn-danger" id="categoryDelete">카테고리 삭제</button> -->
				</div>
				<!-- <div class="mb-3">
					<label for="categoryNum" class="form-label">카테고리</label>
					<select class="form-select" id="categorySelect2"
						name="categoryDTOs">
						<c:forEach items="${category }" var="dto">
							<option value="${dto.categoryNum }">${dto.categoryName }</option>
						</c:forEach>

					</select>
				</div> -->
				<div class="mb-3">
					<label for="machineName" class="form-label">기구명</label> <input
						type="text" class="form-control" name="machineName">
				</div>

				<div class="mb-3">
					<label for="price" class="form-label">가격</label> <input type="text"
						class="form-control" name="price">
				</div>
				<div class="mb-3">
					<label for="salePrice" class="form-label">할인가격</label> <input
						type="text" class="form-control" name="salePrice">
				</div>
				<div id="optionList">
					<div class="mb-3" id=option1>
						<label for="option1" class="form-label">필수옵션 이름</label> <input
							type="text" class="form-control" name="option1">
					</div>



				</div>
				<button id="optionAdd" type="button"
					class="btn btn-primary col-md-2">optionAdd</button>

				<button id="optionDelete" type="button"
					class="btn btn-danger col-md-2">optionDelete</button>

				<div id="fileList">
					<button type="button" class="btn btn-primary col-md-2" id="fileAdd">fileadd</button>
				</div>



				<button type="button" id="submitbtn"
					class="btn btn-outline-primary col col-md-2 offset-md-10">add
				</button>
			</form>
		</div>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/healthMachineAdd.js"></script>
	<script>
		setMax(1);
		setParam('Files');
	</script>
</body>
</html>