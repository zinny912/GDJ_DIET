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

// // modal에서 입력한 데이터를 JSON 형태로 만듦
// const formData = {
//     machineNum: $('#machineNum').val(),
//     title: $('#title').val(),
//     startDay: $('#startDay').val(),
//     endDay: $('#endDay').val(),
//     videoId: $('#videoId').val()
//   };
  
//   // AJAX로 서버로 데이터 전송
//   $.ajax({
//     type: 'POST',
//     url: '/routineAdd',
//     data: JSON.stringify(formData),
//     contentType: 'application/json',
//     success: function(data) {
//       // 서버에서 전송한 결과를 처리하는 코드
//       console.log(data);
//     },
//     error: function(xhr, status, error) {
//       // 오류 처리하는 코드
//       console.error(error);
//     }
//   });





// // add버튼 클릭 후 데이터를 넣고 담아 모달창 불러오기
// $("#routineBtn").on('click',".루틴 일정추가",function(e){
//     let num = $(this).attr("data-routine-num");

//     $("#routineConfirm").attr("data-routine-num",num);
// e.preventDefault();
// })

// // modal에서 확인버튼과 cancel버튼 눌렀을 때 동작
// $("#").click(function(){
//     console.log('Add Post');


//     fetch('/routine/routineAdd', {
//         method:'POST',
//         headers:{
//             "Content-type":"application/x-www-form-urlencoded"
//         },
//         body: "num="+$(this).attr("data-routine-num")+"&contents="+$(".note-editable").html()+"&score="+$('input[name=reviewStar]:checked').val()
//     }).then( (response) => response.text())
//       .then( (res) => {
//         if(res.trim()>0){
//             alert('글쓰기 성공');
//             $("#closeModal").click();
//             fetch("/routine/calendar"),{
//                 method:'GET'
//             })
//             .then((response)=>response.text())
//             .then((res)=>{
//                 $('#studyListResult').html(res.trim());
//             })           
//         }else {
//             alert('글쓰기 실패');
//         }
//       })
//        .catch(()=>{
//          alert('관리자에게 문의 하세요');
//        })


// })