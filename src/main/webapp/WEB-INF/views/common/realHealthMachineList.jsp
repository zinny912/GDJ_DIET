<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover">
  <thead>
    <tr>
      <th>#</th>
      <th>재고</th>
      <th>옵션1</th>
      <th>옵션2</th>
      <th>옵션3</th>
      <th>옵션4</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="dto" varStatus="i">
    <tr class="tr" data-realMachineNum=${dto.realMachineNum }>
      <td>${i.index}</td>
      <td>${dto.stock}</td>
      <td>${dto.optName1}</td>
      <td>${dto.optName2}</td>
      <td>${dto.optName3}</td>
      <td>${dto.optName4}</td>
    </tr>
    </c:forEach>
    
  </tbody>
</table>
