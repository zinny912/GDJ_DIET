
const date = new Date();
let pastDate  = new Date();
pastDate.setDate(pastDate.getDate() - 7);






datedate()
function datedate(){


//만약 안들어간경우.
if($('#startDate').val()==null||$('#startDate').val()==""){
    $('#startDate').val(pastDate.toISOString().slice(0,10))
}
if($('#endDate').val()==null||$('#endDate').val()==""){
    $('#endDate').val(date.toISOString().slice(0,10))
}

//마지막날짜+1
// input 요소를 가져옴
let dateInput = document.getElementById("endDate");
// input 요소의 value 속성에서 날짜를 가져옴
let currentDatePlus = new Date(dateInput.value); 
// 1일을 추가함
currentDatePlus.setDate(currentDatePlus.getDate() + 1);
// input 요소의 value 속성에 새로운 날짜를 설정함
// dateInput.value = currentDatePlus.toISOString().slice(0,10); //이거하면 html값도 바낌..


    $.ajax({
        type:"GET",
        url:"/order/listCalen",
        data:{
            startDate: $('#startDate').val(),
            endDate: currentDatePlus.toISOString().slice(0,10)  
    
    
        },
            success: (res)=>{
                $('.ajaxOut').html(res.trim())
                
                let discount=0;
                $('.salePrice').each(function(){
                    discount+= parseInt($(this).attr("data-salePrice"), 10);
                })
                $('.discount').text(discount-parseInt($('.totalPrice').attr("data-totalPrice"), 10));

            },
            error: ()=>{
                console.log('실패')
            }
    })
}

// $('#startDate').focus(()=>{console.log($('#startDate').val())})



//-----------------------달력--------------------------

// //orderNum으로 cartList불러오기
// let orderLeng = document.getElementsByClassName("order_number")

// //장바구니에 추가하기
// {
//     for(let i=0; i<orderLeng.length;i++){
//         $.ajax({
//             type:"GET",
//             url:"/order/cartList",
//             data:{
//                 orderNum:orderLeng[i].getAttribute("data-orderNum")
//             },
//             success: (res)=>{

//                 $('.cartListIn_'+orderLeng[i].getAttribute("data-orderNum")).html(res.trim())
//             }
//         })

//     }
// }

$(document).ajaxComplete(function(e){

    let popoverTriggerList = document.getElementsByClassName('to-cart-popper')
    let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
    title: "이건안해요...ㅠ", content:'<a href="/cart/cartList" class="btn btn-danger">장바구니로</a>', html: true}))

    e.preventDefault()
  });

// let popoverTriggerList = document.getElementsByClassName('to-cart-popper')
// let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
// title: "이건안해요...ㅠ", content:'<a href="/cart/cartList" class="btn btn-danger">장바구니로</a>', html: true}))


///장바구니 추가버튼
$('.order_number').on("click",'.btn-addCart',function(){
    
console.log("클리크")
    // $.ajax({
    //     type:"POST",
    //     url:"/cart/cartAdd",
    //     data:{
    //         studyNum:$('.btn-addCart').attr("data-addCart"),
    //         machineNum:$('.btn-addCart').attr("data-addCart"),
    //         cartPrice:$('.btn-addCart').attr("data-addCart-price"),

    //         count:'1',
    //         status:'2'
    //     },
    //     success: (res)=>{
    //         console.log(res.trim())


    //     },
    //     error: ()=>{
    //         console.log('실패')
    //     }
    // })

})

$('.order_number').on("click",'.btn-addCart-machine',function(){
      
    console.log("클리크")
        // $.ajax({
        //     type:"POST",
        //     url:"/cart/cartMachineAdd",
        //     data:{
        //         studyNum:$('.btn-addCart').attr("data-addCart"),
        //         machineNum:$('.btn-addCart').attr("data-addCart"),
        //         cartPrice:$('.btn-addCart').attr("data-addCart-price"),

        //         count:'1',
        //         status:'2',

        //         machineNum:$('.btn-addCart').attr("data-addCart-machineNum"),
        //         optId1:$('.btn-addCart').attr("data-addCart-op1"),
        //         optId2:$('.btn-addCart').attr("data-addCart-op2"),
        //         optId3:$('.btn-addCart').attr("data-addCart-op3"),
        //         optId4:$('.btn-addCart').attr("data-addCart-op4")
        //     },
        //     success: (res)=>{
        //         console.log(res.trim())
    
    
        //     },
        //     error: ()=>{
        //         console.log('실패')
        //     }
        // })
    
    })


