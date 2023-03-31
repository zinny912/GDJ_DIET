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
 <link rel="stylesheet" href="/resources/css/calendar/calendar.css">
 <link rel="stylesheet" href="/resources/css/calendar/reset.css">
 <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
 </head>
 
 <body>

<!-- <body>
<header>
  <h1>
    <i class="far fa-calendar-check"></i>
    <span>캘린더</span>
  </h1>
  <div class="calendar_title">
    <button class="prev">&#60;</button>
    <span class="current-year-month"></span>
    <button class="next">&#62;</button>
  </div>
</header>
<section class="content-left">
  <div class="left-main">
    <div class="main-wrap">
      <div class="main-day"></div>
      <div class="main-date"></div>
    </div>
    <div class="todo-wrap">
      <div class="todo-title">Todo List</div>
      <form class="input-form">
        <input type="text" placeholder="write here!!" class="input-box" />
        <button type="submit" class="input-btn clickBtn">INPUT</button>
      </form>
      <ul class="todoList"></ul>
      <div class="showList">
        <span class="listText"></span>
        <span class="createDate"></span>
        <button class="closed">close</button>
      </div>
      <div class="bgblack"></div>
    </div>
  </div>
</section>
<section class="content-right">
    <div class="day-of-week">
      <div class="dayHeader sun">Sun</div>
      <div class="dayHeader">Mon</div>
      <div class="dayHeader">Tue</div>
      <div class="dayHeader">Wed</div>
      <div class="dayHeader">Thu</div>
      <div class="dayHeader">Fri</div>
      <div class="dayHeader sat">Sat</div>
    </div>
    <div class="calendar-body"></div>
</section>
 -->

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