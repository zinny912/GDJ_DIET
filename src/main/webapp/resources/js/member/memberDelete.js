


function modalMemberDelete(){
    kakaoDelete()
    $.ajax({
        type:"POST",
        url:"/member/delete",
        data:{
            
        },
        success:function(res){
            console.log(res.trim())
            if(res.trim()>0){
                
                console.log("res: "+res)
                $('#modalClose').click()
                location.href="/"
            }
        }

    })

}