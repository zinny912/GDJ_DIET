const thumbsup = document.getElementById("thumbsup");


var videoId = 'z3zp5U27mQg'; // 초기값 설정

//루틴 동영상 실행 및 종료 시 alert 창 띄우기
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    
    videoId: videoId,
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
  
}
$('#video-selector').on('change', function() {
  videoId = $(this).val(); // 선택된 동영상 ID를 할당
  player.loadVideoById(videoId); // 동영상 변경
});

function onPlayerReady(event) {
  event.target.playVideo();
  
}


var done = false;
function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done){
      done = true;
    } else if (event.data == YT.PlayerState.ENDED && done){
    stopVideo();
   
    var day = "${dto.days}";
    swal('오늘운동완료!', day, 'success')
    .then(function() {
      location.href="/exercise/routine";
      function changeImage(){
        var thumbNail = "${dto.thumbNail}";
        console.log(thumbNail);
      }
    });
  
    }
  function stopVideo (){
    player.stopVideo();
    
  }
};
