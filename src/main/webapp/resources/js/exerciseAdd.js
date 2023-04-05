//FileManger.js


const fileAdd = document.getElementById("fileAdd");
const fileList = document.getElementById("fileList");


let count=0;
let max=1;
let idx=0;
let optioncount=1;
function setCount(c){
 count = c;
}

function setParam(p){
    param=p;
}
 
function setMax(m){
    max=m;
}

$("#fileList").on("click",".dels",function(e){
    
    $(this).parent().remove();
    count--;
    idx--;
})


$("#fileAdd").click(()=>{
    // alert("add");
    
    if(count>=max){
        
        alert('첨부파일은 최대 '+max+ ' 까지만 가능');
        return;
    }
    
    count++;

    let child = '<div class="input-group mb-3" id="f'+idx+'">';
    child = child + '<input type="file" class="form-control" name="'+param+'">'
    child = child + '<button type="button" class="btn btn-outline-danger dels" data-dels-id="f'+idx+'">X</button></div>'
    child = child+'</div>';
    $("#fileList").append(child);
    idx++;
});


$(".deleteCheck").click(function(e){
    let result  = confirm("파일이 영구 삭제 됩니다.")
    let ch =$(this);
    if(result){
        let fileNum = $(this).val();
        $.ajax({
            type:"POST",
            url:"./boardFileDelete",
            data:{
                fileNum:fileNum
            },
            success : function(response){
                if(response.trim()>0){
                    alert("삭제되었습니다.")
                    ch.parent().parent().remove();
                    //this : ajax객체 자기자신
                    console.log($(ch))
                    count--;
                }else{
                    alert("삭제 실패하였습니다.")
                }
            },
            error:function(){

            }
        })
        

    }else{
        $(this).prop('checked',false)
    }
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