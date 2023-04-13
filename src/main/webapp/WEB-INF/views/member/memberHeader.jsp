<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid" style="margin-left:5%;">
<h3 class="h3" style="margin-left:15px;"> 마이페이지 </h3>
<div class="col-2 mx-1 mb-3 " >
<ul class="nav flex-column">
  <li class="nav-item">
    <a class="nav-link active mt-1" aria-current="page" href="/order/list">주문/배송</a>
  </li>
  <li class="nav-item">
  </li>
   <li class="nav-item">
    <a class="nav-link" href="/member/update">개인정보</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="/member/delivery">배송지 설정</a>
  </li>
  <c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
  <li><a class="nav-link" href="/member/manage">회원관리</a></li>
  </c:if>
</ul>
</div>
</div>
<!-- container안-row안에 널 것. -->
