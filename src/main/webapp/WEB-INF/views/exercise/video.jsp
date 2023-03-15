<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
  <head>
    <title>동영상 재생</title>
  <c:import url="../template/common_css.jsp"></c:import>
  </head>
  <body>
	<c:import url="../template/header.jsp"></c:import>
    <video id="myVideo" width="640" height="360" controls>
      <source id="videoSource" src="" type="video/mp4">
    </video>
    <button id="startVideo">클릭</button>

    <script>
 // DB에서 동영상 URL을 가져옴
    const videoUrl = 'https://youtu.be/46vQnzaZ6aU';
    const startVideo = document.getElementById('startVideo');

    // <source> 요소의 src 속성에 동영상 URL을 적용
    const videoSource = document.getElementById('videoSource');
    videoSource.src = videoUrl;

    // <video> 요소의 play() 메서드를 호출하여 동영상을 실행
    const myVideo = document.getElementById('myVideo');
    startVideo.addEventListener('click', function(){
        myVideo.play();
    });
      
    </script> 
   <!--   <script src="../resources/js/video.js"></script> -->
  <c:import url="../template/common_js.jsp"></c:import>
  </body>  
</html>
