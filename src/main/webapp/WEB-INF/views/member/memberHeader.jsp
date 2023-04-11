<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-2 mx-1 mb-3" style="box-shadow: 2px 2px 10px 0px rgb(190, 108, 170); ">
<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="/order/list">주문/배송</a>
  </li>
  <li class="nav-item">
  <c:if test="${sessionMember.studyNum eq null}">
  	<a class="nav-link" href="/study/studyList">수업</a>
  </c:if>
    <c:if test="${sessionMember.studyNum ne null}">
  	<a class="nav-link" href="/member/myPage">수업</a>
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
<!-- container안-row안에 널 것. -->
