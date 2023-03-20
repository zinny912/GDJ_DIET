
$('#studyQnaList').click(function(){
    fetch("/studyQna/list?studyNum="+studyQnaList.getAttribute('data-study-studyNum'),{
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $('#studyQnaListResult').html(res.trim());
    })
})

$('#studyQnaInfo').click(function(){
    $('#studyQnaListResult').html("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources//resources/images/bodyimg/studyDetailinfomation.jpg'/>");
    $('#studyQnaListResult').append("<img class='img-fluid rounded mb-4 mb-lg-0' src='/resources//resources/images/bodyimg/studyDetailinfomation2.jpg'/>");

})