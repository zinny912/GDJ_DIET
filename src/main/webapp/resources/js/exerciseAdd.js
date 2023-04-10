//FileManger.js


const fileAdd = document.getElementById("fileAdd");
const fileList = document.getElementById("fileList");
let param=""

let count=0;
let max=1;
let idx=0;
let optioncount=1;
function setCount(c){
 count = c;
}

function setParam(p){
    if(p==null){
        param="files";
    }
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

$("#del").click(function(){
    $("#frm").attr("action","./delete")
    
    let check=window.confirm("정말 삭제 하시겠습니까?");
    if(check){
        $("#frm").attr("method","post");
        $("#frm").submit();
    }
})