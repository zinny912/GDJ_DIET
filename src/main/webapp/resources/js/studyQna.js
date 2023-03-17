
//studyQna목록
$('#studyQnaList').click(function getList(){
    fetch("/studyQna/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum'),{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyQnaListResult').html(res.trim());
    })
})

//page를 요청할 수 있도록 만든 이벤트
$('#studyQnaListResult').on("click",".page-link",function(e){
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
        $('#studyQnaListResult').html(res.trim());
    })

    e.preventDefault();
})

//검색할 수 있도록 만든 이벤트
$('#studyQnaListResult').on("click","#searchbutton",function(e){
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
        $('#studyQnaListResult').html(res.trim());
    })
})

$('#studyQnaInfo').click(function(){
    $('#studyQnaListResult').html("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation.jpg'/>");
    $('#studyQnaListResult').append("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation2.jpg'/>");
})