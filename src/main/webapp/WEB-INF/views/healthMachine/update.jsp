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
				Update page</h1>
		</div>
		<div class="row col-md-7 mx-auto">
			<form action="./update" method="POST" enctype="multipart/form-data"
				id="frm">
				<input type="hidden" value="${dto.machineNum}" id="machineNum"
					name="machineNum">
				<div class="mb-3" id="categoryList">
					<label for="categoryNum" class="form-label">카테고리</label>

					<c:forEach items="${dto.categoryDTO }" var="category">
						<div class="input-group mb-1">
							<input type="text" class="form-control"
								value="${category.categoryName }" readonly="readonly"
								disabled="disabled"> <input type="hidden"
								class="form-control" value="${category.categoryNum }"
								readonly="readonly" name="categoryDTOs">
							<button class="btn btn-outline-danger categoryDel" type="button"
								data-category-num="${category.categoryNum }">X</button>
						</div>
					</c:forEach>


				</div>
				<div id="categorybtn">
					<button type="button" class="btn btn-primary" id="categoryAdd">카테고리추가</button>
					<!-- <button type="button" class="btn btn-danger" id="categoryDelete">카테고리 삭제</button> -->
				</div>
				<input type="hidden" value="${dto.machineNum}" id="machineNum">
				<div class="mb-3">
					<label for="machineName" class="form-label">기구명</label> <input
						type="text" class="form-control" name="machineName"
						value="${dto.machineName }">
				</div>

				<div class="mb-3">
					<label for="price" class="form-label">가격</label> <input type="text"
						class="form-control" name="price" value="${dto.price }">
				</div>
				<div class="mb-3">
					<label for="salePrice" class="form-label">할인가격</label> <input
						type="text" class="form-control" name="salePrice"
						value="${dto.salePrice }">
				</div>
				<div id="optionList">
					<div class="mb-3" id=option1>
						<label for="option1" class="form-label options">옵션1 이름</label> <input
							type="text" class="form-control" name="option1"
							value="${dto.option1 }">
					</div>
					<c:if test="${not empty dto.option2 }">
						<div class="mb-3" id=option2>
							<label for="option2" class="form-label options">옵션2 이름</label> <input
								type="text" class="form-control" name="option2"
								value="${dto.option2 }">
						</div>
					</c:if>
					<c:if test="${not empty dto.option3 }">
						<div class="mb-3" id=option3>
							<label for="option3" class="form-label options">옵션3 이름</label> <input
								type="text" class="form-control" name="option3"
								value="${dto.option3 }">
						</div>
					</c:if>
					<c:if test="${not empty dto.option4 }">
						<div class="mb-3" id=option4>
							<label for="option4" class="form-label options">옵션4 이름</label> <input
								type="text" class="form-control" name="option4"
								value="${dto.option4 }">
						</div>
					</c:if>

				</div>
				<button id="optionAdd" type="button"
					class="btn btn-primary col-md-2">optionAdd</button>

				<button id="optionDelete" type="button"
					class="btn btn-danger col-md-2">optionDelete</button>

				<div class="mb-3 imageList">
					<div id="thumnailFile">
						<c:if test="${not empty dto.healthMachineImgDTOs[0]}">
							<div class="input-group mb-3 my-3 thumnail">
								<div class="input-group-text">
									<input class="form-check-input mt-0 deleteCheck"
										type="checkbox" id="thumnailCheck"
										value="${dto.healthMachineImgDTOs[0].fileNum}" name="fileNum">
								</div>
								<input type="text" disabled
									value="${dto.healthMachineImgDTOs[0].oriName}"
									class="form-control">
							</div>
						</c:if>
						<input type="hidden"
							value="${dto.healthMachineImgDTOs[0].fileNum }"
							name="thumnailNum">
					</div>
					<button class="btn btn-outline-primary col-md-2" type="button"
						id="thumnailbtn">썸네일</button>
					<br>
					<div id="fileList">
						<c:if test="${not empty dto.healthMachineImgDTOs[1]}">
							<c:forEach items="${dto.healthMachineImgDTOs}" var="images"
								begin="1">
								<div class="input-group mb-3 my-3 fileList">
									<div class="input-group-text">
										<input class="form-check-input mt-0 deleteCheck"
											type="checkbox" value="${images.fileNum}" name="fileNum">
									</div>
									<input type="text" disabled value="${images.oriName}"
										class="form-control">
								</div>
							</c:forEach>
						</c:if>
					</div>
					<button type="button" class="btn btn-primary col-md-2" id="fileAdd">fileadd</button>
				</div>
				<br>
				<div class="mb-3" id="realMachineList">
				
				</div>


				<button type="button" id="submitbtn"
					class="btn btn-outline-primary col col-md-2 offset-md-10">update
				</button>
			</form>
			<div class="text-center" id="optionSelect"
				data-machineNum="${dto.machineNum}">
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
		</div>
	</div>
	<c:import url="../template/common_js.jsp"></c:import>
	<script src="/resources/js/healthMachineUpdate.js"></script>
	
	<script>
		
		setParam('Files');
	</script>
</body>
</html>