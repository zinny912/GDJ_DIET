// function addClickHandler() {
//   let img = document.querySelector('#changeimage${dto.num}');
//   img.addEventListener('click', function() {
//     swal('수강완료!','재수강하시겠습니까?', 'success');
//   });
// }






// // 달력 생성 함수
// function createCalendar(year, month) {
//     // 달력 영역 선택
//     const calendar = document.querySelector("#calendar");
  
//     // 날짜 정보 초기화
//     const date = new Date(year, month - 1);
//     const firstDay = new Date(year, month - 1, 1).getDay();
//     const lastDay = new Date(year, month, 0).getDate();
  
//     // 날짜 채우기
//     let day = '1일차';
//     for (let i = 0; i < 7; i++) {
//       for (let j = 0; j < 7; j++) {
//         const cell = document.createElement("div");
//         cell.classList.add("cell");
//         if (i === 0) {
//           cell.innerText = ["일", "월", "화", "수", "목", "금", "토"][j];
//         } else if (i === 1 && j >= firstDay) {
//           const img = document.createElement("img");
//           img.src = "url(/resources/images/day1.png)";
//           const link = document.createElement("a");
//           link.href = "./video.jsp";
//           link.appendChild(img);
//           cell.appendChild(link);
//           day++;
//         } else if (i > 1 && day <= lastDay) {
//           cell.innerText = day;
//           day++;
//         }
//         calendar.appendChild(cell);
//       }
//     }
//   }
  
//   // 현재 날짜를 기준으로 달력 생성
//   const now = new Date();
//   createCalendar(now.getFullYear(), now.getMonth() + 1);
  


 