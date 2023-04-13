
$('#submitBtnJoin').click(()=>{
    swal('구디다이어트', '회원가입Go!', 'info')
    .then(function() {
        location.href="./join";
      })

});



$('#submitBtnLogin').click(()=>{
    enter_or_click ()



})


$(document).on("keyup",function(key){
    if(key.keyCode==13) {
        enter_or_click ()
    }
});

function enter_or_click (){
    console.log($('#id').val())

    // $.ajax({
    //     type:"POST",
    //     url:"/member/login",
    //     data:{
    //         id:$('#id').val(),
    //         pw:$('#password').val()
    //     },
    //     success:function(){
    //         location.href="/member/dummiHome";
    //     },
    //     error:function(res){
    //         // alert(res);    
    //         console.log(res.trim());
    //     }
    // })

    fetch("/member/login",{
        method:'POST',
        headers:{"Content-type":"application/x-www-form-urlencoded"},
        body:"id="+$('#id').val()+"&pw="+$('#password').val(),
    }).then((response)=>{
        return response.text();
    }).then((res)=>{
        console.log(res.trim())
        if(res.trim()=="0"){
            swal('아이디 와 패스워드가 불일치 합니다 ', '확인 후 재시도 해주세요', 'error');
        }else{
            location.href="/";
        }
    })
}

//뒤로가기 했을 때.
// history.pushState(null, null, '');
window.onpageshow = function(event) {
    if (event.persisted) {

        location.href="/member/login"

        // // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
        // // 이벤트 추가하는 곳
        // console.log('back button event4');

		// document.getElementById('loginForm').reset();
        // document.getElementById('kloginForm').reset();
        


        // $('#when_back').attr("data-sessionMember",'')
        // if($('#when_back').attr("data-sessionMember")!=""||$('#when_back').attr("data-sessionMember")!=null){
        //     // location.href="/";
        //     // alert("이미로그인함");
        // }

    }
}