<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="com.goody.diet.exercise.ExerciseDTO"%>
<!DOCTYPE html>
<html>
 <head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
 <title>이달의 루틴</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 <c:import url="../template/header.jsp"></c:import>
 </head>
 <body>
 <div id='calendar'></div>
 
  <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">루틴 제목</label>
                        <input type="text" class="form-control" id="routinetitle" name="routinetitle">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="startDay" name="startDay">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="endDay" name="endDay">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>

 
 
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');
    const calendar = new FullCalendar.Calendar(calendarEl, {
      initialView : 'dayGridMonth',
      locale : 'ko', // 한국어 설정
      headerToolbar : {
        start : "",
        center : "prev title next",
        end : 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      selectable : true,
      droppable : true,
      editable : true,
      events : [
        <c:forEach var="dto" items="${exerciseList}">
          {
            title : '${dto.title}',
            start : '${dto.startDay}',
            end : '${dto.endDay}',
            color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
          },
        </c:forEach>
      ],
      
                      }
                  });
              }
          }
      },
      editable: true, // false로 변경 시 draggable 작동 x 
      displayEventTime: false // 시간 표시 x
  });
  calendar.render();

  });
	
 </script>
 

 
 
 
 <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
 <div class="overlay"></div>
 <div class="container">
 <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
 <div class="col-md-9 ftco-animate text-center">
 <h1 class="mb-3 bread">이달의 루틴</h1>
 <p class="breadcrumbs"><span class="mr-2"><a href="index.html">3월 루틴스터디</a></span><br> <span>황금골반, 일자다리</span></p>
 </div>
 </div>
 </div>
 </section>
 
 <section class="ftco-section">
 <div class="container">
 <div class="row justify-content-center mb-5 pb-3">
 <div class="col-md-12 heading-section ftco-animate text-center" style="line-height:5%">
 <h3 class="mb-1">이달의 루틴 </h3><br><h3>Calendar</h3>
 </div>
 </div>
 <table>
  <thead>
    <tr>
      <th>일</th>
      <th>월</th>
      <th>화</th>
      <th>수</th>
      <th>목</th>
      <th>금</th>
      <th>토</th>
    </tr>
  </thead>
 
  
 <div class="row">
 <div class="col-md-12">
 <div class="table-responsive">
 <table class="table table-bordered text-center">
 <thead>
 <tr class="bg-danger-subtle text-white">
 <th>SUN</th>
 <th>MON</th>
 <th>TUE</th>
 <th>WED</th>
 <th>THUR</th>
 <th>FRI</th>
 <th>SAT</th>
 </tr>
 <tr class="bg-primary text-white">
 <th>상체 올케어</th>
 <th>허벅지사이 & 종아리알</th>
 <th>볼록앞벅지 제거</th>
 <th>황금골반</th>
 <th>상체 올케어</th>
 <th>허벅지사이 & 종아리알</th>
 <th>하체 올케어</th>
 </tr>
 </thead>
 <tbody>
 <tr>
 <td class="text-center">
 <strong> </strong>
 <div class="img rounded-circle mb-2" style="background-image: "></div>
 <a href="" class="videoId" data-day="1"><strong> </strong></a>
 </td>
 <td class="text-center">
 <strong> </strong>
 <div class="img rounded-circle mb-2" style="background-image: "></div>
 <a href="" class="videoId" data-day="1"><strong> </strong></a>
 </td>
 <td class="text-center">
 <strong> </strong>
 <div class="img rounded-circle mb-2" style="background-image: "></div>
 <a href="" class="videoId" data-day="1"><strong> </strong></a>
 </td>
 <td class="text-center">
 <strong>1일차</strong>
 <div class="img rounded-circle mb-2" style="background-image: url(/resources/images/leg1.png);"></div>
 <a href="./video?num=${dto.num}" class="videoId" data-day="1"><strong>{dto.title}</strong></a>
 </td>
 <td class="text-center">
 <strong class="day">2일차</strong>
 <div class="img rounded-circle mb-2" style ="background-image: url(/resources/images/classes-2.jpg);"></div>
 <a href="/exercise/video?days=2일차" class="videoId" data-day="2"><strong>승마살 싹뚝루틴</strong></a>
 </td>
 
 <div class="mb-3">
				<label for="studyName" class="form-label">스터디 이름</label> 
				<input type="text" name="studyName" class="form-control" id="studyName" placeholder="온라인 스터디 입력">
			</div>
 
 
 
 </tbody>
 
  <tbody>
  <c:forEach items="${exercise}" var="dto" varStatus="status">
    <c:if test="${dto.days == '1일차'}">
     	 <c:set var="colspan" value="true" /> <!-- 맨 앞에 3칸의 빈 셀을 만듦 -->
    </c:if>
     
    <c:choose>
      <c:when test="${colspan}"> 
        <tr>
        <td></td>
        <td></td>
        <td></td>
        
        <td class="text-center">
          <strong>${dto.days}</strong>
          <div class="img rounded-circle mb-2" id="changeimg" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
          <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
        </td>
        <c:set var="colspan" value="flase" />
        
      </c:when>     
      <c:otherwise> 
          <c:if test="${status.index % 7 == 4}">
              <tr>
          </c:if> 	
        	<td class="text-center">
	          <strong>${dto.days}</strong>
	          <div class="img rounded-circle mb-2" id="changeimg${dto.num}" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
	          <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
	        </td>
     	 </c:otherwise>
    </c:choose>
    <c:if test="${status.index % 7 == 3}">
      </tr>
    </c:if>
  </c:forEach>
</tbody>

 <tfoot>
 <tr>
 <th><a href="#"><i class="ion-ios-arrow-round-back"></i> September</a></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th><a href="#">November <i class="ion-ios-arrow-round-forward"></i></a></th>
 </tr>
 </tfoot>
 </table>
 </div>
 </div>
 </div>
 </div>
 </section> 
 
 
 <!-- loader -->
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<script src="/resources/js/video.js"></script>
<script src="/resources/js/calendar/calendar.js"></script>
<script src="/resources/js/calendar/data.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import> 
 </body>
</html>