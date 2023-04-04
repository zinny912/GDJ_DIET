

$('.btn_delivery_change').click(()=>{
    open("/member/delivery?popUp=true", "_blank", "width=500 height=500")
})

//기본적으로 호출(처음엔 대표주소), delivery에서 선택누르면 return값 대입.
function deliveryCall(){}
$.ajax({
    type:"GET",
    url:"/order/paymentOrder",
    data:{
        addressNum:
        address:
        recipient:
        recipientTel:
    },
    success:()=>{},
    error:()=>{}
})