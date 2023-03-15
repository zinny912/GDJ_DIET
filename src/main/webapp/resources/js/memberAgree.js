
let checkCount = [];
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

	fetch("/member/agree", {
		method:"get",
	}).then((response)=> response.text()) // (response)=> {return response.text()}
	.then((res)=> {
		// console.log(res)
		$('.modal-body').text(res)
	})
	//예외 발생시 처리
	.catch(()=>console.log('에러 발생'))
}

$('#modalSubmit').click(()=>{
	$('.form-check-input').attr("checked", "checked")
	$('#modalCancel').click();
})

//@회원가입버튼
$('#joinBtn').click(()=>{
	if(! $('.form-check-input').attr("checked")=="checked"){
		alert("약관동의점..")

	}else if(checkCount.includes(false)){
		alert("필수정보 입력점")
	}else{
		$('#joinBtn').attr("type", "submit")
	}

})

//@idCheck
$('#id').blur(()=>{
	console.log($('#id').val())
	fetch('/member/check', {
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
			$('#idLabel').text("사용가능 아이디")
			console.log('사용가능 아이디')
			checkCount[0]=true;

		}else if(res.trim()=="중복아이디"){
			// $('#idLabel').prop("hidden", "false")
			$('#idLabel').prop("class", "form-label redResult")
			$('#idLabel').text("아이디 중복")
			console.log('아이디 중복')
			checkCount[0]=false;
		}else{
			$('#idLabel').prop("class", "form-label redResult")
			$('#idLabel').text("필수정보")
			checkCount[0]=false;
		}
	})

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
		$('#passwordLabel').text('6자리 이상 14이하')
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
		$('#passwordCheckLabel').text('비밀번호가 다름')
		$('#passwordCheckLabel').prop("class", "form-label redResult")
		checkCount[1]=false;
	}else if(passwordCheck.value!=""&&password.value==passwordCheck.value){
		$('#passwordCheckLabel').text("")
		checkCount[1]=true;
	}
})
$('#passwordCheck').blur(()=>{
	if(password.value!=passwordCheck.value){
		$('#passwordCheckLabel').text('비밀번호가 다름')
		$('#passwordCheckLabel').prop("class", "form-label redResult")
		checkCount[1]=false;
	}else{
		$('#passwordCheckLabel').text("")
		checkCount[1]=true;
	}
})