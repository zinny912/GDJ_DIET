$.ajax({
    url: '/exerciseData/', // exercise 데이터를 가져올 url
    type: 'GET', // HTTP 요청 방식
    dataType: 'json', // 응답 데이터 형식
    success: function(data) {
        $('#routineList').html(data);
      console.log(data); // 가져온 exercise 데이터를 콘솔에 출력
    },
    error: function(jqXHR, textStatus, errorThrown) {
      // 요청이 실패했을 때 실행할 코드
      console.error(textStatus, errorThrown);
    }
  });

 $(routinebtn).addEventButton() { // 추가한 버튼 설정
    text : "일정 추가",  // 버튼 내용
    click : function(){ // 버튼 클릭 시 이벤트 추가
        $("#calendarModal").modal("show"); // modal 나타내기

        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
            var content = $("#calendar_content").val();
            var start_date = $("#calendar_start_date").val();
            var end_date = $("#calendar_end_date").val();
            
            //내용 입력 여부 확인
            if(content == null || content == ""){
                alert("내용을 입력하세요.");
            }else if(start_date == "" || end_date ==""){
                alert("날짜를 입력하세요.");
            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                alert("종료일이 시작일보다 먼저입니다.");
            }else{ // 정상적인 입력 시
                var obj = {
                    "title" : content,
                    "start" : start_date,
                    "end" : end_date
                }//전송할 객체 생성

                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
            }
        });
    }
};



