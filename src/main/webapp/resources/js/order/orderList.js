


let orderDetails = document.getElementsByClassName("orderDetails")

{


for(let i=0; i<orderDetails.length;i++){

    $.ajax({
        type:"GET",
        url:"/order/listDetail",
        // async: false,
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

    if(i==orderDetails.length-1){
        console.log("도착")

        let popoverTriggerList = document.getElementsByClassName('to-cart-popper')
        let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
        title: "<a href='/cart/cartList' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">장바구니로</a>', html: true, placement: "right"}))

        
        
        // let popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        // let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
        // title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))

        // let popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        // let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
        // title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))


        // var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        // var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        //   return new bootstrap.Popover(popoverTriggerEl)
        // })

        // var popover = new bootstrap.Popover(document.getElementsByClassName('.to-cart-popper'), {
        //     container: 'body',
        //     title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", 
        //     content:'<a href="" class="btn btn-danger">나야나</a>', 
        //     html: true, 
        //     placement: "right"
        //   })

    }
   
}

// const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
// const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, {
//   title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))

}

// $(document).ready(function(){
//     addCartModal()
// })

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



// function addCartModal(){
//     console.log("addCartModal")

// let popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
// let popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl, { container: 'body',
//   title: "<h1><strong>HTML</strong> inside <code>the</code> <em>popover</em></h1><br><a href='/' type='button'>버튼</a>", content:'  <a href="" class="btn btn-danger">나야나</a>', html: true, placement: "right"}))

// }


