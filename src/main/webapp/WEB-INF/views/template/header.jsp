<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			          
									<li class="nav-item active dropdown"><a href="/healthMachine/list" class="nav-link">운동기구</a>
										<div class="dropdown-menu">
											<ul style="list-style: none;">
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=2" class="">근력향상</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=3" class="">스트레칭/균형</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=21" class="">요가/필라테스</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=22" class="">헬스소품/포호대</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=23" class="">유산소 운동</a></li>
												<li class="dropdown-item"><a href="/healthMachine/list?categoryNum=999" class="">기타</a></li>
												
											</ul>
											
										</div>
									</li>
			          <li class="nav-item">
			<c:choose>
				<c:when test="${sessionMember eq null}"><a href="/member/login" class="nav-link">로그인/가입</a>	</c:when>
				<c:when test="${sessionMember ne null}"><a class="nav-link" onclick="kakaoLogout()" 
				href="#" >로그아웃</a></c:when>
			</c:choose>
					  </li>
			          <li class="nav-item"><a href="/member/myPage" class="nav-link">마이페이지</a></li>
			          <li class="nav-item"><a href="/cart/cart" class="nav-link">장바구니</a></li>
			          <li class="nav-item"><a href="contact" class="nav-link">search</a></li>
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>
<!-- <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
  
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
          <a class="nav-link" href="#">이번달의 루틴</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            루틴 스터디
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/study/studyList">스터디 신청하기</a></li>
            <li><a class="dropdown-item" href="#">스터디 리얼후기</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/exercise/exerciseList">짧강효확</a>
        </li>

        <li class="nav-item">
          <a class="nav-link disabled">명예의 전당</a>
        </li>
      </ul>

      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
          <a class="nav-link" href="/">구디 다이어트</a>
        </li>

      </ul>

      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item" style="font-size:11px">
<!--           <a class="nav-link" href="#">logout</a> -->
<%-- <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	<li class="nav-item" style="font-size: 11px"><c:choose>
			<c:when test="${sessionMember eq null}">
				<a href="/member/login">로그인</a>
			</c:when>
			<c:when test="${sessionMember ne null}">
				<a onclick="kakaoLogout()" href="/member/logout">로그아웃</a>
			</c:when>
		</c:choose></li>
	<li class="nav-item" style="font-size: 11px"><a class="nav-link"
		href="#">마이페이지</a></li>
	<li class="nav-item" style="font-size: 11px"><a class="nav-link"
		href="#">장바구니</a></li>
	<li class="nav-item" style="font-size: 11px"><a class="nav-link"
		href="#">search</a></li>

</ul>

<form class="d-flex" role="search">
	<input class="form-control me-2" type="search" placeholder="Search"
		aria-label="Search">
	<button class="btn btn-outline-success" type="submit">Search</button>
</form>

</div>
</div>
</nav>
--> --%>
