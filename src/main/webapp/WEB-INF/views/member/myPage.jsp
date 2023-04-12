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

<div class="col text-center">
<h3>^^</h3>
study/studyDetail?studyNum=${sessionMember.studyNum}
</div>


<div class="container-fluid">
<div class="row">
		<c:import url="./memberHeader.jsp"></c:import>

<div class="col-9">
<div hidden="" class="nav-link" id="studyQnaList" data-study-studyNum="${sessionMember.studyNum}" style="cursor: pointer">Q&amp;A(${qna})</div>
	<div id="studyListResult" class=""></div>
</div>


</div><!-- row end -->
</div>



<script src="/resources/js/studyBoard.js"></script>
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>

<script type="text/javascript">
	fetch("/studyQna/list?myPage=y&studyNum="+studyQnaList.getAttribute('data-study-studyNum'),{
	    method:'GET'
	})
	.then((response)=>response.text())
	.then((res)=>{
	    $('#studyListResult').html(res.trim());
	})
// 	$('#studyListResult').on("click",$('.ajax-myPage'),function(){
// 		$.ajax({
// 			type:"GET", 
// 			url:"/studyQna/add", 
// 			data:{
// 				myPage:"y",
// 				studyNum:$('#studyQnaList').attr('data-study-studyNum')
// 				}, 
// 				success:function (res){
// 					$('#studyListResult').html(res.trim());
// 					}
// 		})		
// 	})
</script>

</body>
</html>