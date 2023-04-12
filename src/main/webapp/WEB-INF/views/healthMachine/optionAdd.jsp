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
			<h4 class="col-md-5 mx-auto text-center pb-3">물품 등록페이지</h4>
		</div>
		<div class="row col-md-7 mx-auto">
			<form action="./optionAdd" method="POST"
				enctype="multipart/form-data" id="frm">
				<div class="row text-center" id="optionSelect"
					data-machineNum="${dto.machineNum}">
					<input type="hidden" name="machineNum" value="${dto.machineNum}">

					<div class="mb-3 col-4 dropdown" id="opt1"
						data-optName="${dto.option1 }">
						<label for="optName1" class="form-label">${dto.option1} 작성</label>
						<input type="text" class="form-control optInput essential" name="optName1">
						 <div class="dropdown-menu">
							<ul style="list-style: none" id="optSelect1">
							<c:forEach items="${optList1}" var="option">
									<li class="dropdown-item cursor-pointer" id="op1"
										data-id="${option.optId1}" data-name="${option.optName1}">${option.optName1}</li>
								</c:forEach>
							</ul>
						</div> 
						<label for="optId1" class="form-label">option1 id 작성(영문)</label> <input
							type="text" class="form-control optInputId essential" name="optId1">

					</div>



					<c:if test="${not empty dto.option2}">
						<div class="mb-3 col-4 dropdown" id="opt2"
							data-optName="${dto.option2 }">
							<label for="optName2" class="form-label">${dto.option2}
								작성</label> <input type="text" class="form-control optInput essential"
								name="optName2">
								<div class="dropdown-menu">
							<ul style="list-style: none" id="optSelect2">
									<c:forEach items="${optList2}" var="option">
										<li class="dropdown-item cursor-pointer" id="op2"
											data-id="${option.optId2}" data-name="${option.optName2}">${option.optName2}</li>
									</c:forEach>
								</ul>
						</div> <label for="optId2" class="form-label">option2
								id 작성(영문)</label> <input type="text" class="form-control optInputId essential" name="optId2">
						</div>
					</c:if>
					<c:if test="${not empty dto.option3}">
						<div class="mb-3 col-4 dropdown"  id="opt3"
							data-optName="${dto.option3 }">
							<label for="optName3" class="form-label">${dto.option3}
								작성</label> <input type="text" class="form-control optInput essential"
								name="optName3"> 
								<div class="dropdown-menu">
								<ul style="list-style: none" id="optSelect3">
									<c:forEach items="${optList3}" var="option">
										<li class="dropdown-item cursor-pointer" id="op3"
											data-id="${option.optId3}" data-name="${option.optName3}">${option.optName3}</li>
									</c:forEach>
								</ul>
							</div>
						<label for="optId3" class="form-label">option3
								id 작성(영문)</label> <input type="text" class="form-control optInputId essential" name="optId3">
						</div>
					</c:if>
					<c:if test="${not empty dto.option4}">
						<div class="mb-3 col-4 dropdown"  id="opt4"
							data-optName="${dto.option4 }">
							<label for="optName4" class="form-label">${dto.option4}
								작성</label> <input type="text" class="form-control optInput essential" name="optName4">
								<div class="dropdown-menu ">
								<ul style="list-style: none" id="optSelect4">
									<c:forEach items="${optList4}" var="option">
										<li class="dropdown-item cursor-pointer" id="op4"
											data-id="${option.optId4}" data-name="${option.optName4}">${option.optName4}</li>
									</c:forEach>
								</ul>
							</div>
							<label for="optId4" class="form-label">option4 id 작성(영문)</label>
							<input type="text" class="form-control optInputId essential" name="optId4">
						</div>
					</c:if>
				</div>

				<div class="mb-3 col-4">
					<label for="stock" class="form-label">재고</label> <input type="text"
						class="form-control essential" name="stock">
				</div>


				

				<button type="button"
					class="btn btn-outline-primary col col-md-2 offset-md-10" id="submitbtn">add
				</button>
			</form>
		</div>
	</div>

	<c:import url="../template/common_js.jsp"></c:import>
	
	<script src="/resources/js/healthMachineAdd.js"></script>

</body>
</html>