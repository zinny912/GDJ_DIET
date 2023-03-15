<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				<div id="fileList">
					<button type="button" class="btn btn-primary col-md-2" id="fileAdd"
					>fileadd</button>
				</div>
				<div class="mb-3">
					<label for="machineName" class="form-label">상위옵션명</label> 
					<input type="text" class="form-control" name="topOptionName">
				</div>
				<div class="mb-3">
					<label for="machineName" class="form-label">하위옵션명</label> 
					<input type="text" class="form-control" name="bottomOptionName">
				</div>
				
				
				<button type="submit"
					class="btn btn-outline-primary col col-md-2 offset-md-10">add
				</button>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="/resources/js/healthMachineAdd.js"></script>
	<script>
		setMax(3);
		setParam('f');
	</script>
</body>
</html>