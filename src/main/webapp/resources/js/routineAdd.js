
//routineAdd 
$('#modalButtons').ready(function() {
    // 등록 버튼 클릭시
    $('#routineConfirm').click(function() {
      // 입력된 데이터 가져오기
      const title = $('#title').val();
      const startDay = new Date($('#startDay').val()); // Date 객체로 변환
      const endDay = new Date($('#endDay').val()); // Date 객체로 변환
      const videoId = $('#videoId').val();
      const machineNum = $('#machineNum').val();
  
      console.log(title);
      console.log(startDay);
      console.log(endDay);
      console.log(videoId);
      console.log(machineNum);
  
      // 데이터 전송
      $.ajax({
        url: '/routine/add',
        type: 'POST',
        data: {
          title: title,
          startDay: startDay, 
          endDay: endDay, 
          videoId: videoId,
          machineNum: machineNum
        },
        success: function(data) {
          console.log('성공');
          // 등록이 성공하면 모달을 닫고 화면을 리다이렉트
          $('#exampleModal').modal('hide');
           location.href = './calendar';
        },
        error: function() {
          console.log('실패');
          // 등록이 실패하면 에러 메시지 출력
          alert('등록에 실패했습니다.');
        }
      });
    });
});
$('#modalButtons').ready(function() {

    $('#updateBtn').click(function() {
        alert("수정하기");
     });
 });

$(document).ready(function(){
  // 모달 열기 버튼 클릭 이벤트
  $("#openModalBtn").click(function(){
    // 모달창을 생성할 HTML 코드
    var modalHtml = '<div id="myModal" class="modal">' +
                      '<div class="modal-dialog">' +
                        '<div class="modal-content">' +
                          '<div class="modal-header">' +
                            '<h4 class="modal-title">모달 제목</h4>' +
                            '<button type="button" class="close" data-dismiss="modal">&times;</button>' +
                          '</div>' +
                          '<div class="modal-body">' +
                            '<p>모달 내용</p>' +
                          '</div>' +
                          '<div class="modal-footer">' +
                            '<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>';
    // 모달창을 body에 추가
    $("body").append(modalHtml);
    // 모달 엘리먼트를 jQuery로 선택하여 show() 메소드를 이용하여 보여줌
    $("#myModal").modal("show");
  });
});

  // $("#categorySelect").change(function(){
//     $("#categoryId").val($("#categorySelect").val())
//     console.log($(this).val())
//     console.log($("#categoryId").val())
// })

// $(document).ready(function() {
//     // 등록 버튼 클릭시
//     $('#routineConfirm').click(function() {
//       // 입력된 데이터 가져오기
//       const title = $('#title').val();
//       const startDay = $('#startDay').val();
//       const endDay = $('#endDay').val();
//       const videoId = $('#videoId').val();
//       const machineNum = $('#machineNum').val();
//         console.log(title)
//         console.log(endDay)
//         console.log(machineNum)
//       // 데이터 전송
//       $.ajax({
//         url: '/routine/add',
//         type: 'POST',
//         data: {
//           title: title,
//           startDay: startDay,
//           endDay: endDay,
//           videoId: videoId,
//           machineNum: machineNum
//         },
//         success: function(data) {
//             console.log('성공')
//           // 등록이 성공하면 모달을 닫고 화면을 리다이렉트
//           $('#exampleModal').modal('hide');
//           location.href = './calendar';
//         },
//         error: function() {
//             console.log('실패')
//           // 등록이 실패하면 에러 메시지 출력
//           alert('등록에 실패했습니다.');
//         }
//       });
//     });
//   });

// $('#routineBtn').click(function(){
//     location.href="./add";
// });

  
  
  
  