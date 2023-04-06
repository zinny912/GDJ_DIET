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
    amount : 100,
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
    console.log(rsp);
    if (rsp.success) {
        console.log(rsp);
    } else {
        console.log(rsp);
    }
    });
};