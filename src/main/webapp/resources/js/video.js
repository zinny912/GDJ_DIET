// DB에서 동영상 URL을 가져옴
      const videoUrl = 'https://youtu.be/46vQnzaZ6aU';
      const startVideo = document.getElementById('startVideo');

      // <source> 요소의 src 속성에 동영상 URL을 적용
      const videoSource = document.getElementById('videoSource');
      videoSource.src = videoUrl;

      // <video> 요소의 play() 메서드를 호출하여 동영상을 실행
      const myVideo = document.getElementById('myVideo');
      myVideo.play();
    //   startVideo.addEventListener('click', function(){
    //   });
      