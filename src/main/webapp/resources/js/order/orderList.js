
let orderDetails = document.getElementsByClassName("orderDetails")

for(let i=0; i<orderDetails.length;i++){


    $.ajax({
        type:"GET",
        url:"/order/listDetail",
        data:{
            orderDetailNum:orderDetails[i].getAttribute("data-orderDetailDTO")
        },
        success: (res)=>{
            // console.log(res.trim())

            orderDetails[i].innerHTML=res.trim()
        },
        error: ()=>{
            console.log('실패')
        }
    })

}
