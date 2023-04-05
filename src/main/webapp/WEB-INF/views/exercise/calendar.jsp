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

<%@page import="java.util.Calendar"%>


	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {font-family: ; font-size: 9pt; color:#595959;}
		th {font-family: ; font-size: 9pt; color:#000000;}
		select {font-family: ; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
		A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
		.day{
			width:100px; 
			height:30px;
			font-weight: bold;
			font-size:15px;
			font-weight:bold;
			text-align: center;
		}
		.sat{
			color:#529dbc;
		}
		.sun{
			color:red;
		}
		.today_button_div{
			float: top;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}
		.calendar{
			width:100%;
			margin:auto;
		}
		.navigation{
			margin-top:10px;
			margin-bottom:30px;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			margin-bottom: ;
			border-collapse: collapse;
		}
		.calendar_body .today{
			border:1px solid white;
			height:120px;
			background-color:#c9c9c9;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .date{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sat_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align:left;
			vertical-align: top;
		}
		.calendar_body .sat_day .sat{
			color: #529dbc; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sun_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .sun_day .sun{
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .normal_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			vertical-align: top;
			text-align: left;
		}
		
		.calendar_body .routineList{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		.before_after_year{
			font-weight: bold;
		}
		.this_month{
			margin: 10px;
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
                    <h5 class="modal-title" id="exampleModalLabel">루틴을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">루틴 제목</label>
                        <input type="text" class="form-control" id="title" name="title">
                        <label for="taskId" class="col-form-label">날짜</label>
                        <input type="date" class="form-control" id="day" name="day">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
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

 
 <h3 class="text-center">이달의 루틴 </h3><br><h3 class="text-center">Calendar</h3>

<form name="calendarFrm" id="calendarFrm" action="" method="GET">
<div class="calendar" >

	<!--날짜 네비게이션  -->
	<div class="navigation">
		<a class="before_after_year" href="./calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
			<<
		<!-- 이전해 -->
		</a> 
		<a class="before_after_month" href="./calendar?year=${today_info.before_year}&month=${today_info.before_month}">
			<
		<!-- 이전달 -->
		</a> 
		<span class="this_month">
			&nbsp;${today_info.search_year}. 
			<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
		</span>
		<a class="before_after_month" href="./calendar?year=${today_info.after_year}&month=${today_info.search_month+1}">
		<!-- 다음달 -->
			>
		</a> 
		<a class="before_after_year" href="./calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
			<!-- 다음해 -->
			>>
		</a>
	</div>

<div class="today_button_div">
<input type="button" class="today_button" onclick="javascript:location.href='./calendar'" value="go today"/> 
 </div> 
 
<div class="routinebtn">
<input type="button" class="btn btn-warning" id="routineAdd">
  
 <div class="row">
 <div class="col-md-12">
 <div class="table-responsive">
 <table class="table table-bordered text-center calendar_body">
 <thead>
 <tr class="bg-danger-subtle text-white">
 <th class="day sun">SUN</th>
 <th class="day">MON</th>
 <th class="day">TUE</th>
 <th class="day">WED</th>
 <th class="day">THUR</th>
 <th class="day">FRI</th>
 <th class="day sat">SAT</th>
 </tr>
 <tr class="bg-primary text-white">
 <th class="day2">상체 올케어</th>
 <th class="day2">허벅지사이 & 종아리알</th>
 <th class="day2">볼록앞벅지 제거</th>
 <th class="day2">황금골반</th>
 <th class="day2">상체 올케어</th>
 <th class="day2">허벅지사이 & 종아리알</th>
 <th class="day2">하체 올케어</th>
 </tr>
 </thead>
 </table>
<table class="calendar_body">
<thead>
	<tr bgcolor="#CECECE">
	</tr>
</thead>
<tbody>
    <tr>
        <c:forEach var="date" items="${dateList}" varStatus="date_status"> 
            <c:choose>
                <c:when test="${date.value=='today'}">
                    <td class="today">
                        <div class="date">
                            ${date.date}
                        </div>
                        <div>
                            <!-- 운동 리스트 출력 -->
                            <c:forEach var="exercise" items="${exerciseList}" varStatus="exercise_status">
                                <c:if test="${exercise.startDay == date.date}">
                                    <div>${exercise.title}</div>
                                </c:if>
                            </c:forEach>
                            <div>
                            ${date.value}
                        </div>
                        </div>
                    </td>
                </c:when>
                <c:when test="${date_status.index%7==6}">
                    <td class="sat_day">
                        <div class="sat">
                            ${date.date}
                        </div>
                        <div>
                            <!-- 운동 리스트 출력 -->
                            <c:forEach var="exercise" items="${exerciseList}" varStatus="exercise_status">
                                <c:if test="${exercise.startDay == date.date}">
                                    <div>랄랄</div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </td>
                </c:when>
                <c:when test="${date_status.index%7==0}">
                </tr>
                <tr>    
                    <td class="sun_day">
                        <div class="sun">
                            ${date.date}
                        </div>
                        <div>
                            <!-- 운동 리스트 출력 -->
                            <c:forEach var="exercise" items="${exerciseList}" varStatus="exercise_status">
                                <c:if test="${exercise.startDay == date.date}">
                                    <div>${exercise.title}</div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </td>
                </c:when>
                <c:otherwise>
                    <td class="normal_day">
                        <div class="date">
                            ${date.date}
                        </div>
                        <div>
                            <!-- 운동 리스트 출력 -->
                            <c:forEach var="exercise" items="${exerciseList}" varStatus="exercise_status">
                                <c:if test="${exercise.startDay == date.date}">
                                    <div>${exercise.title}</div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </td>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </tr>
</tbody>

 <tbody>
	<tr>
		<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
			<c:choose>
				<c:when test="${dateList.value=='today'}">
					<td class="today">
						<div class="date" >
							${dateList.date}	
						</div>
						
						<div>
							
							</div>
						
						<div>
						</div>
					</td>
				</c:when>
				<c:when test="${date_status.index%7==6}">
					<td class="sat_day">
						<div class="sat">
							${dateList.date}
						</div>
						<div>
						</div>
					</td>
				</c:when>
				<c:when test="${date_status.index%7==0}">
	</tr>
	<tr>	
		<td class="sun_day">
			<div class="sun">
				${dateList.date}
			</div>
			<div>
			</div>
		</td>
				</c:when>
				<c:otherwise>
		<td class="normal_day">
			<div class="date">
				${dateList.date}
			</div>
			<div>
			
			</div>
		</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
</tbody>

</table>
<div class="schudule_button_div">
	<button type="button" class="board_move openMask_board_move pointer">일정추가</button>
</div>
</form>
<div id="mask_board_move"></div>
	<div class="normal_move_board_modal">
		<script>
			$(function() {
			    $( "#testDatepicker" ).datepicker({
			    	
			        dateFormat: "yy-mm-dd",
			    	changeMonth: true, 
			        changeYear: true,
			        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
			        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
			    });
			});
			function scheduleAdd(){
				var schedule_add_form = document.schedule_add;
				if(schedule_add_form.schedule_date.value==""||schedule_add_form.schedule_date.value==null){
					alert("날짜를 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				}else if(schedule_add_form.schedule_subject.value==""||schedule_add_form.schedule_subject.value==null){
					alert("제목을 입력해주세요.");
					schedule_add_form.schedule_date.focus();
					return false;
				}
				schedule_add_form.submit();
			}
		</script>
	
<div class="top" style="">
			<div class="close" >
				x
			</div>
			<div class="subject">
				스케쥴 등록
			</div>
		</div>
		
		<div class="bottom">
			<div class="info">
				* 순번은 해당 날짜안에서 순서데로 입력이 됩니다.(하루에 최대 4개의 스케쥴만 등록할 수 있습니다.)
			</div>
			<form name="schedule_add" action="schedule_add.do">
				<input type="hidden" name="year" value="${today_info.search_year}" />
				<input type="hidden" name="month" value="${today_info.search_month-1}" />
				<div class="contents">
					<ul>
						<li>
							<div class="text_subject">순번 :</div> 
							<div class="text_desc">
								<input type="text" name="schedule_num"  class="text_type1" />
							</div>
						</li>
						<li>
							<div class="text_subject">날짜 :</div> 
							<div class="text_desc">
								<input type="text" name="schedule_date" class="text_type1" id="testDatepicker" readonly="readonly" />
							</div>
						</li>
						<li>	
							<div class="text_subject">제목 :</div> 
							<div class="text_desc">
								<input type="text" name="schedule_subject" class="text_type1" />
							</div>
						</li>	
						<li>
							<div class="text_subject">내용 :</div> 
							<div class="text_area_desc">
								<textarea name="schedule_desc" class="textarea_type1" rows="7"></textarea>
							</div>
						</li>
						<li class="button_li">
							<button type="button" class="board_move_go pointer" onclick="scheduleAdd();">일정등록</button>
						</li>
					</ul>
					
				</div>
			</form>
		</div>
		
	</div>
	
	
</body>
</html>

</div>
</div>
</div>
</div>

</form>
</body>
</html>
