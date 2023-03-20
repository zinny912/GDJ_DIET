const thumbsup = document.getElementById("thumbsup");

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
    videoId: 'z3zp5U27mQg',
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
   
   
   swal('오늘운동완료!',"1일차",'success')
    .then(function(){
	    location.href="/exercise/routine";                   
      })
  }
  
}
function stopVideo (){
  player.stopVideo();
  
}


// window.onYouTubeIframeAPIReady = function() {
//   var player;
  
//   player = new YT.Player('player', {
//     height: '360',
//     width: '720',
//     videoId: 'z3zp5U27mQg',
//     events: {
//       'onReady': onPlayerReady,
//       'onStateChange': onPlayerStateChange
//     }
//   });
// }

// function onPlayerReady(event) {
//   event.target.playVideo();
// }

// var done = false;
// function onPlayerStateChange(event) {
//   if (event.data == YT.PlayerState.PLAYING && !done) {
//     done = true;
//   } else if (event.data == YT.PlayerState.ENDED && done){
//     stopVideo();
//     alert("동영상종료");
//   }
// }

// function stopVideo() {
//   player.stopVideo();
// }





