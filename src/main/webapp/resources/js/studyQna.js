
//studyQna목록
$('#studyQnaList').click(function getList(){
    fetch("/studyQna/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum'),{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })
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

    fetch("/studyQna/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum')+"&page="+page+"&kind="+kind+"&search="+search,{
        method:'GET'
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

    fetch("/studyQna/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum')+"&kind="+kind+"&search="+search,{
        method:'GET',
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })
})

$('#studyQnaInfo').click(function(){
    $('#studyListResult').html("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation.jpg'/>");
    $('#studyListResult').append("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation2.jpg'/>");

})


//studyReivew목록
$('#studyReviewList').click(function getList(){
    fetch("/studyReview/list?studyNum="+studyReviewList.getAttribute('data-review-studyNum'),{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })
})

//page를 요청할 수 있도록 만든 이벤트
$('#studyListResult').on("click",".page-review",function(e){
    let page = $(this).attr('data-board-page');
    let kind =''
    $(".searchOption").each(function(idx, item){
        if($(item).prop("selected")){
            kind = $(item).val();
        }
    })

    fetch("/studyReview/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum')+"&page="+page+"&kind="+kind+"&search="+search,{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })

    e.preventDefault();
})


//검색할 수 있도록 만든 이벤트
$('#studyListResult').on("click","#searchbtn",function(e){
    let kind = ''
    $(".searchOption").each(function(idx, item){
        if($(item).prop("selected")){
            kind = $(item).val();
        }
    })

    let search = $("#search").val();

    fetch("/studyReview/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum')+"&kind="+kind+"&search="+search,{
        method:'GET',
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyListResult').html(res.trim());
    })
})

$('#studyQnaInfo').click(function(){
    $('#studyListResult').html("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation.jpg'/>");
    $('#studyListResult').append("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation2.jpg'/>");

})