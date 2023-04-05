<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${healthMachine ne null}">


<a href="/healthMachine/detail?machineNum=${healthMachineDTO.machineNum}" class="moveProduct">
<img src="/resources/images/${healthMachineDTO.healthMachineImgDTOs[0].fileName}" width="78" height="78" class="product-img img">
</a>
<span class="option-item-name" style="font-size: 25px">${healthMachine}</span>
<div>
<button type="button" class="btn btn-secondary btn-addCart to-cart-popper" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="Top popover"
	data-addCart="${healthMachineDTO.machineNum}">장바구니 담기</button>
<button type="button" class="btn btn-secondary">리뷰 작성하기</button>

</div>
<%-- <h5 class="card-title">${healthMachine}</h5> --%>
<%-- <p class="card-text">${prime.address}</p> --%>
</c:if>


<c:if test="${studyDTO ne null}">

<a href="/study/studyDetail?studyNum=${studyDTO.studyNum}" class="moveProduct">
    <img src="/resources/images/${studyDTO.studyBoardFileDTOs[0].fileName}" width="78" height="78" class="product-img img">
    </a>
    <span class="option-item-name" style="font-size: 25px">${studyDTO.studyName}</span>
    <div>
    <button type="button" class="btn btn-secondary btn-addCart" data-addCart="${studyDTO.studyNum}"  data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-content="Top popover"
    >장바구니 담기</button>
    <button type="button" class="btn btn-secondary">리뷰 작성하기</button>
    </div>

<h5 class="card-title">${studyDTO.studyName}</h5>
<%-- <p class="card-text">${prime.address}</p> --%>
</c:if>

<!-- <script> -->

<!-- </script> -->
