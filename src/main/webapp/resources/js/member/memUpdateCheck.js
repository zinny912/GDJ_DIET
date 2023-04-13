


$('#sbmBtnUpChk').click(()=>{
    console.log($('.usermodify-auth-password-tf').val())

    $.ajax({
        type:"post",
        url:"/member/login",
        data:{
            id:$('#ChkId').text(),
            pw:$('.usermodify-auth-password-tf').val()
        },
        success:(res)=>{
            console.log(res.trim())
            if(res.trim()=="0"){
                $('.form-err').text($('.usermodify-auth-password-tf').attr("data-errmsg"))
                $('.form-err').attr("style","color: red;")
                console.log("에러메시지")
            }else{
                location.href="/member/update2"
                console.log("굳")
            }
        },
        error:()=>{
            console.log("안댐")
        }

    })
})