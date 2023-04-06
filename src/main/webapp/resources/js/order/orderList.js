
//orderNum으로 cartList불러오기
let orderLeng = document.getElementsByClassName("orderNum")
for(let i=0; i<orderLeng.length;i++){}
$.ajax({
    type:"GET",
    url:"/order/cartList",
    data:{
        orderNum:orderLeng[i].getAttribute("data-orderNum")
    },
    success: (res)=>{
        $('.cartListIn').html(res.trim())
    }
})

let popoverTriggerList = document.getElementsByClassName('to-cart-popper')
let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
title: "<a href='/cart/cartList' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">장바구니로</a>', html: true, placement: "right"}))






///장바구니 추가버튼
$('.orderDetails').on("click",'.btn-addCart',function(){
    
console.log("클리크")
    $.ajax({
        type:"POST",
        url:"/cart/cartAdd",
        data:{
            studyNum:$('.btn-addCart').attr("data-addCart"),
            machineNum:$('.btn-addCart').attr("data-addCart")
        },
        success: (res)=>{
            console.log(res.trim())


        },
        error: ()=>{
            console.log('실패')
        }
    })

})




