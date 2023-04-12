<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <c:import url="../template/common_css.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container-fluid">
<c:import url="../template/header.jsp"></c:import>
<div id="studyListResult"></div>



</div>

<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>

<script type="text/javascript">
//studyQna목록
fetch("/member/memberList",{
    method:'POST'
})
.then((response)=>response.text())
.then((res)=>{
    $('#studyListResult').html(res.trim());
})
    
//page를 요청할 수 있도록 만든 이벤트
$('#studyListResult').on("click",".page-qna",function(e){
    let page = $(this).attr('data-board-page');
    let kind =''
    $(".searchOption").each(function(idx, item){
        if($(item).prop("selected")){
            kind = $(item).val();
        }
    })

    let search = $("#search").val();

    fetch("/member/memberList?page="+page+"&kind="+kind+"&search="+search,{
        method:'POST'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })

    e.preventDefault();
})

//검색할 수 있도록 만든 이벤트
$('#studyListResult').on("click","#searchbutton",function(e){
    let kind = ''
    $(".searchOption").each(function(idx, item){
        if($(item).prop("selected")){
            kind = $(item).val();
        }
    })

    let search = $("#search").val();

    fetch("/member/memberList?kind="+kind+"&search="+search,{
        method:'POST',
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })
})




// let search = '';
// let kind = '';
// getPage()
// function getPage(){
//     fetch("/member/memberList?kind="+kind+"&search="+search,{
//         method:'POST',
//     })
//     .then((response)=>response.text())
//     .then((res)=>{
//         $('#studyListResult').html(res.trim());
//     })
// }

// //page를 요청할 수 있도록 만든 이벤트
// $('#studyListResult').on("click",".page-qna",function(e){
//     let page = $(this).attr('data-board-page');
// 	console.log(page)
//     $(".searchOption").each(function(idx, item){
//         if($(item).prop("selected")){
//             kind = $(item).val();
//         }
//     })

//     search = $("#search").val();
//     //페이지
//     fetch("/member/memberList?kind="+kind+"&search="+search+"&page="+page,{
//         method:'POST',
//     })
//     .then((response)=>response.text())
//     .then((res)=>{
//         $('#studyListResult').html(res.trim());
//     })

//     e.preventDefault();
// })

// //검색할 수 있도록 만든 이벤트
// $('#studyListResult').on("click","#searchbutton",function(e){
    
//     $(".searchOption").each(function(idx, item){
//         if($(item).prop("selected")){
//             kind = $(item).val();
//         }
//     })

// 	search = $("#search").val();
//     getPage()

// })
</script>

</body>
</html>