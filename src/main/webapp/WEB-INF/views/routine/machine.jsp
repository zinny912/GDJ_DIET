<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <c:if test="${not empty list}">
	<h5><운동기구></h5>
</c:if>

<c:forEach items="${list}" var="dto">
	<h6>${dto.machineName}</h6>
</c:forEach>

 
<!-- {
  "machines": [
    {
      "name": "바벨",
      "url": "https://www.example.com/barbell"
    },
    {
      "name": "덤벨",
      "url": "https://www.example.com/dumbbell"
    },
    {
      "name": "스쿼트 랙",
      "url": "https://www.example.com/squat-rack"
    },
    ...
  ]
}
 -->