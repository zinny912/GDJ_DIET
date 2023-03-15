


//연결 초기화
Kakao.init('b33abf940795b63ab2232ec9938a6b80');
Kakao.isInitialized();

// SDK 초기화 여부를 판단
console.log(Kakao.isInitialized());

//카카오로그인 버튼 누르면 호출
function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
    });
  }

// 3. 데모버전으로 들어가서 카카오로그인 코드를 확인.
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            console.log(authObj); // access토큰 값
            Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

            getInfo();

            location.href="./dummiHome"
        },
        fail: function (err) {
            console.log(err);
        }
    });
}


// 4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
            // 이메일, 성별, 닉네임, 프로필이미지
            var email = res.kakao_account.email;
            // var gender = res.kakao_account.gender;
            var nickname = res.kakao_account.profile.nickname;
            var kakao_id = res.id
            // var profile_image = res.kakao_account.profile.thumbnail_image_url;

            // console.log(email, gender, nickname, profile_image);
            console.log(email, nickname);

            // $('#id').val(email)
            // $('#pw').val(kakao_id)
            // $('#address').val(email)
            // $('#submitBtn').attr("type", "submit")
            // $('#submitBtn').click();
        },
        fail: function (error) {
            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
        }
    });
}

// 5. 로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행.
function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
        alert('Not logged in.');
        return;
    }
    Kakao.Auth.logout(function() {
        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
    });
}

// //뿌리기
// infoinfo()
// function infoinfo(){
//     Kakao.API.request({
//         url: '/v2/user/me',
//         success: function (res) {
//             console.log(res);
//             // 이메일, 성별, 닉네임, 프로필이미지
//             var email = res.kakao_account.email;
//             // var gender = res.kakao_account.gender;
//             var nickname = res.kakao_account.profile.nickname;
//             // var profile_image = res.kakao_account.profile.thumbnail_image_url;

//             // console.log(email, gender, nickname, profile_image);
//             console.log(email, nickname);
//             $('#kakao-id').text(email);
//         },
//         fail: function (error) {
//             alert('카카오 정보없... 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
//         }
//     });

// }