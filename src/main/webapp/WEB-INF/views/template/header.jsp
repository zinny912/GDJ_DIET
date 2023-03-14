<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand-lg bg-body-tertiary">
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
          <a class="nav-link" href="#">짧강효확</a>
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
          <a class="nav-link" href="#">logout</a>
        </li>
        <li class="nav-item" style="font-size:11px">
          <a class="nav-link" href="#">마이페이지</a>
        </li>
        <li class="nav-item" style="font-size:11px">
          <a class="nav-link" href="#">장바구니</a>
        </li>
        <li class="nav-item" style="font-size:11px">
          <a class="nav-link" href="#">search</a>
        </li>

      </ul>

<!--       <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
      
    </div>
  </div>
</nav>
