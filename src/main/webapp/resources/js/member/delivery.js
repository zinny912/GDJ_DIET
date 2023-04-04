
//선택버튼 누르면 payment에 deliveryDTO 전달
$('.toPayment-mother').on("click", $('.toPayment'), function(){

    console.log($(this).find($('.addressNum')).attr("data-id"))

    //부모창에 어케보냄?
    // open("_parent").$('.pay-deliver-ajax-recipient').text()=$(this).find($('.addressNum')).attr("data-id")
    opener.document.getElementsByClassName('pay-deliver-ajax-recipient').innerText=$(this).find($('.addressNum')).attr("data-id")
    //화면안바낌.. ajax로..
    deliveryCall()
    
    //창닫기
    close()
})
