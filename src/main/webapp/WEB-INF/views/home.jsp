<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>구디 다이어트</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <c:import url="./template/common_css.jsp"></c:import>
   <!--  
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="./resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="./resources/css/animate.css">
    
    <link rel="stylesheet" href="./resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="./resources/css/magnific-popup.css">

    <link rel="stylesheet" href="./resources/css/aos.css">

    <link rel="stylesheet" href="./resources/css/ionicons.min.css">

    <link rel="stylesheet" href="./resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="./resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="./resources/css/flaticon.css">
    <link rel="stylesheet" href="./resources/css/icomoon.css">
    <link rel="stylesheet" href="./resources/css/style.css"> -->
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
			          <li class="nav-item active"><a href="index" class="nav-link">이달의루틴</a></li>
			          <li class="nav-item"><a href="/study/studyList" class="nav-link">루틴스터디</a></li>
			          <li class="nav-item"><a href="schedule" class="nav-link">짧강효확</a></li>
			          <li class="nav-item"><a href="./healthMachine/list" class="nav-link">운동기구</a></li>
			          <li class="nav-item">
			<c:choose>
				<c:when test="${sessionMember eq null}"><a href="/member/login" class="nav-link">로그인/가입</a>	</c:when>
				<c:when test="${sessionMember ne null}"><a class="nav-link" onclick="kakaoLogout()" 
				href="#" >로그아웃</a></c:when>
			</c:choose>
					  </li>
			          <li class="nav-item"><a href="/member/myPage" class="nav-link">마이페이지</a></li>
			          <li class="nav-item"><a href="blog" class="nav-link">장바구니</a></li>
			          <li class="nav-item"><a href="contact" class="nav-link">search</a></li>
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>
    <!-- END nav -->

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
            <h2 class="mb-1">Experience of Yoga</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-4">
    				<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Balance Body &amp; Mind</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Healthy Daily Life</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Improves your flexibility</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Protects your spine</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
    			</div>

    			<div class="col-md-4 d-flex">
    				<div class="img img-services w-100" style="background-image: url(./resources/images/services.jpg);"></div>
    			</div>

    			<div class="col-md-4">
    				<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Betters your bone health</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Increases your blood flow</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Keep a practice journal</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Builds muscle strength</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
            <h2 class="mb-1">Our Classes</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(./resources/images/classes-1.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Private &amp; Group Lessons</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(./resources/images/classes-2.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Pregnant</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(./resources/images/classes-3.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Beginners</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(./resources/images/classes-4.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Barre</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(./resources/images/classes-5.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Core</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(./resources/images/classes-6.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Restore</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        </div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
            <h2 class="mb-1">Class Time Table</h2>
          </div>
        </div>
    		<div class="row">
          <div class="col-md-12">
            <div class="table-responsive">
              <table class="table table-bordered text-center">
                <thead>
                  <tr class="bg-primary text-white">
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                    <th>Sunday</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-1.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-2.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-3.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                  </tr>
                  <tr>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-4.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-5.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-6.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-7.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                  <tr>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-1.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-2.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-3.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                  </tr>
                  <tr>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-4.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-5.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-6.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-7.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-1.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-2.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-3.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-4.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(./resources/images/classes-5.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                </tbody>
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
		

    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-10 heading-section ftco-animate text-center">
            <h3 class="subheading">Testimony</h3>
            <h2 class="mb-1">Successful Stories</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                  	<div class="line">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>
                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(./resources/images/person_1.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Gabby Smith</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(./resources/images/person_2.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Floyd Weather</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(./resources/images/person_3.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">James Dee</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(./resources/images/person_4.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Lance Roger</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
	                    <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
	                    <span class="quote d-flex align-items-center justify-content-center">
	                      <i class="icon-quote-left"></i>
	                    </span>
	                  </div>

                    <div class="d-flex align-items-center">
                    	<div class="user-img" style="background-image: url(./resources/images/person_2.jpg)">
		                  </div>
		                  <div class="ml-4">
		                  	<p class="name">Kenny Bufer</p>
		                    <span class="position">Customer</span>
		                  </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-counter img" id="section-counter" style="background-image: url(./resources/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-md-10">
        		<div class="row">
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="2560">0</strong>
		              	<span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="60">0</strong>
		              	<span>Yoga Classes</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="50">0</strong>
		              	<span>Years of Experience</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		              	<strong class="number" data-number="100">0</strong>
		              	<span>Yoga Conducted</span>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-1">Recent Posts</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('./resources/images/image_1.jpg');">
              </a>
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Is wellness the new luxury</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('./resources/images/image_2.jpg');">
              </a>
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Is wellness the new luxury</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry">
              <a href="blog-single.html" class="block-20" style="background-image: url('./resources/images/image_3.jpg');">
              </a>
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Is wellness the new luxury</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

		<section class="ftco-gallery ftco-section">
    	<div class="container-fluid px-md-5">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-1">See the latest photos</h2>
          </div>
        </div>
    		<div class="row">
					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="/template/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>

					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-5.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-6.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-7.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-7.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="./resources/images/gallery-8.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(./resources/images/gallery-8.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
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

<!-- 
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="./resources/js/popper.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
  <script src="./resources/js/jquery.easing.1.3.js"></script>
  <script src="./resources/js/jquery.waypoints.min.js"></script>
  <script src="./resources/js/jquery.stellar.min.js"></script>
  <script src="./resources/js/owl.carousel.min.js"></script>
  <script src="./resources/js/jquery.magnific-popup.min.js"></script>
  <script src="./resources/js/aos.js"></script>
  <script src="./resources/js/jquery.animateNumber.min.js"></script>
  <script src="./resources/js/bootstrap-datepicker.js"></script>
  <script src="./resources/js/jquery.timepicker.min.js"></script>
  <script src="./resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="./resources/js/google-map.js"></script>
  <script src="./resources/js/main.js"></script> -->
<c:import url="./template/common_js.jsp"></c:import>  
<script src="/resources/js/member/kakaoInfo.js"></script>
  </body>
</html>
