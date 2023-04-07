const STATUS=$("#machineListResult").html();
//machineQna목록
$('#machineQnaList').click(function getList(){
    fetch("/machineQna/list?machineNum="+machineQnaList.getAttribute('data-qna-machineNum'),{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#machineListResult').html(res.trim());
    })
})

//page를 요청할 수 있도록 만든 이벤트
$('#machineListResult').on("click",".page-qna",function(e){
    let page = $(this).attr('data-board-page');
    let kind =''
    $(".searchOption").each(function(idx, item){
        if($(item).prop("selected")){
            kind = $(item).val();
        }
    })

    let search = $("#search").val();

    fetch("/machineQna/list?machineNum="+machineQnaList.getAttribute('data-qna-machineNum')+"&page="+page+"&kind="+kind+"&search="+search,{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#machineListResult').html(res.trim());
    })

    e.preventDefault();
})


//검색할 수 있도록 만든 이벤트
$('#machineListResult').on("click","#searchbutton",function(e){
    let kind = ''
    $(".searchOption").each(function(idx, item){
        if($(item).prop("selected")){
            kind = $(item).val();
        }
    })

    let search = $("#search").val();

    fetch("/machineQna/list?machineNum="+machineQnaList.getAttribute('data-qna-machineNum')+"&kind="+kind+"&search="+search,{
        method:'GET',
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#machineListResult').html(res.trim());
    })
})

$('#machineQnaInfo').click(function(){
    // $('#machineListResult').html("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation.jpg'/>");
    // $('#machineListResult').append("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources/images/studyDetailinfomation2.jpg'/>");
    $('#machineListResult').html(STATUS);
})