
//선택버튼 누르면 payment에 deliveryDTO 전달
$('.toPayment-mother').on("click", $('.toPayment'), function(){
    //
    console.log($(this).find($('.addressNum')).attr("data-addressNum"))
    // $(this).find($('.recipient')).attr("data-recipient")
    // $(this).find($('.address')).attr("data-address")
    // $(this).find($('.recipientTel')).attr("data-recipientTel")

    //부모창에 어케보냄?
    // open("_parent").$('.pay-deliver-ajax-recipient').text()=$(this).find($('.addressNum')).attr("data-id")
    opener.document.getElementsByClassName('pay-deliver-ajax-recipient').innerText=$(this).find($('.addressNum')).attr("data-id")
    
    //화면안바낌.. ajax로..
    console.log('go to newPaymentOrder')
    $.ajax({
        type:"GET",
        url:"/order/newPaymentOrder", 
        data:{
            addressNum:$(this).find($('.addressNum')).attr("data-addressNum"),
            address:$(this).find($('.address')).attr("data-address"),
            recipient:$(this).find($('.recipient')).attr("data-recipient"),
            recipientTel:$(this).find($('.recipientTel')).attr("data-recipientTel")
        },
        success:(res)=>{
            console.log(res.trim())
            $('.pay-deliver-ajax').html(res.trim())
            $(opener.document).find('.pay-deliver-ajax').html(res.trim())
            
        },
        error:()=>{}
    })
    
    //창닫기
    close()
})


// function deliveryCall(){
//     console.log('go to newPaymentOrder')
//     $.ajax({
//         type:"GET",
//         url:"/order/newPaymentOrder", 
//         data:{
//             addressNum:$(this).find($('.addressNum')).attr("data-addressNum"),
//             address:$(this).find($('.address')).attr("data-address"),
//             recipient:$(this).find($('.recipient')).attr("data-recipient"),
//             recipientTel:$(this).find($('.recipientTel')).attr("data-recipientTel")
//         },
//         success:(res)=>{
//             console.log(res.trim())
//             $('.pay-deliver-ajax').html(res.trim())
//             $(opener.document).find('.pay-deliver-ajax').html(res.trim())
            
//         },
//         error:()=>{}
//     })
// }