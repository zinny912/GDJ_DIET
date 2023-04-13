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
<%-- 		<c:import url="./memberHeader.jsp"></c:import> --%>

<div class="col-2 mx-1 mb-3">
<h3 class="h3" style="margin-left:15px;"> 마이페이지 </h3>
<ul class="nav flex-column" >
  <li class="nav-item">
    <a class="nav-link active mt-1" aria-current="page" href="/order/list">주문/배송</a>
  </li>
  <li class="nav-item">
    <c:if test="${sessionMember.studyNum ne null}">
  	<a class="nav-link" href="/member/myPage">수업</a>
  </c:if>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="/member/update">개인정보</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="/member/delivery">배송지 설정</a>
  </li>
  <c:if test="${sessionMember.roleDTO.roleName eq 'ADMIN'}">
  <li><a class="nav-link" href="/member/manage">회원관리</a></li>
  </c:if>

</ul>
</div>

<div class="col-8">
<div hidden="" class="nav-link" id="studyQnaList" data-study-studyNum="${sessionMember.studyNum}"></div>
	<div id="studyListResult" class=""></div>
</div>


</div><!-- row end -->
</div>




<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>

<script type="text/javascript">
console.log($('#studyQnaList').attr('data-study-studyNum'))
if($('#studyQnaList').attr('data-study-studyNum')==""||$('#studyQnaList').attr('data-study-studyNum')==null){
	$('#studyListResult').html("사세요...");
}else{
	//상품창에서 말고 여기서 myPage보낼께..
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
	
}

</script>
<c:if test="${sessionMember.studyNum ne null}">
<script src="/resources/js/studyBoard.js"></script>
</c:if>

</body>
</html>