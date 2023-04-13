<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String number = request.getParameter("number"); %>
<html>
  <head>
    
    <title>짧강효확 상세페이지</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <c:import url="../template/common_css.jsp"></c:import>  
    <link rel="stylesheet" href="/resources/css/video.css">
   
  </head>
  <body>
  <c:import url="../template/header.jsp"></c:import>

	   <section class="ftco-section">
          <div class="col-md-12 ftco-animate text-center">
            <h1 class="mb-3 bread" id='days' data-day-days='${dto.detailTitle}'>${dto.detailTitle}</h1>
            <p class="breadcrumbs"><span class="mr-2">운동하기</span></p>
          </div>
 	  </section>
  
	  
<div class = "container-fluid">
	<div class = "row mx-auto ">
		<div class="form-group">            	
				<div class="video-container" id="videoId" data-video-id='${dto.urlId}'>
				<div id="player"></div>
			    
       			</div>
        </div>
	</div>
</div>
  
  
<section class="ftco-section">
          <div class="col-md-12 ftco-animate text-center">
            <h1 class="mb-3 bread"></h1> 
            <img id=thumbsup src="../../resources/images/thumbsup.png" width="200px" height="200px" alt="">
          </div>
</section>
  
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/detailVideo.js"></script>
<c:import url="../template/footer.jsp"></c:import> 
<c:import url="../template/common_js.jsp"></c:import>   
  </body>
</html>