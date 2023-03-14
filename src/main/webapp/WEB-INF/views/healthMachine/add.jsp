<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<h1 class="col-md-5 mx-auto text-center border border-primary pb-3">HealthMachine
				Addpage</h1>
		</div>
		<div class="row col-md-7 mx-auto">
			<form action="./add" method="POST" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="categoryNum" class="form-label">카테고리번호</label> <input
						type="text" class="form-control" name="categoryNum">
				</div>

				<div class="mb-3">
					<label for="machineName" class="form-label">기구명</label> <input
						type="text" class="form-control" name="machineName">
				</div>
				<div class="mb-3">
					<label for="machineDetail" class="form-label">상세설명</label>
					<textarea class="form-control" name="machineDetail" rows="3"></textarea>
				</div>
				<div class="mb-3">
					<label for="price" class="form-label">가격</label> <input type="text"
						class="form-control" name="price">
				</div>
				<div class="mb-3">
					<label for="stock" class="form-label">재고</label> <input type="text"
						class="form-control" name="stock">
				</div>

				<div class="form-check">
					<input class="form-check-input" type="radio" name="sale" value="1"
						checked> <label class="form-check-label"> 판매 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="sale" value="0">
					<label class="form-check-label"> 판매중단 </label>
				</div>
				<div id="fileList1">
					<div class="mb-3">
						<label for="files" class="form-label">이미지</label> <input
							type="file" class="form-control" id="files" name="files">
					</div>
				</div>
				<div id="fileList2">
					<div class="mb-3">
						<label for="files" class="form-label">이미지</label> <input
							type="file" class="form-control" id="files" name="files">
					</div>
				</div>
				<button type="submit"
					class="btn btn-outline-primary col col-md-2 offset-md-10">add
				</button>
			</form>
		</div>
	</div>


</body>
</html>