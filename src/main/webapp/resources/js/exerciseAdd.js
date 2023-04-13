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
    child = child + '<input type="file" class="form-control essential" name="'+param+'">'
    child = child + '<button type="button" class="btn btn-outline-danger dels" data-dels-id="f'+idx+'">X</button></div>'
    child = child+'</div>';
    $("#fileList").append(child);
    idx++;
});


$("#del").click(function(){
    $("#frm").attr("action","./delete")
    
    let check=window.confirm("정말 삭제 하시겠습니까?");
    if(check){
        $("#frm").attr("method","post");
        $("#frm").submit();
    }
})

let machineNum= $("#machineNum").attr("data-machineNum")
console.log(machineNum);
$(".machines").each(function(index,machine){
    if($(machine).val()==machineNum*1){
        $(machine).prop("checked",true)
    }
})
$("#machineCheckout").click(function(){
    $(".machines").each(function(index,machine){
    $(machine).prop("checked",false)
})
})
$(".bodys").each(function(index,body){
    $(".checkbodys").each(function(i,checkbody){
        if($(body).val()==$(checkbody).attr("data-bodydata")*1){
            $(body).prop("checked",true)
        }
    })
    
})
let powerchecked=$("#power").attr("data-power")
$(".ty1").each(function(index,power){
    if($(power).val()==powerchecked*1){
        $(power).prop("checked",true)
    }
})
$("#fileChange").click(function(){
    let check = window.confirm("썸네일을 변경 하시겠습니까?");
    if (check) {
        $("#fileList").empty()
        $("#fileList").append('<input type="file" class="form-control essential" name="Files">')

    }

})

// $("#submitbtn").click(function(){
//     let nullCheck=false;
//     let checkCount=0
    
//     $(".check").each(function(index,check){
//         if($(check).prop("checked")==true){
//             checkCount=1;
//         }
//     })
//     if(checkCount==0){
//         alert("하나 이상의 부위를 선택해야 합니다.")
//         return false;
//     }
//     $(".essential").each(function(index,essential){
//         if($(essential).val().length==0){
//             alert("입력란을 다시 확인해주세요");
//             nullCheck=true;
//             return false;
//         }
//     })
//     if(nullCheck!=true){
//         $("#frm").submit();

//     }
  
// })