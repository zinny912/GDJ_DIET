const thumbsup = document.getElementById("thumbsup");


const youtube = document.getElementById('youtube');
  youtube.addEventListener('load', function() {
    const videoPlayer = videoIframe.contentWindow.document.getElementById('video-player');
    videoPlayer.addEventListener('ended', function() {
      alert('영상이 종료되었습니다.');
      window.location.href = './routine';
    });
  });



// thumbsup.addEventListener('click', function(){
//     location.href="./routine";

//     $('.imgchange:eq(0)').css('background-image', 'url(../resources/images/successred.jpg)');
    
// });


