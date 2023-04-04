<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<tr>
	<td>아이디</td>
	<td class="pay-deliver-ajax-recipient">${deliveryDTO.recipient}</td>
</tr>
<tr>
	<td>배송주소</td>
	<td class="pay-deliver-ajax-address">${deliveryDTO.address}</td>
</tr>
<tr>
	<td>연락처</td>
	<td class="pay-deliver-ajax-recipientTel">${deliveryDTO.recipientTel}</td>
</tr>