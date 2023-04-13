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
<c:import url="../template/common_js.jsp"></c:import>
<script type="text/javascript">
	let message="${result}";
	if(message != ''){
		swal("sd","d","error");
	}
	/* location.href="${url}"; */
</script>
</body>
</html>