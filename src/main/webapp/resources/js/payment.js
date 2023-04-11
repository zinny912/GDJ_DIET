let TotalCost=$("#totalCost").attr("data-totalCost")


TotalCost=10
let str=""
var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;

function checkPayment(){
	IMP.init("imp85424567");
	IMP.request_pay({
    pg : 'kcp', //테스트 시 html5_inicis.INIpayTest 기재 
    pay_method : 'card',
    merchant_uid:"IMP"+makeMerchantUid, //상점에서 생성한 고유 주문번호
    name : '결제:결제테스트',
    amount : TotalCost,
    buyer_email : $('#ordererEmail').text().trim(),
    buyer_name : $('#ordererEmail').text().trim(),
    buyer_tel : $('#ordererPhone').text().trim(),   //필수 파라미터 입니다.
    buyer_addr : $('#ordererName').text().trim(),
    
    buyer_postcode : '123-456'
    //m_redirect_url : '/order/list',
    // escrow : true, //에스크로 결제인 경우 설
    // // bypass : {
    // //     acceptmethod : "noeasypay" // 간편결제 버튼을 통합결제창에서 제외(PC)
    // //     //P_RESERVED: "noeasypay=Y"  // 간편결제 버튼을 통합결제창에서 제외(모바일) 
    // //     //cceptmethod: 'cardpoint'  // 카드포인트 사용시 설정(PC) 
    // //   	// P_RESERVED : 'cp_yn=Y'     // 카드포인트 사용시 설정(모바일) 
    // // },
    // // period : {
    // //    from : "20200101", //YYYYMMDD
    // //    to : "20201231"   //YYYYMMDD
    // // } 
}, function (rsp) { // callback
    // console.log(rsp);
    str= JSON.stringify(rsp);
    if (rsp.success) {
        jQuery.ajax({
            url: "/order/success", 
            method: "POST",
            //dataType:"jsonp",
            // headers: { "Content-Type": "application/jsonp" },
            data: {
            //   imp_uid: rsp.imp_uid,            // 결제 고유번호
            //   merchant_uid: rsp.merchant_uid,   // 주문번호
              jsonString:str
            }
          }).done(function (data) {
            console.log(data.trim())
            if(data.trim()=='1'){
                $("#frm").attr("action","/order/paymentUpdate")
                $("#frm").attr("method","post");
                $("#frm").submit();
            }
          })
    } else {
        alert("알수없는 오류가 발생하였습니다. 홈으로 이동합니다.");
        $("#formTag").submit()
        
    }
    });
};

function paysuccess(result){
    $(".container-fluid").html(result);
}
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