<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>

</head>
<body>
<input data-result="${result }" data-resultNum="${resultNum }" data-url="${url }" disabled="disabled" id="data">
<c:import url="../template/common_js.jsp"></c:import>
<script src="/resources/js/swal.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>