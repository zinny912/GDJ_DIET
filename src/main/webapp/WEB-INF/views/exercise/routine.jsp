<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
 <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
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
	<li class="nav-item active"><a href="/exercise/routine" class="nav-link">이달의루틴</a></li>
	<li class="nav-item"><a href="/study/studyList" class="nav-link">루틴스터디</a></li>
	<li class="nav-item"><a href="/exercise/body" class="nav-link">짧강효확</a></li>
	<li class="nav-item"><a href="about.jsp" class="nav-link">운동기구</a></li>
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

 <section class="hero-wrap hero-wrap-2" style="background-image: url('/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
 <div class="overlay"></div>
 <div class="container">
 <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
 <div class="col-md-9 ftco-animate text-center">
 <h1 class="mb-3 bread">이달의 루틴</h1>
 <p class="breadcrumbs"><span class="mr-2"><a href="index.html">3월 루틴스터디</a></span><br> <span>황금골반, 일자다리</span></p>
 </div>
 </div>
 </div>
 </section>

 <section class="ftco-section">
 <div class="container">
 <div class="row justify-content-center mb-5 pb-3">
 <div class="col-md-12 heading-section ftco-animate text-center" style="line-height:5%">
 <h3 class="mb-1">이달의 루틴 </h3><br><h3>Calendar</h3>
 </div>
 </div>
 <div class="row">
 <div class="col-md-12">
 <div class="table-responsive">

 
 <table class="table table-bordered text-center">
 <thead>
 <tr class="bg-danger-subtle text-white">
 <th>SUN</th>
 <th>MON</th>
 <th>TUE</th>
 <th>WED</th>
 <th>THUR</th>
 <th>FRI</th>
 <th>SAT</th>
 </tr>
 <tr class="bg-primary text-white">
 <th>상체 올케어</th>
 <th>허벅지사이 & 종아리알</th>
 <th>볼록앞벅지 제거</th>
 <th>황금골반</th>
 <th>상체 올케어</th>
 <th>허벅지사이 & 종아리알</th>
 <th>하체 올케어</th>
 </tr>
 </thead>
 
 
 <tbody>
    <c:forEach items="${routine}" var="dto" varStatus="status">
      <c:if test="${status.index % 7 == 0}">
        <tr>
      </c:if>
      <td class="text-center">
        <strong>${dto.days}</strong>
        <div class="img rounded-circle mb-2" style="background-image: url(${dto.thumbNail});"></div>
        <a href="./video?num=${dto.num}"><strong>${dto.title}</strong></a>
      </td>
      <c:if test="${status.index % 7 == 6}">
        </tr>
      </c:if>
    </c:forEach>
 </tbody>
 
 
 
 <%-- <td class="text-center">
 <strong>${dto.days}</strong>
 <div class="img rounded-circle mb-2" style="background-image: url(/resources/images/leg1.png);"></div>
 <a href="./exercise/video?days=1일차" class="videoId" data-day="1"><strong>승마살 싹뚝루틴</strong></a>
 </td>
 <td class="text-center">
 <strong class="day">2일차</strong>
 <div class="img rounded-circle mb-2" style ="background-image: url(/resources/images/classes-2.jpg);"></div>
 <a href="/exercise/video?days=2일차" class="videoId" data-day="2"><strong>승마살 싹뚝루틴</strong></a>
 </td>
 
 <td class="text-center"><strong class="day">3일차</strong><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-3.jpg);"></div>
 <a href="/exercise/video" class="videoId" data-day="3"><strong>승마살 싹뚝루틴</strong></a>
 </td>
 
 <td class="text-center"><strong class="day">4일차</strong><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-3.jpg);"></div>
 <a href="#"><strong>승마살 싹뚝루틴</strong></a>
 </td>
 </tr>
 <tr>
 <td class="text-center"><strong class="day">5일차</strong><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-4.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td class="text-center"><strong class="day">6일차</strong><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-5.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 
 <td class="text-center"><strong class="day">7일차</strong><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-5.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-6.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-7.jpg);"></div>
 <a href="#"><strong>Yoga training</strong> </a>
 </td>
 
 </tr>
 <tr>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-1.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-2.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-3.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 </tr>
 <tr>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-4.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-5.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-6.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-7.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 </tr>
 <tr>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-1.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-2.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-3.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td><i class="ion-ios-close"></i></td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-4.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 <td class="text-center"><div class="img rounded-circle mb-2" style="background-image: url(/resources/images/classes-5.jpg);"></div>
 <a href="#"><strong>Yoga training</strong></a>
 </td>
 </tr>
 </tbody>
 --%> 
 
 <tfoot>
 <tr>
 <th><a href="#"><i class="ion-ios-arrow-round-back"></i> September</a></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th></th>
 <th><a href="#">November <i class="ion-ios-arrow-round-forward"></i></a></th>
 </tr>
 </tfoot>
 </table>
 </div>
 </div>
 </div>
 </div>
 </section>

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
 <script src="/resources/js/video.js"></script>

<c:import url="../template/common_js.jsp"></c:import> 
 </body>
</html>