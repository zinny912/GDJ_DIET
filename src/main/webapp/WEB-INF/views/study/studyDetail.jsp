<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
 <title>구디다이어트</title>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <c:import url="../template/common_css.jsp"></c:import>
 
 <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

 <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

 <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
 <link rel="stylesheet" href="/resources/css/animate.css">
 
 <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
 <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
 <link rel="stylesheet" href="/resources/css/magnific-popup.css">

 <link rel="stylesheet" href="/resources/css/aos.css">

 <link rel="stylesheet" href="/resources/css/ionicons.min.css">

 <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
 <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">

 
 <link rel="stylesheet" href="/resources/css/flaticon.css">
 <link rel="stylesheet" href="/resources/css/icomoon.css">
 <link rel="stylesheet" href="/resources/css/style.css">
 </head>
 <body>
 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
 <div class="container">
 <div class="row m-auto">
 <div class="col-12 w-100 text-center">
 <a class="navbar-brand w-100" href="/">구디 다이어트</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	<span class="oi oi-menu"></span> Menu
	</button>
 </div>
 <div class="col-12 w-100 text-center">
 <div class="collapse navbar-collapse" id="ftco-nav">
	<ul class="navbar-nav m-auto">
	<li class="nav-item"><a href="/exercise/routine" class="nav-link">이달의루틴</a></li>
	<li class="nav-item active"><a href="/study/studyList" class="nav-link">루틴스터디</a></li>
	<li class="nav-item"><a href="/exercise/list" class="nav-link">짧강효확</a></li>
	<li class="nav-item"><a href="/healthMachine/list" class="nav-link">운동기구</a></li>
	<li class="nav-item"><a href="#" class="nav-link">Logout</a></li>
	<li class="nav-item"><a href="trainer.jsp" class="nav-link">마이페이지</a></li>
	<li class="nav-item"><a href="blog.jsp" class="nav-link">장바구니</a></li>
	<li class="nav-item"><a href="contact.jsp" class="nav-link">search</a></li>
	</ul>
	</div>
 </div>
 </div>
 </div>
	</nav>
 <!-- END nav -->


	<div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyclass.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h2 class="font-weight-light">${dto.studyName}</h2>
                    <h3 class="font-weight-light">${dto.studyCost}원</h3>
                    <hr class="my-hr2">
            		<div class="text-center">
                    <h6><strong>스터디 일정안내</strong></h6>
                    ${dto.studyPeriod} 스터디 기간
                    <br>반배정 문자 일괄 발송
                    <br>문의:010-0000-1111
                    </div>
                    <br>
                    <a class="btn btn-primary" href="#!">장바구니에 담기</a>
                </div>
            </div>
            <!-- Call to Action-->
            
            <div class="col-12 w-100 text-center">
			        <div class="row">
			        <div class="col-md-4">
			          <div class="nav-link" id="studyQnaInfo" style="cursor: pointer">상세정보</div>
			        </div>
			        <div class="col-md-4">
			         <div class="nav-link" style="cursor: pointer">구매평</div>
			        </div>
			        <div class="col-md-4">
			          <div class="nav-link" id="studyQnaList" data-study-studyNum="${dto.studyNum}" style="cursor: pointer">Q&amp;A</div>
			        </div>
			        <hr class="my-hr2">
			        </div>
  			</div>
  			
  			<div class="my-5" id="studyQnaListResult">
  				<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyDetailinfomation.jpg" alt="..." />
  				<img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/images/studyDetailinfomation2.jpg" alt="..." />
  			</div>
  	</div>

 <footer class="ftco-footer ftco-section bg-light">
 <div class="container">
 <div class="row d-flex">
 <div class="col-md">
 <div class="ftco-footer-widget mb-4">
 <h2 class="ftco-heading-2">Meditative</h2>
 <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
 <ul class="ftco-footer-social list-unstyled float-lft mt-3">
 <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
 <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
 <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
 </ul>
 </div>
 </div>
 <div class="col-md">
 <div class="ftco-footer-widget mb-4 ml-md-4">
 <h2 class="ftco-heading-2">Popular Links</h2>
 <ul class="list-unstyled">
 <li><a href="#">Yoga for Beginners</a></li>
 <li><a href="#">Yoga for Pregnant</a></li>
 <li><a href="#">Yoga Barre</a></li>
 <li><a href="#">Yoga Advance</a></li>
 </ul>
 </div>
 </div>
 <div class="col-md">
 <div class="ftco-footer-widget mb-4">
 <h2 class="ftco-heading-2">Quick Links</h2>
 <ul class="list-unstyled">
 <li><a href="#">Home</a></li>
 <li><a href="#">About</a></li>
 <li><a href="#">Classes</a></li>
 <li><a href="#">Schedule</a></li>
 <li><a href="#">Contact</a></li>
 </ul>
 </div>
 </div>
 <div class="col-md">
 <div class="ftco-footer-widget mb-4">
 <h2 class="ftco-heading-2">Have a Questions?</h2>
 <div class="block-23 mb-3">
 <ul>
 <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
 <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
 <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
 </ul>
 </div>
 </div>
 </div>
 </div>
 <div class="row">
 <div class="col-md-12 text-center">

 <p class="mb-0">
 <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
 Copyright &copy;<script>
 document.write(new Date().getFullYear());
 </script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
 <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
 </p>
 </div>
 </div>
 </div>
 </footer>
 
 
 

 <!-- loader -->
 <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


 <script src="/resources/js/jquery.min.js"></script>
 <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
 <script src="/resources/js/popper.min.js"></script>
 <script src="/resources/js/bootstrap.min.js"></script>
 <script src="/resources/js/jquery.easing.1.3.js"></script>
 <script src="/resources/js/jquery.waypoints.min.js"></script>
 <script src="/resources/js/jquery.stellar.min.js"></script>
 <script src="/resources/js/owl.carousel.min.js"></script>
 <script src="/resources/js/jquery.magnific-popup.min.js"></script>
 <script src="/resources/js/aos.js"></script>
 <script src="/resources/js/jquery.animateNumber.min.js"></script>
 <script src="/resources/js/bootstrap-datepicker.js"></script>
 <script src="/resources/js/jquery.timepicker.min.js"></script>
 <script src="/resources/js/scrollax.min.js"></script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
 <script src="/resources/js/google-map.js"></script>
 <script src="/resources/js/main.js"></script>

 <style>
 .my-hr2 {
 border: 0;
 height: 2px;
 background: #ccc;
 }
 </style>

<c:import url="../template/common_js.jsp"></c:import>
<script src="/resources/js/studyQna.js"></script>
 </body>
</html>