var videoIds = document.getElementById('videoId'); //z3zp5U27mQg'; // 초기값 설정
var videoId=videoIds.getAttribute('data-video-id');
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

function onPlayerReady(event) {
  event.target.playVideo();
  
}


var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING && !done){
    done = true;
  } else if (event.data == YT.PlayerState.ENDED && done){
    stopVideo();
    
    let day = document.getElementById('days');
    let dayday= day.getAttribute('data-day-days');
    swal('오늘운동완료!', `${dayday}일차`, 'success')
    .then(function() {
      location.href="/routine/calendar";
    });
  }
  function stopVideo (){
    player.stopVideo();
    
  } 
    };
