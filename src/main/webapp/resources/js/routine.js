// document.addEventListener('DOMContentLoaded', function() {
// 	var calendarEl = document.getElementById('calendar');
// 	var calendar = new FullCalendar.Calendar(calendarEl, {
// 		initialView : 'dayGridMonth',
// 		locale : 'ko', // 한국어 설정
// 		headerToolbar : {
//         	start : "",
//             center : "prev title next",
//             end : 'dayGridMonth,dayGridWeek,dayGridDay'
//             },
// 	selectable : true,
// 	droppable : true,
// 	editable : true,
// 	events : [ 
//     	    <%List<Calendar> calendarList = (List<Calendar>) request.getAttribute("calendarList");%>
//             <%if (calendarList != null) {%>
//             <%for (Calendar dto : calendarList) {%>
//             {
//             	title : '<%=dto.getCalendarTitle()%>',
//                 start : '<%=dto.getCalendarStart()%>',
//                 end : '<%=dto.getCalendarEnd()%>',
//                 color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
//              },
// 	<%}
//     }%>
// 				]
				
// 			});
// 			calendar.render();
// 		});