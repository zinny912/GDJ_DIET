let verificationChecked="";
let checkCount = [];
let formCheckInput=document.getElementsByClassName('form-check-input')
// $('#terms').click(()=>{


// 	fetch('member/agree', {
// 			method:"get",
// 	})
// 	//응답객체에서 Data 추출
// 	.then((response)=> response.text()) // (response)=> {return response.text()}
// 	//추출한 Data 사용
// 	.then((res)=> console.log(res))
// 	//예외 발생시 처리
// 	.catch(()=>console.log('에러 발생'))
	
// })


//@약관동의창
function mAgree(){

	$('#modalBtn').click()

	// fetch("/member/agree", {
	// 	method:"get",
	// }).then((response)=> response.text()) // (response)=> {return response.text()}
	// .then((res)=> {
	// 	// console.log(res)
	// 	$('.modal-body').text(res)
	// })
	// //예외 발생시 처리
	// .catch(()=>console.log('에러 발생'))

}

$('#modalSubmit').click(()=>{
	$('.form-check-input').prop("checked", true)
	$('#modalClose').click();
})
$('#modalCancel').click(()=>{
	$('.form-check-input').prop("checked", false)
	// formCheckInput.checked=false;
	// $('.form-check-input').checked=false
})



//@idCheck
function idCheck(){
	fetch('/member/idCheck', {
		method:"POST",
		headers:{"Content-type":"application/x-www-form-urlencoded"},
		body:"id="+$('#id').val(),
	}).then((response)=>{

		return response.text()
	})
	.then((res)=>{

		if(res.trim()=="사용가능"){
			// $('#idLabel').prop("hidden", "false")
			$('#idLabel').prop("class", "form-label blueResult")
			$('#idLabel').text("사용가능한 아이디입니다.")
			console.log('사용가능 아이디')
			checkCount[0]=true;

		}else if(res.trim()=="중복아이디"){
			// $('#idLabel').prop("hidden", "false")
			$('#idLabel').prop("class", "form-label redResult")
			$('#idLabel').text("이미 등록된 아이디 입니다.")
			console.log('아이디 중복')
			checkCount[0]=false;
		}else{
			$('#idLabel').prop("class", "form-label redResult")
			$('#idLabel').text("필수입력사항입니다.")
			checkCount[0]=false;
		}
	})
}

$('#id').blur(()=>{
	console.log($('#id').val())

	idCheck()


})


//@pwCheck
let password = document.getElementById('password')
let passwordCheck = document.getElementById('passwordCheck')
// password.addEventListener('blur', function(){
// 	if(password.value.length<7||password.value.length>15){
// 		console.log('6자리 이상 14이하')
// 	}
	   
// })

$('#password').blur(()=>{

   // if(password.value == null){
   // 	$('#passwordLabel').text('필수입력')
   // 	$('#passwordLabel').prop("class", "form-label redResult")
   // 	checkCount[1]=false;
   // }

   if(password.value.length<6 || password.value.length>14){
	   $('#passwordLabel').text('비밀번호는 6자리 이상 14이하로 설정가능합니다.')
	   $('#passwordLabel').prop("class", "form-label redResult")
	   checkCount[1]=false;
   }else{
	   $('#passwordLabel').text("")
	   checkCount[1]=true;
   }
})

//@pw재확인
$('#password').change(()=>{
   if(passwordCheck.value!=""&&password.value!=passwordCheck.value){
	   $('#passwordCheckLabel').text('비밀번호가 일치하지 않습니다.')
	   $('#passwordCheckLabel').prop("class", "form-label redResult")
	   checkCount[3]=false;
   }else if(passwordCheck.value!=""&&password.value==passwordCheck.value){
	   $('#passwordCheckLabel').text("")
	   checkCount[3]=true;
   }
})
$('#passwordCheck').blur(()=>{
   if(password.value!=passwordCheck.value){
	   $('#passwordCheckLabel').text('비밀번호가 일치하지 않습니다.')
	   $('#passwordCheckLabel').prop("class", "form-label redResult")
	   checkCount[4]=false;
   }else{
	   $('#passwordCheckLabel').text("")
	   checkCount[4]=true;
   }
})


//---------------------------- Email ---------------------------//
//이메일 형식 xx@xx.xx
function validateEmail(email) {
	const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	return regex.test(email);
  }

  //도중에 email이 조작되고, 인증받은 이메일과 틀릴 때.
$('#email').change(()=>{
	if(verificationChecked!=$('#email').val()){
		checkCount[2]=false;
	}else if(verificationChecked==$('#email').val()){ //같을때
		checkCount[2]=true;
	}
})

$('#verification_re').click(()=>{

	if(validateEmail($('#email').val())){
		verificationChecked=$('#email').val();
		verificationRe()
	}else{
		alert('email 형식이 다릅니다.')
	}



	
})

// console.log($('#email').attr('id'))
//@emailCheck
// $('#email').blur(()=>{
// 	// console.log($('#email').val())
// 	fetch('/member/emailCheck', {
// 		method:"POST",
// 		headers:{"Content-type":"application/x-www-form-urlencoded"},
// 		body:"email="+$('#email').val(),
// 	}).then((response)=>{

// 		return response.text()
// 	})
// 	.then((res)=>{

// 		$('#emailLabel').remove()
// 		$('#emailDiv').after('<label class=" form-label" id="emailLabel" for="email"></label>')
		
// 		if(res.trim()=="사용가능"){


// 			// //이메일 인증 form
// 			// $('#emailSendDiv').remove()
// 			// let emailSendDiv = '<div id="emailSendDiv" class="hstack gap-3">';
// 			// emailSendDiv=emailSendDiv+'<input class="col form-control " type="text" placeholder="인증번호">'
// 			// emailSendDiv=emailSendDiv+'<button type="button" class="col-2 btn btn-secondary text-nowrap">제출</button>'
// 			// emailSendDiv=emailSendDiv+'<div class="vr "></div>'
// 			// emailSendDiv=emailSendDiv+'<button type="button" class="col-2 btn btn-outline-danger text-nowrap">다시</button>'
// 			// emailSendDiv=emailSendDiv+'</div>'
// 			// $('#emailDiv').after(emailSendDiv)

			
// 			console.log($('#email').val())
// 			//인증메시지를 보낸 이메일주소 저장
// 			verificationChecked=$('#email').val();

// 			////이메일 보내기
// 			// $.get("/member/verificationCode?emailVer="+$('#email').val(), function(res){

// 			// 	if(res==1){

					
// 			// 		$('#emailLabel').prop("class", "form-label blueResult")
// 			// 		$('#emailLabel').text("보냈어용^^ "+$('#email').attr('id'))
// 			// 	}
// 			// })

// 			// console.log('사용가능 '+$('#email').attr('id'))
// 			// checkCount[0]=true;


// 		}else if(res.trim()=="중복"){
// 			// $('#idLabel').prop("hidden", "false")
// 			$('#emailLabel').prop("class", "form-label redResult")
// 			$('#emailLabel').text($('#email').attr('id')+" 중복")
// 			console.log('중복'+$('#email').attr('id'))
// 			checkCount[2]=false;
// 		}else{
// 			$('#emailLabel').prop("class", "form-label redResult")
// 			$('#emailLabel').text("필수정보")
// 			checkCount[2]=false;
// 		}
// 	})

// })




function verificationRe(){

	$('#verification_re').attr("disabled","disabled")

	$.get("/member/verificationCode?emailVer="+$('#email').val(), function(res){
		if(res==1){
			$('#emailDiv').after('<label class=" form-label" id="emailLabel" for="email"></label>')
			$('#emailLabel').prop("class", "form-label blueResult")
			$('#emailLabel').text("이메일로 전송된 인증번호를 확인해주세요 "+$('#email').attr('id'))

			$('#verification_re').removeAttr("disabled")
		}
	})

	// $.get("/member/verificationCode", function(res){
	// 	if(res==1){
	// 		$('#emailLabel').remove()
	// 		$('#emailDiv').after('<label class=" form-label" id="emailLabel" for="email"></label>')
	// 		$('#emailLabel').prop("class", "form-label blueResult")
	// 		$('#emailLabel').text("다시 보냈어용^^ "+$('#email').attr('id'))
	// 	}
	// })

}



function verificationSubmit(){
	$.get("/member/verificationCodeCheck?verificationCode="+$('#verification_val').val(), function(res){
		console.log(res)
		if(res.trim()=="yes"){
			$('#verificationLabel').remove()
			$('#verification_div').after('<label class=" form-label" id="verificationLabel"></label>')
			$('#verificationLabel').prop("class", "form-label blueResult")
			$('#verificationLabel').text("인증번호가 일치합니다."+$('#email').attr('id'))
			checkCount[2]=true;//바까...
			
		}else{
			$('#verificationLabel').remove()
			$('#verification_div').after('<label class=" form-label" id="verificationLabel"></label>')
			$('#verificationLabel').prop("class", "form-label redResult")
			$('#verificationLabel').text("인증번호가 일치하지 않습니다.")
			checkCount[2]=false;
			

		}
	})
}




//@회원가입버튼
$('#submitBtn').click(()=>{
	console.log("체크박스값: "+$('.form-check-input').is(':checked'))

	idCheck() //아이디첵한번더

	if($('.form-check-input').is(':checked')==false){
		swal('회원가입 시', '약관동의가 필요합니다', 'warning')
    	.then(function() {
			location.href="/member/join";
		});

	}else if(checkCount.includes(false)){
		alert("필수입력사항입니다.")
		if(checkCount[2]=false){
			$('#verificationLabel').remove()
			$('#verification_div').after('<label class=" form-label" id="verificationLabel"></label>')
			$('#verificationLabel').prop("class", "form-label redResult")
			$('#verificationLabel').text("이메일 중간에 바뀜")
		}
	}
	else{
		$('#submitBtn').attr("type", "submit")
		//input val비우기.
		$('.form-control').removeAttr("value")
		$('#emailLabel').remove()
	}

})
//뒤로가기 했을 때.
// history.pushState(null, null, '');
window.onpageshow = function(event) {
    if (event.persisted) {
        // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
        // 이벤트 추가하는 곳
        console.log('back button event5');

		document.getElementById('login_form').reset();
		$('#emailLabel').remove()
		$('#idLabel').text("")
		checkCount=false;
		console.log(checkCount);
    }
}