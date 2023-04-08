<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>

<c:forEach items="${list}" var="dto">
	 <div>
         <label for="title" class="col-form-label">루틴 제목</label>
         <input type="text" class="form-control" id="routinetitle" name="title" value="${dto.title}">	
         <label for="startDay" class="col-form-label">시작 날짜</label>
         <input type="date" class="form-control" id="routinestartDay" name="startDay" value="${dto.startDay}">
         <label for="endDay" class="col-form-label">종료 날짜</label>
         <input type="date" class="form-control" id="routineendDay" name="endDay" value="${dto.endDay}">
         <label for="videoId" class="col-form-label">루틴영상URL</label>
         <input type="text" class="form-control" id="routinevideoId" name="videoId" value="${dto.videoId}"> 
         <label for="machineNum" class="col-form-label">운동기구</label>
         <input type="text" class="form-control" id="routinemachineNum" name="machineNum" value="${dto.machineNum}"> 
         <input type="hidden" id="routinenum" name="num" value="${dto.num}">
      </div>
</c:forEach>