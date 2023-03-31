
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

    let search = $("#search").val();

    fetch("/studyReview/list?studyNum="+studyReviewList.getAttribute('data-review-studyNum')+"&page="+page+"&kind="+kind+"&search="+search,{
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

    fetch("/studyReview/list?studyNum="+studyReviewList.getAttribute('data-review-studyNum')+"&kind="+kind+"&search="+search,{
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

// add버튼 클릭 후 데이터를 넣고 담아 모달창 불러오기
$("#studyListResult").on('click',".add",function(e){
    //console.log(updateButton.parentNode.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling);
    let num = $(this).attr("data-comment-num");

    $("#contentsConfirm").attr("data-comment-num",num);
e.preventDefault();
})

// modal에서 확인버튼과 cancel버튼 눌렀을 때 동작
$("#contentsConfirm").click(function(){
    console.log('Add Post');


    fetch('/studyReview/add', {
        method:'POST',
        headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body: "studyNum="+$(this).attr("data-comment-num")+"&contents="+$(".note-editable").html()+"&score="+$('input[name=reviewStar]:checked').val()
    }).then( (response) => response.text())
      .then( (res) => {
        if(res.trim()>0){
            alert('글쓰기 성공');
            $("#closeModal").click();
            fetch("/studyReview/list?studyNum="+studyReviewList.getAttribute('data-review-studyNum'),{
                method:'GET'
            })
            .then((response)=>response.text())
            .then((res)=>{
                $('#studyListResult').html(res.trim());
            })           
        }else {
            alert('글쓰기 실패');
        }
      })
       .catch(()=>{
         alert('관리자에게 문의 하세요');
       })


})