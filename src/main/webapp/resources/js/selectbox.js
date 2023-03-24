
$(document).ready(function() {
    $.ajax({
      url: "./add", // 서버 측에서 데이터를 가져오는 파일 경로
      dataType: "json", // 서버 측에서 반환되는 데이터 타입 (JSON으로 설정)
      success: function(data) { // Ajax 요청이 성공한 경우 실행되는 콜백 함수
        $.each(data, function(index, value) { // 데이터를 반복하여 처리하는 jQuery each() 함수
          $('#my-select').append($('<option>').text(value.option_text).attr('value', value.option_value));
          // select box에 옵션을 추가하는 jQuery append() 함수
        });
      }
    });
  });