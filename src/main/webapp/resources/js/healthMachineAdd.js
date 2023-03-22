//FileManger.js


const fileAdd = document.getElementById("fileAdd");
const fileList = document.getElementById("fileList");


let count=0;
let max=0;
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

// ---option--------------------------------------
$("#optionAdd").click(function(e){
    if(optioncount>=4){
        alert('옵션은 4개까지만 가능');
        return;
    }
    optioncount++;
    let child ='<div class="mb-3" id="option'+optioncount+'"'
    child=child + '<label for="option'+optioncount+'" class="form-label">'
    child = child+optioncount+' 번째 옵션 이름</label>'
    child = child+'<input type = "text" class="form-control" name="option'+optioncount+'">'
    child = child+"</div>";
    $("#optionList").append(child);
    
})
$("#optionDelete").click(function(e){
    if(optioncount<=1){
        alert('옵션1개는 필수 입니다.');
        return;
    }
    $("#option"+optioncount).remove();
    optioncount--;
})
