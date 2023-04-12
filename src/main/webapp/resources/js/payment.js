let TotalCost = $("#totalCost").attr("data-totalCost")
// $.ajax({
//     url:"https://api.iamport.kr/users/getToken",
//     method:"POST",
//     headers: { "Content-Type": "application/json" },
//     data: {
//         imp_key: "6656783584856360",            
//         imp_secret: "FlXOZ4fWIaOoyfF87hqKSTqqlp5uTiZgjC7rfjY3G7xquzfKRwNs7te2qiwv0xrkj9IhkHB7HtfHv3fY"   // 주문번호
        
//     }
// }).done(function(res){
//     console.log(res)
//     let response =JSON.stringify(res);
//     console.log(response)
// })

TotalCost = 10
let str = ""
var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds;

function checkPayment() {
    IMP.init("imp85424567");
    IMP.request_pay({
        pg: 'kcp', //테스트 시 html5_inicis.INIpayTest 기재 
        pay_method: 'card',
        merchant_uid: "IMP" + makeMerchantUid, //상점에서 생성한 고유 주문번호
        name: '결제:결제테스트',
        amount: TotalCost,
        buyer_email: $('#ordererEmail').text().trim(),
        buyer_name: $('#ordererEmail').text().trim(),
        buyer_tel: $('#ordererPhone').text().trim(),   //필수 파라미터 입니다.
        buyer_addr: $('#ordererName').text().trim(),
        buyer_postcode: '123-456'
        
    }, function (rsp) { // callback
        if (rsp.success) {
            str = JSON.stringify(rsp);
            console.log(str);//왠진 모르겠는데 콘솔 안찍으면 안나오고 찍으면 나옴;
            jQuery.ajax({
                url: "/order/success",
                method: "POST",
                // headers: { "Content-Type": "application/json" },
                data: {
                    // imp_uid: rsp.imp_uid,            // 결제 고유번호
                    // merchant_uid: rsp.merchant_uid   // 주문번호
                    result:str
                }
            }).done(function (data) {
                if (data.trim()*1 > 0) {
                    $("#frm").attr("action", "/order/paymentUpdate")
                    $("#frm").attr("method", "post");
                    $("#frm").submit();
                }
                else{
                    $("#frm").attr("action", "/order/orderFaild")
                    $("#frm").attr("method", "get");
                    $("#frm").submit();
                }
            })
        } else {
            alert("알수없는 오류가 발생하였습니다. 홈으로 이동합니다.");
            $("#formTag").submit()

        }
    });
};

// IMP.request_pay(rep,
//   function (rsp) {
//     if (rsp.success) {
//       // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
//       // jQuery로 HTTP 요청
//       jQuery.ajax({
//         url: "{서버의 결제 정보를 받는 가맹점 endpoint}",
//         method: "POST",
//         headers: { "Content-Type": "application/json" },
//         data: {
//           imp_uid: rsp.imp_uid,            // 결제 고유번호
//           merchant_uid: rsp.merchant_uid   // 주문번호
//         }
//       }).done(function (data) {
//         console.log("성공")
//       })
//     } else {
//       alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
//     }
//   });