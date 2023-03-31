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
    swal('오늘운동완료!', day.getAttribute('data-day-days'), 'success')
    .then(function() {
      location.href="/exercise/routine";
      // changeImage();
    });
  }
  function stopVideo (){
    player.stopVideo();
    
  }
  // function changeImage() {
    //   let img = parent.document.querySelector('#changeimg${dto.num}');
    //   img.src = '/resources/images/successred.jpg';
    //   addClickHandler();
    //   }
    
    swal('출석체크하세요!','info')
    .then(function(){
      let img = parent.document.querySelector('#changeimg${dto.num}');
      img.src='/resources/images/successred.jpg';
      addClickHandler();
    });
    
 };









// const xhttp = new XMLHttpRequest();
// xhttp.open('POST', '/routine');
// xhttp.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
// xhttp.onload = function() {
//     if (xhttp.status === 200) {
//         console.log('출석체크 테이블 업데이트 완료');
//     } else {
//         console.log('서버와 통신 중 오류가 발생했습니다.');
//     }
// };
// xhttp.send(JSON.stringify({completed: true}));





// //
// fetch('/routine', {
//   method: 'POST',
//   headers: {
//     'Content-Type': 'application/json;charset=UTF-8'
//   },
//   body: JSON.stringify({completed: true})
// })
// .then(response => {
//   if (response.ok) {
//     console.log('출석체크 테이블 업데이트 완료');
//   } else {
//     console.log('서버와 통신 중 오류가 발생했습니다.');
//   }
// })
// .catch(error => {
//   console.error('서버와 통신 중 오류가 발생했습니다.', error);
// });
