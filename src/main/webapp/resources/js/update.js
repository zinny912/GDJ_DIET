$(document).ready(function(){
    // 모달 열기 버튼 클릭 이벤트
    $("#openModalBtn").click(function(){
      // 모달창을 생성할 HTML 코드
      const modalHtml = '<div class="modal fade" id="upModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">' + 
                        '<div class="modal-dialog">' +
                            '<div class="modal-content">' +
                                '<div class="modal-header">' +
                                    '<h1 class="modal-title fs-5" id="exampleModalLabel">루틴을 수정하세요!</h1>' +
                                        '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>' +
                                            '</div>'
                                        + '<div class="modal-body">'
         + '<label for="title" class="col-form-label">루틴 제목</label>'
         + '<input type="text" class="form-control" id="title" name="title">'	
         + '<label for="startDay" class="col-form-label">시작 날짜</label>'
         + '<input type="date" class="form-control" id="startDay" name="startDay">'
         + '<label for="endDay" class="col-form-label">종료 날짜</label>'
         + '<input type="date" class="form-control" id="endDay" name="endDay">'
         + '<label for="videoId" class="col-form-label">루틴영상URL</label>'
         + '<input type="text" class="form-control" id="videoId" name="videoId">'
         + '<label for="machineNum" class="col-form-label">운동기구</label>'
         + '<input type="text" class="form-control" id="machineNum" name="machineNum">' 
      + '</div>'
      + '<div class="modal-footer">'
       + '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">취소</button>'
        + '<button type="submit" class="btn btn-primary" id="routineConfirm">등록</button>'
      + '</div>'
   + '</div>'
  + '</div>'
      // 모달창을 body에 추가
      $("body").append(modalHtml);
      // 모달 엘리먼트를 jQuery로 선택하여 show() 메소드를 이용하여 보여줌
      $("#upModal").modal("show");
    });
  });


  





 