
let machineNum = $("#optionSelect").attr("data-machineNum");
let idx = 0;
let optId1 = null;
let optId2 = null;
let optId3 = null;
let optId4 = null;
let optId5 = null;
let url = "";
let select = "";
let toggleStatus = "off";
let toggleFlag=false;
let optName

$.ajax({
    type: "POST",
    url: "./option1",
    data: {
        machineNum: machineNum
    },
    success: function (response) {

        $("#optSelect1").append(response.trim())
        
    },
    error: function () {
        console.log("error");
    }
})

$("#optionSelect").on("click", ".op1", function (e) {
    idx = 2;

    optId1 = $(this).attr("data-id");
    console.log(optId1)

    getOption(2);

    $.ajax({

        type: "POST",
        url: "./option2",
        data: {
            machineNum: machineNum,
            optId1: optId1
        },
        success: function (response) {
            
            if (response.trim().length > 20) {
                $("#opt2").append(select);
                $("#optSelect2").append(response.trim())
            }
            else{
                $("#cartAdd").removeClass("btn-outline-primary")
                $("#cartAdd").addClass("btn-primary")
                $("#cartAdd").attr("disabled",false)
            //     if($("#btn").find('#optionDelete').length<=0)
            //     $("#btn").prepend('<button id="optionDelete" type="button" class="btn btn-border">해당옵션삭제</button>')
            }
        },
        error: function () {
            console.log("error");
        }
    })



})
$("#optionSelect").on("click", ".op2", function (e) {

    optId2 = $(this).attr("data-id")
    console.log(optId2)
    // idx=3;
    // optName=$("#opt3").attr("data-optName")
    // select ='<select class="form-select mb-3" id="optSelect3">'
    // select=select+'<option class="option"  id="default">'+optName
    // select=select+'을 선택해주세요</option></select>'
    getOption(3);
    idx = 3;
    $.ajax({

        type: "POST",
        url: "./option3",
        data: {
            machineNum: machineNum,
            optId1: optId1,
            optId2: optId2
        },
        success: function (response) {
            if (response.trim().length > 20) {
                $("#opt" + idx).append(select);
                $("#optSelect3").append(response.trim())
            }
            else{
                $("#cartAdd").removeClass("btn-outline-primary")
                $("#cartAdd").addClass("btn-primary")
                $("#cartAdd").attr("disabled",false)
            //     if($("#btn").find('#optionDelete').length<=0)
            //     $("#btn").prepend('<button id="optionDelete" type="button" class="btn btn-border">해당옵션삭제</button>')
            }
            
        },
        error: function () {
            console.log("error");
        }
    })



})

$("#optionSelect").on("click", ".op3", function (e) {
    optId3 = $(this).attr("data-id");
    getOption(4);
    
    $.ajax({

        type: "POST",
        url: url,
        data: {
            machineNum: machineNum,
            optId1: optId1,
            optId2: optId2,
            optId3: optId3
        },
        success: function (response) {

            if (response.trim().length > 20) {
                $("#opt" + idx).append(select);
                $("#optSelect4").append(response.trim())
            }
            else{
                $("#cartAdd").removeClass("btn-outline-primary")
                $("#cartAdd").addClass("btn-primary")
                $("#cartAdd").attr("disabled",false)
            //     if($("#btn").find('#optionDelete').length<=0)
            //     $("#btn").prepend('<button id="optionDelete" type="button" class="btn btn-border">해당옵션삭제</button>')
            }   
        },
        error: function () {
            console.log("error");
        }
    })

})
$("#optionSelect").on("click", ".op4", function (e) {
    optId4 = $(this).attr("data-id");
    
        
    $("#opt" + 5).children().remove()
    $("#cartAdd").removeClass("btn-outline-primary")
    $("#cartAdd").addClass("btn-primary")
    $("#cartAdd").attr("disabled",false)         
            
    // $("#btn").find("#optionDelete").remove()
    // $("#btn").prepend('<button id="optionDelete" type="button" class="btn btn-border">해당옵션삭제</button>')
    // $.ajax({

    //     type: "POST",
    //     url: url,
    //     data: {
    //         machineNum: machineNum,
    //         optId1: optId1,
    //         optId2: optId2,
    //         optId3: optId3,
    //         optId4: optId4
    //     },
    //     success: function (response) {

    //         if (response.trim().length > 20) {
    //             $("#opt" + idx).append(select);
    //             $("#optSelect4").append(response.trim())
    //         }
    //         else{
    //             if($("#btn").find('#optionDelete').length<=0){

    //             }
                
    //         }
           
    //     },
    //     error: function () {
    //         console.log("error");
    //     }
    // })

});

// function getOption(optSelectNum) {
//     optName = $("#opt" + optSelectNum).attr("data-optName")
//     url = "./option" + optSelectNum
//     select = '<select class="form-select mb-3" id="optSelect' + optSelectNum + '">'
//     select = select + '<option class="option"  id="default">' + optName
//     select = select + '을 선택해주세요</option></select>'
//     for (i = optSelectNum; i <= 5; i++) {
//         $("#optSelect" + i).remove()
//     }


// }

// $('#optbtn1').on("focus",function(e){
//     let $this = $(this).parents(".dropdown");
//     $this.addClass('show');
//     $this.find('> a').attr('aria-expanded', true);
//     // $this.find('.dropdown-menu').addClass('animated-fast fadeInUp show');
//     $this.find('.dropdown-menu').addClass('show');
// })

function getOption(optSelectNum) {
    optName = $("#opt" + optSelectNum).attr("data-optName")
    url = "./option" + optSelectNum
    idx=optSelectNum
    select = '<button class="btn dropdown-toggle" id=optbtn' + optSelectNum + '>'
    select = select + optName + '을 선택해주세요</button><div class="dropdown-menu"><ul style="list-style: none;" id=optSelect' + optSelectNum + '>'
    select = select + '</ul></div>'
    for (i = optSelectNum; i <= 5; i++) {
        
        $("#opt" + i).children().remove()
        
    }
    $("#btn").find("#optionDelete").remove()
}


$(".container-fluid").click(function () {
    
    if (toggleFlag==true&&toggleStatus != "") {
        
        toggleFlag=false
        return;
    }
    else if(toggleFlag==false){
    $(this).find('.dropdown').removeClass('show')
        $(this).find('.dropdown-menu').removeClass('show');
        toggleStatus=""
    }
})
$(".dropdown").on("click", ".dropdown-toggle", function () {
    let $this = $(this).parents(".dropdown");
    let parent = $(this).parents("#optionSelect")

    parent.find('.dropdown').removeClass('show')
    parent.find('.dropdown-menu').removeClass('show');
    toggleFlag=false

    if (toggleStatus != $(this).attr("id")) {
        $this.addClass('show');
        $this.find('> a').attr('aria-expanded', true);
        $this.find('.dropdown-menu').addClass('show');
        toggleStatus = $(this).attr("id");
        toggleFlag=true;
        return;
    }
    toggleStatus = "";


})

$(".dropdown").on("click", ".dropdown-item", function () {
    let $this = $(this).parents(".dropdown");

    $this.find(".btn").html($(this).attr("data-name")+"을 선택하였습니다.")

    $this.removeClass('show');
    // $this.find('> a').attr('aria-expanded', false);
    $this.find('.dropdown-menu').removeClass('show');
    toggleFlag=false
    toggleStatus = "";
})

$("#del").click(function(){
    $("#frm").attr("action","./delete")
    
    let check=window.confirm("정말 삭제 하시겠습니까?");
    if(check){
        $("#frm").attr("method","post");
        $("#frm").submit();
    }
})

//개별옵션 삭제
// $("#btn").on("click","#optionDelete",function(){
    
//     $("#frm").attr("action","./optionDelete")
//     $("#frm").find("#optId1").val(optId1)
//     $("#frm").find("#optId2").val(optId2)
//     $("#frm").find("#optId3").val(optId3)
//     $("#frm").find("#optId4").val(optId4)

//     let check=window.confirm("정말 옵션을 삭제 하시겠습니까?");
//     if(check){
//         $("#frm").attr("method","post");
//         $("#frm").submit();
//     }
// })
//장바구니
$("#btn").on("click","#cartAdd",function(){
    
    // $("#frm").attr("action","cart/cartMachineAdd")
    // $("#frm").find("#optId1").val(optId1)
    // $("#frm").find("#optId2").val(optId2)
    // $("#frm").find("#optId3").val(optId3)
    // $("#frm").find("#optId4").val(optId4)

    let check=window.confirm("장바구니에 추가 하시겠습니까?");
    let redirect;
    if(check){
  
        $.ajax({
            type:"POST",
            url:"/cart/cartMachineAdd",
            data:{
                machineNum:machineNum,
                optId1:optId1,
                optId2:optId2,
                optId3:optId3,
                optId4:optId4
            },
            success : function(response){
                console.log(response.trim())
                if (response.trim() > 0) {
                    alert("장바구니에 추가되었습니다.")
                    redirect = window.confirm("장바구니로 이동 하시겠습니까?");
                    if (redirect) {
                        $("#frm").attr("action", "../../cart/cartList")
                        $("#frm").attr("method", "get");
                        $("#frm").submit();
                    }
                } else {
                    alert("실패하였습니다.")
                }
            },
            error: function () {

            }
        })
        
    }
    
})
// // 딜리트 버튼 누르면 메서드는 포스트로 바꿈

// const frm= window.document.getElementById("frm");
// const del = window.document.getElementById("del");

// del.addEventListener("click",function(){
//     frm.setAttribute("action","./delete")

//     // let attr = document.createAttribute("method");
//     // attr.value='post'
//     // frm.setAttributeNode(attr);
//     // del.setAttribute("type","submit");
//     let check=window.confirm("정말 삭제 하시겠습니까?");
//     if(check){
     
//     frm.setAttribute("action","delete");
//     frm.setAttribute("method","post");
//     frm.submit();
   
//     }    
// })


// optionAdd


// for(i=1;i<5;i++){
//     ul='<div class="dropdown-menu"><ul style="list-style: none;" id=optSelect' + i + '></ul></div>'
//     $.ajax({
//         type:"POST",
//         url:"./option"+i,
//         data:{machineNum:machineNum},
//         success: function (response) {
//             console.log(response.trim);
//             if (response.trim().length > 20) {
//                 $("#opt" + i).append(ul);
//                 $("#optSelect" + i).append(response.trim())
//             }
//         },
//         error: function () {
//             console.log("error");
//         }
//     })
// }

// $(".dropdown").on("click",".optInput",function(){

//     let $this = $(this).parents(".dropdown");
//     $this.addClass('show');
//     $this.find('.dropdown-menu').addClass('show');
// })
// $(".dropdown").on("click",".optInput",function(){
//     idx=$(this).attr("data-index")
//     url="./option"+idx
//     ul='<div class="dropdown-menu"><ul style="list-style: none;" id=optSelect' + idx + '></ul></div>'
//     console.log(url)
    
//     $.ajax({

//         type: "POST",
//         url: url,
//         data: {
//             machineNum: machineNum,
            
//         },
//         success: function (response) {

//             if (response.trim().length > 20) {
//                 $("#opt" + idx).append(ul);
//                 $("#optSelect"+idx).append(response.trim())
//             }
//         },
//         error: function () {
//             console.log("error");
//         }
//     })

//     let $this = $(this).parents(".dropdown");
//     $this.addClass('show');
//     $this.find('.dropdown-menu').addClass('show');

// })




