<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		.day_navigation{
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
 
 
 <h3 class="text-center">이달의 루틴 </h3><br><h3 class="text-center">Calendar</h3>

<form name="calendarFrm" id="calendarFrm" action="" method="GET">
<div class="calendar" >

	<!--날짜 네비게이션  -->
	<div class="day_navigation">
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
		<a class="before_after_month" href="./calendar?year=${today_info.after_year}&month=${today_info.after_month}">
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
<c:forEach items="${dateList}" var="dateData">
      <c:set var="hasData" value="false"/>
      <tr>
        <c:forEach items="${exercise}" var="dto">
          <c:if test="${dto.days == dateData.getDate()}">
            <td class="text-center">
              <strong>${dto.days}</strong>
              <div class="img rounded-circle mb-2" id="changeimg${dto.num}" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
              <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
            </td>
            <c:set var="hasData" value="true"/>
          </c:if>
        </c:forEach>
        <c:if test="${not hasData}">
          <td></td>
        </c:if>
      </tr>
    </c:forEach>
  </tbody>
 <%-- <c:set var="date" value="${dto.day}"/>
    <c:forEach begin="1" end="${totalDays}">
      <c:choose>
        <c:when test="${date == today}">
          <td class="today">
            <strong>${dto.days}</strong>
            <div class="img rounded-circle mb-2" id="changeimg" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
            <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
          </td>
        </c:when>
        <c:when test="${date.time == today.time}">
          </tr><tr><td>
            <strong>${dto.days}</strong>
            <div class="img rounded-circle mb-2" id="changeimg" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
            <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
          </td>
        </c:when>
        <c:when test="${date.time % 7 == 1}">
          <td class="sat">
            <strong>${dto.days}</strong>
             <div class="img rounded-circle mb-2" id="changeimg" style="background-image: url(/resources/routine/${dto.boardFileDTOs[0].oriName});"></div>
            <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
            </td>
            </c:when>
            </tr>
            </c:choose>
            </c:forEach>
            </tbody>
 --%>
	<%-- <tr>
		<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
			<c:choose>
				<c:when test="${dateList.value=='today'}">
					<td class="today">
						<div class="date">
							${dateList.date}
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
</tbody> --%>

</table>
</div>
</div>
</div>
</div>

</form>
</body>
</html>
