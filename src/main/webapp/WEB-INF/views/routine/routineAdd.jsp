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
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">
	<div class="row justify-content-center">
		<h1 class="col-md-7 my-5 text-center">루틴일정 등록</h1>
	</div>	
	</div>
	
<!-- <div class="col-md-7 mx-auto">
<form action="./routineadd" method="POST" enctype="multipart/form-data">
	<div class="row justify-content-center">
 		<label for="title" class="col-form-label">루틴 제목</label>
         <input type="text" class="form-control" id="title" name="title">
        <label for="startDay" class="col-form-label">시작 날짜</label>
         <input type="date" class="form-control" id="startDay" name="startDay">
         <label for="endDay" class="col-form-label">종료 날짜</label>
         <input type="date" class="form-control" id="endDay" name="endDay">
         <label for="startDay" class="col-form-label">시작 날짜</label>
         <input type="text" class="form-control" id="startDay" name="startDay">
         <label for="endDay" class="col-form-label">종료 날짜</label>
         <input type="text" class="form-control" id="endDay" name="endDay">
         <label for="videoId" class="col-form-label">루틴영상URL</label>
         <input type="text" class="form-control" id="videoId" name="videoId"> 
         <label for="machineNum" class="col-form-label">운동기구</label>
         <input type="text" class="form-control" id="machineNum" name="machineNum"> 
	</div>
     <button type="submit" class="btn btn-primary">등록</button>
	
</form>
</div> -->




 <!-- <button type="button" id="routineBtn"class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">루틴 일정추가</button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">루틴을 등록하세요!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <label for="title" class="col-form-label">루틴 제목</label>
         <input type="text" class="form-control" id="title" name="title">
         <label for="startDay" class="col-form-label">시작 날짜</label>
         <input type="date" class="form-control" id="startDay" name="startDay">
         <label for="endDay" class="col-form-label">종료 날짜</label>
         <input type="date" class="form-control" id="endDay" name="endDay">
         <label for="videoId" class="col-form-label">루틴영상URL</label>
         <input type="text" class="form-control" id="videoId" name="videoId"> 
         <label for="machineNum" class="col-form-label">운동기구</label>
         <input type="text" class="form-control" id="machineNum" name="machineNum"> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">취소</button>
        <button type="submit" class="btn btn-primary" id="routineConfirm">등록</button>
      </div>
      
    </div>
  </div>
</div> 
</form> -->

<%-- <form action="./add" method="POST" enctype="multipart/form-data" id="frm">
				<div class="mb-3" id="machineList">
					<label for="machineNum" class="form-label">운동기</label>
					
					 <select class="form-select" id="machineSelect" name="healthMachineDTOs">
					
						<c:forEach items="${machine}" var="dto">
						
							<option value="${dto.machineNum}">${dto.machineName}</option>
						</c:forEach>
					</select>
				</div>
				
				</form> --%>
<c:import url="../template/common_js.jsp"></c:import>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>