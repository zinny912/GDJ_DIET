
let htmlGuide="";
let pwUpCheckCount = [false,false];

function passwordGuide(){}

// $('.password-change1').change(()=>{
//     if(){
//         pwUpCheckCount[1] = false;
//     }else{pwUpCheckCount[1] = true;}
//     console.log(document.getElementById("password-change1").value.length)
// })

$('.password-change2').change(()=>{
    if(document.getElementById("password-change2").value.length<6 || document.getElementById("password-change2").value.length>14){
        pwUpCheckCount[1] = false;
        warn("(6~14자)", 2)
    }else{
        $('.member__input-guide-area2').empty();
        pwUpCheckCount[1] = true;
    }
    if($('.password-change3').val()!="" &&$('.password-change2').val()!=$('.password-change3').val()
    ){
        pwUpCheckCount[0] = false;
        warn("새 비밀번호가 일치하지 않습니다", 3)
    }else if (document.getElementById("password-change2").value.length>=6 && document.getElementById("password-change2").value.length<=14){
        $('.member__input-guide-area2').empty();
        pwUpCheckCount[0] = true;
        pwUpCheckCount[1] = true;
    }
})

$('.password-change3').change(()=>{
    if($('.password-change2').val()!="" &&$('.password-change2').val()!=$('.password-change3').val()
    ){
        pwUpCheckCount[0] = false;
        warn("새 비밀번호가 일치하지 않습니다", 3)
    }else{$('.member__input-guide-area3').empty(); pwUpCheckCount[0] = true;}

    if($('.password-change2').val()==$('.password-change3').val() && $('.password-change2').val()!="" &&$('.password-change3').val()!=""){
        $('.member__input-guide-area2').empty()
        pwUpCheckCount[0] = true;
    }
})


$('.password-change2').focus(()=>{
    if($('.password-change2').val()==""){
        warn_grey("(6~14자)",2)
    }
    // htmlGuide='<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">';
    // htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
    // htmlGuide=htmlGuide+'<span>영문/숫자/특수문자 2가지 이상 조합 (6~14자)</span></div>'

    // htmlGuide=htmlGuide+'<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">'
    // htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
    // htmlGuide=htmlGuide+'<span>3개 이상 연속되거나 동일한 문자/숫자 제외</span></div>'

    // htmlGuide=htmlGuide+'<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">'
    // htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
    // htmlGuide=htmlGuide+'<span>아이디(이메일) 제외</span></div>'

    // $('.member__input-guide-area2').html(htmlGuide)
})

$('.password-change3').focus(()=>{
    if($('.password-change3').val()==""){
        warn_grey("확인을 위해 새 비밀번호를 다시 입력해주세요",3)
    }

})

function warn_grey (message, area_num){
    let htmlGuide2='<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">';
    htmlGuide2=htmlGuide2+'<span><i class="icon-cross-gray"></i></span>'
    htmlGuide2=htmlGuide2+'<span>'+message+'</span></div>'
    $('.member__input-guide-area'+area_num).html(htmlGuide2)
}

$('.password-submit').click(()=>{
    let check=[false,false,false];
    //3개 중 하나라도 입력안할 경우
    if($('.password-change1').val()==""){
        warn("입력하세요", 1)
        check[0]=false
    }else{check[0]=true}
    if($('.password-change2').val()==""){
        warn("입력하세요", 2)
        check[1]=false
    }else{check[1]=true}
    if($('.password-change3').val()==""){
        warn("입력하세요", 3)
        check[2]=false
    }else{check[2]=true}

    console.log($('.password-change1').val())
    console.log(check)
    console.log(pwUpCheckCount)

    if(!check.includes(false) && !pwUpCheckCount.includes(false)){
        $.ajax({
            type:"POST",
            url:"/member/pwUpCheck",
            data:{
                pw:$('.password-change1').val(),
                pw2:$('.password-change2').val()
            },
            success : (res)=>{
                // console.log(res)
                if(res.trim()==2){
                    alert('원래비번과다르게..해요..')
                }else if(res.trim()==1){
    
                    //원래비밀번호 확인일치.
                    $('.member__input-guide-area1').empty();
                    $('.member__input-guide-area2').empty();
                    $('.member__input-guide-area3').empty();
                    passwordUpdate();
                }else{
                    warn("현재 비밀번호가 일치하지 않습니다",1)

                }
    
    
            },
            error : ()=>{
                console.log("머임?")
            }
        })
    }
})

function warn (message, area_num){
    let htmlGuide3='<div class="member__input-guide-line member__input-guide-line" style="color: red;font-size: 12px;">';
    htmlGuide3=htmlGuide3+'<span><i class="icon-cross-gray"></i></span>'
    htmlGuide3=htmlGuide3+'<span>'+message+'</span></div>'
    $('.member__input-guide-area'+area_num).html(htmlGuide3)
}

function passwordUpdate(){
    $.ajax({
        type:"POST",
        url:"/member/pwChange",
        data:{
            pw:$('.password-change2').val(),
            id:$('#originId').val(),
        },        
        success : (res)=>{
            console.log(res)
            if(res.trim()){
                alert('비번업데이트성공')
                // location.href="./update"
                document.getElementById('pwUpdateForm').reset();
                check=false
            }
        },
        error : ()=>{
            console.log("머임2?")
        }

    })

}

$('.usermodify-cancel').click(()=>{
    location.href="/"
})


//뒤로가기 했을 때.
// history.pushState(null, null, '');
window.onpageshow = function(event) {
    if (event.persisted) {
        location.href="/"
        alert("잘못된 접근");

    }
}