
//orderNum으로 cartList불러오기
let orderLeng = document.getElementsByClassName("order_number")
{for(let i=0; i<orderLeng.length;i++){
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

if(i==orderLeng.length-1){
    console.log("도착")
let popoverTriggerList = document.getElementsByClassName('to-cart-popper')
let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
title: "<a href='/cart/cartList' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">장바구니로</a>', html: true, placement: "right"}))

// const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
// const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, {
//   title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))

}}}




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


