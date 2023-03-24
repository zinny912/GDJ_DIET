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
			<h4 class="col-md-5 mx-auto text-center pb-3">물품
				등록페이지</h4>
		</div>
		<div class="row col-md-7 mx-auto">
			<form action="./optionAdd" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="machineNum" value="${dto.machineNum}">

				<div class="mb-3 col-4">
					<label for="optName1" class="form-label">${dto.option1} 작성</label>

					<div class="dropdown">
						<input type="text" class=""
							name="optName1" id="input1">
							
						<div class="dropdown-menu">
							<ul style="list-style: none">
								<c:forEach items="${optList}" var="opt">
								<li class="dropdown-item" value="${opt.optId1}"><a>${opt.optName1}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>


					<label for="optId1" class="form-label">option1 id 작성(영문)</label> <input
						type="text" class="form-control" name="optId1">
				</div>
				<div class="col-3"></div>
				<c:if test="${not empty dto.option2}">
					<label for="optName2" class="form-label">${dto.option2} 작성</label>
					<input type="text" class="form-control" name="optName2">
					<label for="optId2" class="form-label">option2 id 작성(영문)</label>
					<input type="text" class="form-control" name="optId2">
				</c:if>
				<c:if test="${not empty dto.option3}">
					<label for="optName3" class="form-label">${dto.option3} 작성</label>
					<input type="text" class="form-control" name="optName3">
					<label for="optId3" class="form-label">option3 id 작성(영문)</label>
					<input type="text" class="form-control" name="optId3">
				</c:if>
				<c:if test="${not empty dto.option4}">
					<label for="optName4" class="form-label">${dto.option4} 작성</label>
					<input type="text" class="form-control" name="optName4">
					<label for="optId4" class="form-label">option4 id 작성(영문)</label>
					<input type="text" class="form-control" name="optId4">
				</c:if>


				<div class="mb-3">
					<label for="stock" class="form-label">재고</label> <input type="text"
						class="form-control" name="stock">
				</div>


				<div id="fileList">
					<button type="button" class="btn btn-primary col-md-2" id="fileAdd">fileadd</button>
				</div>

				<button type="submit"
					class="btn btn-outline-primary col col-md-2 offset-md-10">add
				</button>
			</form>
		</div>
	</div>

	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/getOption.js"></script>
	<script src="/resources/js/healthMachineAdd.js"></script>
	<script>
		setMax(100);
		setParam('Files');
	</script>
</body>
</html>