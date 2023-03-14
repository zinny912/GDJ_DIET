<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	
		<div class="row goods_wrapper">
		<c:forEach items="${list}" var="dto">
			<img style="" src="/resources/images/studyclass.jpg" alt="">
			<h1>${dto.studyName}</h1>
		</c:forEach>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
 			 <div class="container-fluid">
 				 <div class="collapse navbar-collapse" id="navbarSupportedContent">
     				 <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		 	 
							<li class="nav-item">
								<a class="nav-link" href="#">상세정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">구매평</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Q&amp;A</a></li>
						</ul>
					</div>
				</div>
		</nav>


		<%-- <div class="goods_form" id="prod_goods_form">
			<header>
				<div class="view_tit no-margin-top title_font_style "
					style="color:; font-weight: bold; font-size: 24px !important;">
					${dto.studyName}
					<div class="ns-icon inline-blocked clearfix">
						<div class="prod_use_icon inline-blocked">
							<img alt="sold out icon"
								src="https://cdn.imweb.me/upload/S20220317b263f68ab745e/a9bc2826b0122.png"
								class="sold_out" style="width: 65px;">
						</div>
					</div>
				</div>
				<div class="pay_detail full-width">
					<div class="holder table-row">
						<span class="text-brand pay_number"> <span
							class="real_price inline-blocked" style="">55,000원</span>
						</span>
					</div>
					<div class="comment_num_warp">
						<button class="comment_num btn btn-flat" type="button"
							onclick="SNS.showDefalutSnsShareList();">
							<i class="btl bt-share board-summary-icon active"
								aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</header>
			<div class="goods_summary body_font_color_70">
				<div class="fr-view">
					<p style="text-align: center;">모집마감 되었습니다</p>
					<p style="text-align: center;">
						<br>
					</p>
					<p style="text-align: center;">
						<strong>3기 스터디 일정안내</strong><br>3/6(월) 반배정 문자발송
					</p>
					<p style="text-align: center;">3/7(화) 오리엔테이션</p>
					<p style="text-align: center;">3/8-(수) ~ 3/28(목) 스터디 기간</p>
				</div>
			</div>
			<div class="txt_easy_payment body_font_color_80 hidden-lg hidden-md">
				<img src="https://vendor-cdn.imweb.me/images/payco_logo.png"
					height="14">간편결제 가능
			</div>
			<div class="m-btn-group buy_btns">
				<a href="javascript:" class="like_box "
					onclick="SITE_SHOP_DETAIL.addProdWish('s20221228f4d2e3f0a28a0', 'L3N0dWR5bGlzdC8%2FaWR4PTcw')">
					<i aria-hidden="true"
					class="wish-icon-s20221228f4d2e3f0a28a0 im-icon im-ico-like text-18"></i>
					<span id="prod_detail_wish_count_mobile"
					class="prod_detail_wish_count"> </span>
				</a>
				<button class="comment_num btn btn-flat" type="button"
					onclick="SNS.showDefalutSnsShareList();"
					style="padding: 10px 0 10px 15px;">
					<i class="btl bt-share board-summary-icon" aria-hidden="true"></i>
				</button>
			</div>
		
			<div class="_today_arrival_wrap"></div>
			
		</div> --%>
		</div>
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>



