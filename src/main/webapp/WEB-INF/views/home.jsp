<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>구디 다이어트</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <c:import url="./template/common_css.jsp"></c:import>
  </head>
  <body>
  	 <c:import url="./template/header.jsp"></c:import>
 
 
 
		 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <a href="/study/studyList"><img src="/resources/images/001.png"class="d-block w-100" alt="..."></a>
		    </div>
		    <div class="carousel-item">
		     <a href="/exercise/calendar"> <img src="/resources/images/002.png" class="d-block w-100" alt="..."></a>
		    </div>
		    
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	
	<!--     <section class="ftco-section">
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
        			<div class="text w-100 text-center">
        				<h3><a href="#">Private &amp; Group Lessons</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Pregnant</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Beginners</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Barre</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Core</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
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
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                  </tr>
                  <tr>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                  <tr>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                  </tr>
                  <tr>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                  <tr>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
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
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>

					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
        </div>
    	</div>
    </section> -->
<c:import url="./template/footer.jsp"></c:import>
		


<c:import url="./template/common_js.jsp"></c:import>  
<script src="/resources/js/member/kakaoInfo.js"></script>

  </body>
</html>
