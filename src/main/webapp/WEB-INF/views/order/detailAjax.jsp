<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${healthMachine ne ''}">


<a href="/healthMachine/detail?machineNum=${healthMachineDTO.machineNum}" class="moveProduct">
<img src="/resources/images/${healthMachineDTO.healthMachineImgDTOs[0].fileName}" width="78" height="78" class="product-img img">
</a>
<span class="option-item-name" style="font-size: 25px">${healthMachine}</span>
<div>
<button type="button" class="btn btn-secondary">장바구니 담기</button>
<button type="button" class="btn btn-secondary">리뷰 작성하기</button>
</div>
<%-- <h5 class="card-title">${healthMachine}</h5> --%>
<%-- <p class="card-text">${prime.address}</p> --%>
</c:if>


<c:if test="${studyDTO ne ''}">
<h5 class="card-title">${studyDTO.studyName}</h5>
<%-- <p class="card-text">${prime.address}</p> --%>
</c:if>

