// $.ajax({
//     type: 'GET',
//     url: '/calendar/list',
//     data: "{}",
//     success: function(response) {
//         result=response.result
//         for(i=0; i<result.length; i++){
//             calendar.addEvent({
//                 title:result[i]['title'],
//                 start:result[i]['start'],
//                 end:result[i]['end']
//             });

//         }
//       // 받아온 데이터를 FullCalendar의 events 속성에 추가
//       console.log('나와줘..');
//     }
//   });


//   document.addEventListener('DOMContentLoaded', function() {
//     var calendarEl = document.getElementById('calendar');
//     var calendar = new FullCalendar.Calendar(calendarEl, {
//         initialView: 'dayGridMonth',
//         locale: 'ko', // 한국어 설정
//         headerToolbar: {
//             start: "",
//             center: "prev title next",
//             end: 'dayGridMonth,dayGridWeek,dayGridDay'
//         },
//         selectable: true,
//         droppable: true,
//         editable: true,
//         events: [$.ajax({
//             type: 'GET',
//             url: './list',
//             success: function(response) {
//                 var events = response.map(function(event) {
//                     return {
//                         title: event.title,
//                         start: event.start,
//                         end: event.end,
//                         color: '#' + Math.round(Math.random() * 0xffffff).toString(16)
//                     };
//                 });
//                 calendar.addEventSource(events);
//             },
//             error: function(xhr, status, error) {
//                 console.error(error);
//             }];
//         });
//         calendar.render();
//         });   
      