
let openWin;

$('.btn_delivery_change').click(()=>{
    console.log('새창')
    // open("/member/delivery?popUp=true", "_blank", "width=500 height=500")

    openChild()

})

//기본적으로 호출(처음 대표주소)
deliveryCall()
function deliveryCall(){
    console.log('go to newPaymentOrder')
    $.ajax({
        type:"GET",
        url:"/order/newPaymentOrder", 
        data:{
            // addressNum:
            // address:
            // recipient:
            // recipientTel:
        },
        success:(res)=>{
            console.log(res.trim())
            $('.pay-deliver-ajax').html(res.trim())
            
            
        },
        error:()=>{}
    })
}

function openChild() {
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/member/delivery?popUp=true", "childForm", "width=570, height=570, resizable = no, scrollbars = no");    
}

//새창에서 바뀐주소 받아옴.
function secDeliveryCall(html){
    $('.pay-deliver-ajax').html(html);
}