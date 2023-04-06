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