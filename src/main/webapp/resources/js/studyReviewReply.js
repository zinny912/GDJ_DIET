//study review detail 들어갔을 때, 댓글 목록
getList(1);
function getList(page){
    fetch("/studyReviewComment/list?num="+$('#studyQnaReplyResult').attr('data-study-reply')+"&page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $("#studyQnaReplyResult").html(res.trim());
    })
}

//댓글 추가
$('#replyAdd').click(function(){
    fetch("/studyReviewComment/add", {
        method:'POST',  
        headers:{'Content-type':"application/x-www-form-urlencoded"},
        body:"num="+$('#studyQnaReplyResult').attr("data-study-reply")+"&comments="+$("#replyContents").val()
    }).then((response)=> response.text())
    .then((res)=>{
        if(res.trim()==1){ 
            alert('댓글이 등록 되었습니다')
            $("#replyContents").val("");
            getList(1);            
        }else {
            alert('댓글 등록에 실패 했습니다')
        }
    })
     .catch(()=>{
         console.log('error 발생');
     });

})

//page를 요청할 수 있도록 만든 이벤트
$('#studyQnaReplyResult').on("click",".page-comment",function(e){
    let page = $(this).attr('data-board-page');
    getList(page);
    e.preventDefault();
})

// delete
$("#studyQnaReplyResult").on('click','.del',function(e){

    fetch("/studyReviewComment/delete", {
        method:'POST',
         headers:{
             "Content-type":"application/x-www-form-urlencoded"
         },
         body:"commentNum="+$(this).attr("data-comment-num")
         //응답객체에서 Data 추출
    }).then((response)=>{return response.text()}) //then(function(response){return response.text()})   
            //추출한 Data 사용
         .then((res)=>{
          if(res.trim()>0){
              alert('댓글이 삭제 되었습니다');
              getList(1);
           }else {
              alert('삭제 실패');
           }
      })
           .catch(()=>{
              alert('에러 발생');
           });

    e.preventDefault();
    }
)