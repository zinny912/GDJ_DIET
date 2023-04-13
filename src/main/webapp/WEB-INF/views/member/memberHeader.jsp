<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid" style="margin-left:5%;">
<h3 class="text-center"> 마이페이지 </h3>
<div class="col-2 mx-1 mb-3 " style="box-shadow: 0px 0px 2px 0px #6c757d;">
<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active mt-1" aria-current="page" href="/order/list">주문/배송</a>
  </li>
  <li class="nav-item">
  <c:if test="${sessionMember.studyNum eq null}">
  	<a class="nav-link" href="/study/studyList">수업111</a>
  </c:if>
    <c:if test="${sessionMember.studyNum ne null}">
  	<a class="nav-link" href="/member/myPage">수업222</a>
  </c:if>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="/member/update">개인정보</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="/member/delivery">배송지 설정</a>
  </li>

</ul>
</div>
</div>
<!-- container안-row안에 널 것. -->
