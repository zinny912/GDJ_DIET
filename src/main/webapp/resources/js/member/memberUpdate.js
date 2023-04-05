
let htmlGuide="";
let pwUpCheckCount = [];

function passwordGuide(){}

$('.password-change3').change(()=>{
    if($('.password-change3').val()!=""&&$('.password-change2').val()!=$('.password-change3').val()
    ){
        pwUpCheckCount[0] = false;
        htmlGuide='<div class="member__input-guide-line member__input-guide-line" style="color: red;font-size: 12px;">';
        htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
        htmlGuide=htmlGuide+'<span>새 비밀번호가 일치하지 않습니다.</span></div>'
        $('.member__input-guide-area2').html(htmlGuide)
    }
})

$('.password-change2').click(()=>{

    htmlGuide='<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">';
    htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
    htmlGuide=htmlGuide+'<span>영문/숫자/특수문자 2가지 이상 조합 (6~14자)</span></div>'

    htmlGuide=htmlGuide+'<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">'
    htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
    htmlGuide=htmlGuide+'<span>3개 이상 연속되거나 동일한 문자/숫자 제외</span></div>'

    htmlGuide=htmlGuide+'<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">'
    htmlGuide=htmlGuide+'<span><i class="icon-cross-gray"></i></span>'
    htmlGuide=htmlGuide+'<span>아이디(이메일) 제외</span></div>'

    $('.member__input-guide-area2').html(htmlGuide)
})

$('.password-change3').click(()=>{

    let htmlGuide2='<div class="member__input-guide-line member__input-guide-line" style="color: gray;font-size: 12px;">';
    htmlGuide2=htmlGuide2+'<span><i class="icon-cross-gray"></i></span>'
    htmlGuide2=htmlGuide2+'<span>확인을 위해 새 비밀번호를 다시 입력해주세요.</span></div>'

    $('.member__input-guide-area3').html(htmlGuide2)
})

$('.password-submit').click(()=>{
    let check=false;
    //3개 중 하나라도 입력안할 경우
    if($('.password-change1').val()==""){
        warn("입력하세요", 1)
        check=false
    }if($('.password-change2').val()==""){
        warn("입력하세요", 2)
        check=false
    }if($('.password-change3').val()==""){
        warn("입력하세요", 3)
        check=false
    }

    console.log($('.password-change1').val())
    console.log(check)
    if(!check==false){
        $.ajax({
            type:"POST",
            url:"/member/pwUpCheck",
            data:{
                pw:$('.password-change1').val()
            },
            success : (res)=>{
                // console.log(res)
                if(res.trim()==1 && !pwUpCheckCount.includes(false)){
    
                    //원래비밀번호 확인일치.
                    $('.member__input-guide-area1').remove();
                    passwordUpdate();
    
                }else{
                    let htmlGuide3='<div class="member__input-guide-line member__input-guide-line" style="color: red;font-size: 12px;">';
                    htmlGuide3=htmlGuide3+'<span><i class="icon-cross-gray"></i></span>'
                    htmlGuide3=htmlGuide3+'<span>현재 비밀번호가 일치하지 않습니다.</span></div>'
                    $('.member__input-guide-area1').html(htmlGuide3)
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
                location.href="./update"
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