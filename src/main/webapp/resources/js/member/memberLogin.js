

$('#submitBtn').click(()=>{

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
        if(res.trim()=="id/pw불일치"){
            alert('id/pw 불일치')
        }else{
            location.href="./dummiHome";
        }
    })

})