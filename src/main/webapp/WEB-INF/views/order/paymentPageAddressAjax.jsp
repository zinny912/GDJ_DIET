<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<p class="info 아이디">
	<strong>${deliveryDTO.recipient}</strong>
	<input hidden="" name="recipient" value="${deliveryDTO.recipient}">
</p>
<p class="info 배송주소">
	<strong>${deliveryDTO.address}</strong>
	<input hidden="" name="address" value="${deliveryDTO.address}">
</p>
<p class="info 연락처">
	<strong>${deliveryDTO.recipientTel}</strong>
	<input hidden="" name="recipientTel" value="${deliveryDTO.recipientTel}">
</p>



<!-- test -->
<!-- <tr> -->
<!-- 	<td>아이디</td> -->
<%-- 	<td class="">${deliveryDTO.recipient}</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<td>배송주소</td> -->
<%-- 	<td class="">${deliveryDTO.address}</td> --%>
<!-- </tr> -->
<!-- <tr> -->
<!-- 	<td>연락처</td> -->
<%-- 	<td class="">${deliveryDTO.recipientTel}</td> --%>
<!-- </tr> -->