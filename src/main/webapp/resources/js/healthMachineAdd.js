//FileManger.js


const fileAdd = document.getElementById("fileAdd");
const fileList = document.getElementById("fileList");


let count=0;
let max=0;
let idx=0;
let optioncount=1;
let notification = "상세정보파일";
function setCount(c){
 count = c;
}

function setParam(p){
    param=p;
}
 
function setMax(m){
    
    max=m;
    if(max==1){
        notification="썸네일";
    }
}

$("#fileList").on("click",".dels",function(e){
    
    $(this).parent().remove();
    count--;
    idx--;
})


$("#fileAdd").click(()=>{
    // alert("add");
   
    if(count>=max){
        
        alert(notification+'은 최대 '+max+ ' 까지만 가능');
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
    child = childs+'<input type = "text" class="form-control" name="option'+optioncount+'">'
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

// $('#input1').on("focus",function(e){
//     let $this = $(this).parents(".dropdown");
//     $this.addClass('show');
//     $this.find('> a').attr('aria-expanded', true);
//     // $this.find('.dropdown-menu').addClass('animated-fast fadeInUp show');
//     $this.find('.dropdown-menu').addClass('show');
// })
// $('.dropdown-item').on("click",function(){
//     let $this=$(this).parents(".dropdown");
    
// })
// $("#optAdd1").hover(function(e){
//     var $this = $(this);
//     $this.addClass('show');
//     $this.attr('aria-expanded',true)
// 	$this.find('> a').attr('aria-expanded', true);
//     $this.find('.dropdown-menu').addClass('show');
//     $this.find('.dropdown-menu').attr('style',"position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 40px);");
//     $this.find('.dropdown-menu').attr('data-popper-placement',"bottom-start")
// },function(e){
//     var $this = $(this);
// 	$this.removeClass('show');
// 	$this.find('> a').attr('aria-expanded', false);
// 	$this.find('.dropdown-menu').removeClass('show');
		

// }
// )