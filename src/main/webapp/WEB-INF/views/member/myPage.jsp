<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>my page</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container-fluid">
<div class="row" style="height: 1000px;">
		<c:import url="./memberHeader.jsp"></c:import>


<div class="col text-center">
<h3>^^</h3>
study/studyDetail?studyNum=${sessionMember.studyNum}
</div>

</div></div>




<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>

</body>
</html>