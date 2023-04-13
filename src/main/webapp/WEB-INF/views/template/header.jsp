<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-lg ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container">
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<a class="navbar-brand w-100" style="font-weight:700;" href="/">GOODEE DIET</a>
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> 
			        Menu
			      </button>
  				
  				<div class="w-100 text-center">
  					<div class="collapse navbar-collapse" id="ftco-nav">
			        <ul class="navbar-nav">
			          <li class="nav-item"><a href="/routine/calendar" class="nav-link">이달의루틴</a></li>
			          <li class="nav-item"><a href="/study/studyList" class="nav-link">루틴스터디</a></li>
			          <li class="nav-item"><a href="/exercise/body" class="nav-link">짧강효확</a></li>
			          
									<li class="nav-item dropdown"><a href="/healthMachine/list" class="nav-link">홈트용품 & 액세서리</a>
										<div class="dropdown-menu">
											<ul style="list-style: none;">
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=2" class="">근력향상</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=3" class="">스트레칭/균형</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=21" class="">요가/필라테스</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=22" class="">헬스소품/보호대</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=23" class="">유산소 운동</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=999" class="">기타</a></li>
												
											</ul>
											
										</div>
									</li>
						</ul>
						<ul class="navbar-nav m-auto">			
			          <li class="nav-item">
			<c:choose>
				<c:when test="${sessionMember eq null}">
					<a href="/member/login" class="nav-link">로그인/가입</a>	
					<li class="nav-item">
            			<a href="#" class="nav-link" data-toggle="modal" data-target="#loginModal">장바구니</a>
        			</li>
				</c:when>
				<c:when test="${sessionMember ne null}">
					<a class="nav-link" onclick="kakaoLogout()" href="#" >로그아웃</a>
					<li class="nav-item">
            			<a href="/cart/cartList" class="nav-link">장바구니</a>
        			</li>
			        <li class="nav-item"><a href="/member/myPage" class="nav-link">마이페이지</a></li>
				</c:when>
			</c:choose>
					  </li>
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
  		</div>
	  </nav>

<div class="modal fade" id="loginModal" tabindex="-1"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginModalLabel">로그인이 필요합니다</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">로그인 후 이용해주세요.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<a href="/member/login" class="btn btn-primary">로그인</a>
			</div>
		</div>
	</div>
</div>

