


function modalMemberDelete(){

    $.ajax({
        type:"POST",
        url:"/member/delete",
        data:{
            
        },
        success:function(res){
            if(res.trim()>0){
                kakaoDelete()
                console.log("res: "+res)
                $('#modalClose').click()
                location.href="./dummiHome"
            }
        }

    })

}