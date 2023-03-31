<%@page import="com.goody.diet.calendar.CalendarDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
 <title>이달의 루틴</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 
 <c:import url="../template/header.jsp"></c:import>
 <link rel="stylesheet" href="/resources/css/routine.css">
 <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
 <script>
 // 서버로부터 데이터를 가져와서 FullCalendar에 추가
	    
 document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar');
        const calendar = new FullCalendar.Calendar(calendarEl, {
        	  locale : 'ko',
    	      initialView: 'dayGridMonth', 
    	      navLinks: true, // can click day/week names to navigate views
    	      selectable: true,
    	      selectMirror: true,
    	      droppable : true,
    	  	  editable : true,
    	  	  events : [ 
    	    	    <%List<CalendarDTO> list = (List<CalendarDTO>) request.getAttribute("list");%>
    	            <%if (list != null) {%>
    	            <%for (CalendarDTO dto : list) {%>
    	            {
    	            	title : '<%=dto.getTitle()%>',
    	                start : '<%=dto.getStart()%>',
    	                end : '<%=dto.getEnd()%>',
    	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
    	             },
    		<%}
    	}%>
    		],
    		headerToolbar: {
       	        right: 'today prev,next',
       	        center: 'addEventButton' // headerToolbar에 버튼을 추가
        	    },
    	      customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                    click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#calendarModal").modal("show"); // modal 나타내기
                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                            const content = $("#title").val();
                            const start = $("#start").val();
                            const end = $("#end").val();
                            
                            //내용 입력 여부 확인
                            if(content == null || content == ""){
                                alert("내용을 입력하세요.");
                            }else if(start_date == "" || end_date ==""){
                                alert("날짜를 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            }else{ // 정상적인 입력 시
                                const obj = {
                                    "title" : title,
                                    "start" : start,
                                    "end" : end
                                }//전송할 객체 생성

                                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
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
    <style>
        #calendarBox{
           position:relative;
           width:100%;
           padding:5%;
           justify-content: center;  
        }
        .calendar{
        	font-weight:bold;
        	font-size: 20px;
        }

    </style>
 </head>
 <body>
 <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">루틴을 등록하세요</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title" class="col-form-label">루틴 제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="start" name="start">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="end" name="end">
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

 <section class="hero-wrap hero-wrap-2" data-stellar-background-ratio="0.5">
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
 <div id="calendarBox">
	 <div id='calendar'></div>
 </div>
 </div>
 </section>
 

<%--  <section class="ftco-section">
 <div class="container">
 <div class="row justify-content-center mb-5 pb-3">
 <div class="col-md-12 heading-section ftco-animate text-center" style="line-height:5%">
 <h3 class="mb-1">이달의 루틴 </h3><br><h3>Calendar</h3>
 </div>
 </div>
 
 
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
  <c:forEach items="${routine}" var="dto" varStatus="status">
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
 </section> --%>
 
 
 <!-- loader -->
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<!-- <script src="/resources/js/video.js"></script>
<script src="/resources/js/routine.js"></script> -->  
 

<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import> 
 </body>
</html>