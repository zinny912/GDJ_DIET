
//선택버튼 누르면 payment에 deliveryDTO 전달
$('.toPayment-mother').on("click", '.toPayment', function(){
 
    opener.document.getElementsByClassName('pay-deliver-ajax').innerText=$(this).find($('.addressNum')).attr("data-id")

    $.ajax({
        type:"GET",
        url:"/order/newPaymentOrder", 
        data:{
            addressNum:$(this).attr("data-addressNum"),
            address:$(this).attr("data-address"),
            recipient:$(this).attr("data-recipient"),
            recipientTel:$(this).attr("data-recipientTel")
        },
        success:(res)=>{
            window.opener.secDeliveryCall(res.trim())
        },
        error:()=>{}
    })
    
    //창닫기
    close()
})
