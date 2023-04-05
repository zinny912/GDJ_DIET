<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="com.goody.diet.exercise.RoutineDTO"%>
<!DOCTYPE html>
<html>
 <head>
 <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>

 <title>이달의 루틴</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 <c:import url="../template/header.jsp"></c:import>
 </head>
 <body>

<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
	
	const draggableEl = document.getElementById('mydraggable');
    const calendarEl = document.getElementById('calendar');
    const calendar = new FullCalendar.Calendar(calendarEl, {
      initialView : 'dayGridMonth',
      initialDate : '2022-12-31',
      locale : 'ko', // 한국어 설정
      customButtons: {
    	    myCustomButton: {
    	      text: '루틴일정추가',
    	      click: function() {
    	        alert('clicked the custom button!');}
    	    }
      },
      
      
      headerToolbar : {
        start : "today myCustomButton",
        center : "title",
        end : "prev next",
        
      },
      selectable : true,
      droppable : true,
      draggbable: true,
     	
      editable : true,
      events : [
        <c:forEach var="dto" items="${routine}">
          {
            title : '${dto.title}',
            start : '${dto.startDay}',
            end : '${dto.endDay}',
            url : 'http://localhost/routine/video?num=${dto.num}',
            color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
          },
        </c:forEach>
      ],
      eventClick: function(info) {
    	    alert(info.event.title + ':' + '수강하시겠습니까?');
    	    // change the border color just for fun
    	    info.el.style.borderColor = 'red';
    	  }, 
    
      displayEventTime: false, // 시간 표시 x
      dateClick: function() {
    	    alert('출석체크하시겠습니까?');
    	  },
    	  select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
    		  var title = prompt('일정을 입력해주세요.');
              if (title) {
                  calendar.addEvent({
                      title: title,
                      start: arg.start,
                      end: arg.end,
                      allDay: arg.allDay,
                  })
              }
              var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)

              var events = new Array(); // Json 데이터를 받기 위한 배열 선언
              for (var i = 0; i < allEvent.length; i++) {
                  var obj = new Object();     // Json 을 담기 위해 Object 선언
                  // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                  obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                  obj.start = allEvent[i]._instance.range.start; // 시작
                  obj.end = allEvent[i]._instance.range.end; // 끝

                  events.push(obj);
              }
              var jsondata = JSON.stringify(events);
              console.log(jsondata);
              // saveData(jsondata);

              $(function saveData(jsondata) {
                  $.ajax({
                      url: "/add",
                      method: "POST",
                      dataType: "json",
                      data: JSON.stringify(events),
                      contentType: 'application/json',
                  })
                      .done(function (result) {
                          // alert(result);
                      })
                      .fail(function (request, status, error) {
                           alert("에러 발생" + error);
                      });
                  calendar.unselect()
              });
          },

  	});
  calendar.render();

  });

 </script>
  
 <div class="container">
 <div class="row justify-content-center mb-5 pb-3">
 <div class="col-md-12 heading-section ftco-animate text-center" style="line-height:5%">
 <h3 class="mb-1">이달의 루틴 </h3><br><h3>Calendar</h3>
 </div>
 </div>
 


 <form action="./add" method="POST" enctype="multipart/form-data">
 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">루틴일정 추가</button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">루틴을 등록하세요!</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <label for="title" class="col-form-label">루틴 제목</label>
         <input type="text" class="form-control" id="title" name="title" value="title">
         <label for="startDay" class="col-form-label">시작 날짜</label>
         <input type="date" class="form-control" id="startDay" name="startDay" value="startDay">
         <label for="endDay" class="col-form-label">종료 날짜</label>
         <input type="date" class="form-control" id="endDay" name="endDay" value="endDay">
         <label for="videoId" class="col-form-label">루틴영상URL</label>
         <input type="text" class="form-control" id="videoId" name="videoId" value="videoId"> 
         <label for="machineNum" class="col-form-label">운동기구</label>
         <input type="text" class="form-control" id="machineNum" name="machineNum" value="machineNum"> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">일정추가 확인</button>
      </div>
    </div>
  </div>
</div> 
</form>

 <div>
 
<div id='calendar'></div>
 </div>
 </div>


<!--  
 <td class="text-center">
 <strong class="day">2일차</strong>
 <div class="img rounded-circle mb-2" style ="background-image: url(/resources/images/classes-2.jpg);"></div>
 <a href="/exercise/video?days=2일차" class="videoId" data-day="2"><strong>승마살 싹뚝루틴</strong></a>
 </td> -->
 
<!--  <div class="mb-3">
				<label for="studyName" class="form-label">스터디 이름</label> 
				<input type="text" name="studyName" class="form-control" id="studyName" placeholder="온라인 스터디 입력">
			</div>
 
  -->
        
        <%-- <td class="text-center">
          <strong>${dto.days}</strong>
          <div class="img rounded-circle mb-2" id="changeimg" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
          <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
        </td> --%>
      


 
 
 <!-- loader -->
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="/resources/js/video.js"></script>
<script src="/resources/js/routineAdd.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>