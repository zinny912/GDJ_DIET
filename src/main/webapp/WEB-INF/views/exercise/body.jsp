<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><html>
<head>
<title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="UTF-8">
<meta name="HandheldFriendly" content="true"/>
<meta name="MobileOptimized" content="320"/>
<meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:import url="../template/common_css.jsp"></c:import> 
<style>
	body {
		font-family: Helvetica, Arial, sans-serif;
	}
	h1 {
		font-size: 20px;
	}
	div {
		width: 100%;
	}
	img[usemap] {
		border: none;
		height: auto;
		max-width: 100%;
		width: auto;
	}
</style>	 
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	
<section class="hero-wrap hero-wrap-2"
		style="background-image: url('/resources/images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-3 bread">짧.강.효.확.</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">짧지만 강하게!</a></span> <span>효과는
							확실하게!</span>
					</p>
				</div>
			</div>
		</div>
	</section> 
	




<div class="bodyimages">	<!-- Image Map Generated by http://www.image-map.net/ -->
<img src="/resources/images/allbody.jpeg" usemap="#allbody" class="reponsive-img">

<map name="allbody">
    <area target="" alt="faceVideo" title="faceVideo" href="/exercise/detail/face" coords="712,609,793,797" shape="rect">
    <area target="" alt="armfitVideo" title="armfitVideo" href="/exercise/detail/armpit" coords="722,901,981,964" shape="rect">
    <area target="" alt="armsVideo" title="armsVideo" href="/exercise/detail/arms" coords="515,936,718,1004" shape="rect">
    <area target="" alt="hipVideo" title="hipVideo" href="/exercise/detail/hip" coords="484,1073,689,1141" shape="rect">
    <area target="" alt="legsVideo" title="legsVideo" href="/exercise/detail/legs" coords="320,1122,427,1250" shape="rect">
    <area target="" alt="frontlegVideo" title="frontlegVideo" href="/exercise/detail/frontleg" coords="584,1197,693,1326" shape="rect">
    <area target="" alt="inlegVideo" title="inlegVideo" href="/exercise/detail/inleg" coords="735,1153,885,1275" shape="rect">
    <area target="" alt="upperVideo" title="upperVideo" href="/exercise/detail/upperBody" coords="864,682,988,760" shape="rect">
    <area target="" alt="shoulderVideo" title="shoulderVideo" href="/exercise/detail/shoulder" coords="1134,833,1473,911" shape="rect">
    <area target="" alt="backVideo" title="backVideo" href="/exercise/detail/back" coords="1366,948,1485,1016" shape="rect">
    <area target="" alt="waistVideo" title="waistVideo" href="/exercise/detail/waist" coords="1351,1022,1504,1085" shape="rect">
    <area target="" alt="bellyfatVideo" title="bellyfatVideo" href="/exercise/detail/bellyfat" coords="1527,1027,1734,1094" shape="rect">
    <area target="" alt="stomachVideo" title="stomachVideo" href="//exercise/detail/stomach" coords="1500,1097,1709,1160" shape="rect">
    <area target="" alt="sidelegVideo" title="sidelegVideo" href="/exercise/detail/sideleg" coords="1259,1127,1417,1194" shape="rect">
    <area target="" alt="lowerVideo" title="lowerVideo" href="/exercise/detail/lowerBody" coords="1224,1268,1356,1346" shape="rect">
    <area target="" alt="seriesVideo" title="seriesVideo" href="/exercise/detail/seires" coords="74,512,201,561" shape="rect">
    <area target="" alt="stretchingVideo" title="stretchingVideo" href="/exercise/detail/stertching" coords="75,583,198,707" shape="rect">
</map>
</div>
	<!-- <script type="text/javascript" src="/resources/js/body.js"></script> -->
	<!-- End Save for Web Slices -->
	<!-- loader -->
	<%-- <div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div> --%>

<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-rwdImageMaps/1.6/jquery.rwdImageMaps.min.js"></script>
<script>

$(document).ready(function(e) {
	$('img[usemap]').rwdImageMaps();
	
});

</script>
</body>
</html>


