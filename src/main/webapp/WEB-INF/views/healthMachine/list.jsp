<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>리스트</title>

<c:import url="../template/common_css.jsp"></c:import>
<c:import url="../template/header.jsp"></c:import>
 <link href="../resources/css/mlist.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
	 <div class="row justify-content-center mb-5 pb-3">
 	 <div class="col-md-12 heading-section ftco-animate text-center" style="line-height:5%">
 	 <h3 class="mb-1"><br>홈트용품 & 액세서리</h3><br><br>
 	</div></div></div>
	
	
			<div>
				<c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
					<a href="./add" class="btn btn-primary">운동기구 추가하기</a>
				</c:if>
			</div>
			
	<section class="ftco-section" id="box">
		<div class="row">
			<div class="container" id="one">
				<div class="first">
				<div> <p>카테고리 리스트</p> </div>
				
				
				
				</div>
				<div class="second">
				
				<c:forEach items="${list}" var="dto">
				<div class="col-md-3">
					<div class="classes w-70 ftco-animate">
						<a href="./detail?machineNum=${dto.machineNum }" class="img w-70 mb-2"
							style="background-image: url(/resources/images/${dto.healthMachineImgDTOs[0].fileName});"></a>
						<div class="text w-70 text-center">
							<h3>
								<a href="./detail?machineNum=${dto.machineNum }">${dto.machineName }</a>
							</h3>
							<p id=price>${dto.price }</p>
							<h5>${dto.salePrice }</h5>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			</div>
			
		</div>
	</section>


	<%-- <div class="container-fluid">
		<div class="row mb-4 mt-4 md-7">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>NUM</th>
						<th>category</th>
						<th>machinename</th>
						<th>score</th>
						<th>price</th>

						<th>saleprice</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.machineNum }</td>
							<td>${dto.categoryNum }</td>
							<td><a href="./detail?machineNum=${dto.machineNum }">${dto.machineName }</a></td>
							<td>${dto.machineScore }</td>
							<td>${dto.price }</td>
							<td>${dto.salePrice }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div> --%>
	
	<c:import url="../template/common_js.jsp"></c:import>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>