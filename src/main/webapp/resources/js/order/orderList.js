
//orderNum으로 cartList불러오기
let orderLeng = document.getElementsByClassName("order_number")

//장바구니에 추가하기
{
    for(let i=0; i<orderLeng.length;i++){
        $.ajax({
            type:"GET",
            url:"/order/cartList",
            data:{
                orderNum:orderLeng[i].getAttribute("data-orderNum")
            },
            success: (res)=>{

                $('.cartListIn_'+orderLeng[i].getAttribute("data-orderNum")).html(res.trim())
            }
        })

    }
}

$(document).ajaxComplete(function(){
        let popoverTriggerList = document.getElementsByClassName('to-cart-popper')
        let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
        title: "이건안해요...ㅠ", content:'<a href="/cart/cartList" class="btn btn-danger">장바구니로</a>', html: true}))
  });



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


